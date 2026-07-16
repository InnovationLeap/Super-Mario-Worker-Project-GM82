//mm_play_ext(file,looptime)
//占用全局变量global.musicplay global.musicfile global.musiclooptime
//指定一个文件 file 并播放
//全局只支持播放一个
//looptime<=0 表示无限循环，否则循环 looptime 次
//你说小数会怎么样？你看看代码就知道了（
//无限循环你写哪都没问题
//有限循环请确保一直在执行，也就是说给我放到 step 或者 draw 里面去（
//然后关于 return
//无限循环的话 只要成功播放就会 return 1
//有限循环在播放完毕之后才会 return 1 ，否则 return 0
//顺便你要强行 stop 的话，别忘了加上 global.musiclooptime = 0
//啊有限循环写法比较麻烦我这里示范一下：
/*

//撞到音乐物件开始播放音乐 这里用了一个变量
if instance_place(x,y,o_music) { musicplay=1 }

//这里是播放段; musicplay = 1 时播放
if musicplay = 1
  {
    var play;
    play = mm_play_ext('\hele.mp3',3)
if play = 1 { musicplay=0 }
  }

*/


//我废话真多（ 下面是代码

//防止你们有人用小数当参数（
var loop;
loop = floor(argument1)

//先做无限循环
if global.musicfile2 != argument0 && loop <=0
  {
    //先释放掉正在播的
    mm_music_free(global.musicplay2)
    //加载音乐
    global.musicplay2 = mm_music_load(argument0,true)
    //播放音乐
    mm_play(global.musicplay2)
    //记录正在播放的文件
    global.musicfile2 = argument0
//返回 1 以表明正常工作
return 1;
  }

//然后是有限循环的处理

//第一次播放
if global.musicfile2 != argument0 && loop > 0 && global.musiclooptime2 = 0
  {
    //先释放掉正在播的
    mm_music_free(global.musicplay2)
    //加载音乐
    global.musicplay2 = mm_music_load(argument0,false)
    //播放音乐
    mm_play(global.musicplay2)
    //记录正在播放的文件
    global.musicfile2 = argument0
    //循环用
    global.musiclooptime2 = 1
  }

//然后处理循环

//这里直接利用音乐位置来处理
if global.musiclooptime2 > 0 && global.musiclooptime2 <= loop && mm_get_position(global.musicplay2) >= mm_get_length(global.musicplay2)
  {
    //回到开始位置
    mm_set_position(global.musicplay2,0)
    //循环+1
    global.musiclooptime2 += 1
  }

//循环结束
if global.musiclooptime2 > 0 && global.musiclooptime2 > loop && mm_get_position(global.musicplay2) >= mm_get_length(global.musicplay2)
  {
    //停止音乐
    mm_stop(global.musicplay2)
//释放音乐
mm_free(global.musicplay2)
    //循环重置
    global.musiclooptime2 = 0
//return 1 表示播放完毕
return 1;
  }

//这里处理return
if global.musiclooptime2 > 0
  {
    if global.musiclooptime2 <= loop+1 { return 0; }
  }
