// ed_net_ops_send_file()
// 全量关卡文件同步（op23）：把当前关卡保存为临时 .smwl 并分块传输
// 对端写入临时文件 → Load_Script_Main() 全量重建（尺寸/网格/实例/设置完整一致）→ 删除临时文件
// 与 op22 手工序列化相比：文件方案覆盖 w/h 尺寸与全部字段，且分块传输规避 buffer 大小风险
// 消息格式：
//   头消息  ：u8=23 | u8=0 | u32 总字节数
//   数据消息：u8=23 | u8=1 | u16 块字节数 | <块字节数 字节数据>
var _fname, _fid, _total, _sent, _chunk, _i, _bak_save, _bak_cs;
_fname = working_directory + '.\temp\NetSync_send.smwl'
if file_exists(_fname) {
    file_delete(_fname)
}
_bak_save = global.autosavename
_bak_cs = global.compress_save
global.autosavename = _fname
global.compress_save = 1
global.donottemp = 1
// 必须在 o_edmain 上下文保存：Save_Script_Blocks 使用裸 arrayetapu（依赖 self），
// 握手路径从 o_ednet 调用时会读到未定义变量导致 blocks 全部写空
if instance_exists(o_edmain) {
    with(o_edmain) {
        Save_Script_Main()
    }
}
global.autosavename = _bak_save
global.compress_save = _bak_cs
if !file_exists(_fname) {
    ed_net_trace('S23 save failed')
    exit
}
if instance_exists(o_ednet) && o_ednet.net_state = 3 {
    _total = file_size(_fname)
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 23)
    buffer_write_u8(o_ednet.net_sendbuf, 0)
    buffer_write_u32(o_ednet.net_sendbuf, _total)
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    _fid = file_bin_open(_fname, 0)
    _sent = 0
    while _sent < _total {
        _chunk = _total - _sent
        if _chunk > 8000 {
            _chunk = 8000
        }
        buffer_clear(o_ednet.net_sendbuf)
        buffer_set_pos(o_ednet.net_sendbuf, 0)
        buffer_write_u8(o_ednet.net_sendbuf, 23)
        buffer_write_u8(o_ednet.net_sendbuf, 1)
        buffer_write_u16(o_ednet.net_sendbuf, _chunk)
        for (_i = 0; _i < _chunk; _i += 1) {
            buffer_write_u8(o_ednet.net_sendbuf, file_bin_read_byte(_fid))
        }
        socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
        _sent += _chunk
    }
    file_bin_close(_fid)
    socket_send(o_ednet.net_sock)
    file_delete(_fname)
    ed_net_trace('S23 file total=' + string(_total))
}
