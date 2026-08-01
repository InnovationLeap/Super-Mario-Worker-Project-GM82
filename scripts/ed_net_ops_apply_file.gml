// ed_net_ops_apply_file(buf)
// 应用 op23 关卡文件同步（o_ednet 上下文）：分块写入临时 .smwl，收满后 Load_Script_Main 重建并删除
// 消息格式（与 send_file 严格一致）：
//   头消息  ：u8=23 | u8=0 | u8 source_id | u32 总字节数
//   数据消息：u8=23 | u8=1 | u8 source_id | u16 块字节数 | <块字节数 字节数据>
// 收满后：file_bin_close → autosavename 指向临时文件 → Load_Script_Main()（GZ 解压/读 w/h/room_restart 全量重建）
//         → file_delete 临时 .smwl 与解压出的 .smwlx → 恢复 autosavename → rebuild_ids
// 3+ 人屏障：net_file_active 在接收期间置 1（handle_message 据此丢弃增量 op16-21），重建完成后置 0
// 测关中（无 o_edmain / testmode=1）：不立即重建，标记 net_pending_reload，回编辑器后补全量
var _sub, _chunk, _i, _b, _save1;
_sub = buffer_read_u8(argument0)
buffer_read_u8(argument0)
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
    net_file_active = 1
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
            // 收满：关闭文件
            file_bin_close(net_file_fid)
            net_file_fid = -1
            if instance_exists(o_edmain) {
                if variable_global_exists('testmode') {
                    if global.testmode = 1 {
                        // 测关中：不重建，标记待重载（回编辑器后补全量）
                        net_pending_reload = 1
                        net_file_active = 0
                        ed_net_trace('R23 file deferred (testmode)')
                        if file_exists(net_file_path) {
                            file_delete(net_file_path)
                        }
                        exit
                    }
                }
                // 正常：全量重建
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
                net_file_active = 0
                ed_net_trace('R23 file applied total=' + string(net_file_total))
            } else {
                // 无 o_edmain（非编辑器房间）：标记待重载
                net_pending_reload = 1
                net_file_active = 0
                ed_net_trace('R23 file deferred (no edmain)')
                if file_exists(net_file_path) {
                    file_delete(net_file_path)
                }
            }
        }
    }
}
