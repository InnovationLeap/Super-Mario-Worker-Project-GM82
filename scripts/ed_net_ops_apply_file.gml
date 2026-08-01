// ed_net_ops_apply_file(buf)
// 应用 op23 关卡文件同步（o_ednet 上下文）：分块写入临时 .smwl，收满后 Load_Script_Main 重建并删除
// 消息格式（与 send_file 严格一致）：
//   头消息  ：u8=23 | u8=0 | u32 总字节数
//   数据消息：u8=23 | u8=1 | u16 块字节数 | <块字节数 字节数据>
// 收满后：file_bin_close → autosavename 指向临时文件 → Load_Script_Main()（GZ 解压/读 w/h/room_restart 全量重建）
//         → file_delete 临时 .smwl 与解压出的 .smwlx → 恢复 autosavename → rebuild_ids
var _sub, _chunk, _i, _b, _save1;
_sub = buffer_read_u8(argument0)
if _sub = 0 {
    // 头消息：初始化接收状态
    if net_file_fid >= 0 {
        file_bin_close(net_file_fid)
        net_file_fid = -1
    }
    net_file_total = buffer_read_u32(argument0)
    net_file_got = 0
    net_file_path = working_directory + '.\temp\NetSync_recv_' + string(net_myid) + '.smwl'
    if file_exists(net_file_path) {
        file_delete(net_file_path)
    }
    net_file_fid = file_bin_open(net_file_path, 1)
    ed_net_trace('R23 file start total=' + string(net_file_total))
}
if _sub = 1 {
    if net_file_fid >= 0 {
        _chunk = buffer_read_u16(argument0)
        _b = 0
        while _b < _chunk {
            file_bin_write_byte(net_file_fid, buffer_read_u8(argument0))
            _b += 1
        }
        net_file_got += _chunk
        if net_file_got >= net_file_total {
            // 收满：关闭并全量重建
            file_bin_close(net_file_fid)
            net_file_fid = -1
            _save1 = global.autosavename
            global.autosavename = net_file_path
            Load_Script_Main()
            if file_exists(net_file_path) {
                file_delete(net_file_path)
            }
            if file_exists(filename_change_ext(net_file_path, '.smwlx')) {
                file_delete(filename_change_ext(net_file_path, '.smwlx'))
            }
            global.autosavename = _save1
            ed_net_rebuild_ids()
            ed_net_trace('R23 file applied total=' + string(net_file_total))
        }
    }
}
