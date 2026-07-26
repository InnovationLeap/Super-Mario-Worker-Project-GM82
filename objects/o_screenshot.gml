#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.screenshot_count = 100
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(global.key_f9){
    var sshot_fname;
    sshot_fname = working_directory + '\screenshot' + string(global.screenshot_count) + '.png'
    while (file_exists(sshot_fname)){
        global.screenshot_count += 1
        sshot_fname = working_directory + '\screenshot' + string(global.screenshot_count) + '.png'
    }
    screen_save(sshot_fname)
    global.screenshot_count += 1
}
