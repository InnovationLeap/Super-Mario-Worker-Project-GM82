/*
**********************************************
************File Encryption System************
**********Written by: Kevin Haroldsen*********
**********************************************

Use this to encrypt/decrypt a file using XOR encryption.
It can be used to prevent editing of save files, or for other things.


Arguments:

The First Argument is the file you want to encrypt. Use a full path.
Make sure it is a string.

The Second Argument is the encryption key. It must be a string.
It can be as long as you want. Longer is more secure.


How it works:
The script generates a key based on the key you provide and the game id.
It then goes through the file and encrypts each byte using xor encryption,
rotating through the key. By rotating through the key, two identical letters next
to each other will not be look the same when encrypted. Sometimes the file is encrypted
enough that it is interpreted as Japanese in notepad- seeing it as Unicode.


How XOR encryption works:

XOR is a logic gate. The are 8 logic gates-AND,OR,XOR,YES,NAND,NOR,NXOR,and NOT.

When you enter values into a logic gate, it returns a value. All return either 0 or 1.
0 or 1 can mean No or Yes, False or True, or some others.

XOR generally allows you to input two values. If those values are the same, it will output 0.
Otherwise it will output 1.

Here is a truth table for XOR:
 ____________________
|Input1|Input2|Output|
|______|______|______|
|   0  |   0  |   0  |
|______|______|______|
|   1  |   0  |   1  |
|______|______|______|
|   0  |   1  |   1  |
|______|______|______|
|   1  |   1  |   0  |
|______|______|______|

This is simple boolean XOR.

Binary XOR uses boolean XOR to edit its values. With binary xor, it's almost like it's an operand like
addition or multiplication.

First of all, binary is a base 2 number system only using 0 and 1. It is what computers use.
Counting from 0 from 5 is
0
1
10
11
100
101
This is the binary system. With computers, a bit is a 0 or a 1. a byte is a group of 8 bits.

Binary XOR edits a whole byte of data.
The number 106 is 01101010
The number 203 is 11001011

So... 106 xor 203 is:

    0   1   1   0   1   0   1   0
    |   |   |   |   |   |   |   |
   \|/ \|/ \|/ \|/ \|/ \|/ \|/ \|/
xor 1   1   0   0   1   0   1   1
    -------------------------------
    1   0   1   0   0   0   0   1

10100001 is 161.
So, 106 xor 203 is 161.

Each letter or number in a text file is a byte. For example, the letter Q is 1010001.
So if you xor 1010001 (Q)  with 1001011 (K), you get 11010, which is a right arrow mark.
Now if you xor 11010 with 1001011 (K), you get 1010001, which is Q. So, you can encrypt and decrypt with a key.




NOTE:
Files encrypted with this will only be correctly decrypted with the same game- or at least with the
same game id.

Written January 6th 2010
*/

//define all variables
var crypt_file,crypt_read,crypt_keypos,crypt_gmid,crypt_i,crypt_loops,crypt_key_len,crypt_tmp_path,crypt_tmp,crypt_src,crypt_cycle,crypt_t1,crypt_t2,crypt_xor,crypt_first_wrap,crypt_gp;

if !file_exists(argument0) then return (-1);

crypt_i=0;
crypt_keypos=0;
crypt_gmid='88888886';
crypt_read=0
crypt_file=0
crypt_loops=floor(string_length(string(game_id))*5)
crypt_key_len=0
crypt_cycle=0

if argument1 = 1
{
    crypt_key_len = get_crypt_key1()
}
if argument1 = 2
{
    crypt_key_len = get_crypt_key2()
}
// DBG: debug_log("DBG_key: len=" + string(crypt_key_len) + " val[0-4]=" + string(crypt_key_arr[0]) + "," + string(crypt_key_arr[1]) + "," + string(crypt_key_arr[2]) + "," + string(crypt_key_arr[3]) + "," + string(crypt_key_arr[4]))

repeat (5)
{
    crypt_gmid=crypt_gmid + crypt_gmid;
};

crypt_keypos=0
crypt_cycle=0
crypt_first_wrap=true

crypt_tmp_path = global.ascii_temp_path + "xor_tmp.bin"
crypt_tmp = file_bin_open(crypt_tmp_path, 1)
crypt_src = file_bin_open(argument0, 0)

// DBG: 检查 XOR 前源文件首字节
// crypt_t1 = file_bin_read_byte(crypt_src)
// crypt_t2 = file_bin_read_byte(crypt_src)
// file_bin_seek(crypt_src,0)
// debug_log("DBG_SRC_BEFORE: b0=" + string(crypt_t1) + " b1=" + string(crypt_t2))

repeat(file_bin_size(crypt_src))
{
    // gp = 56 正常，cycle%8==0 时返回 54（与 C 工具已验证公式一致）
    if (crypt_cycle > 0) && (crypt_cycle mod 8 == 0) then crypt_gp = 54 else crypt_gp = 56
    crypt_xor = crypt_gp ^ (crypt_key_arr[crypt_keypos] - floor(crypt_cycle/3))

    crypt_read = file_bin_read_byte(crypt_src)
    file_bin_write_byte(crypt_tmp, crypt_read ^ crypt_xor)

    // DBG: if crypt_cycle=0 && file_bin_position(crypt_src)=1
    // {
    //     debug_log("DBG_CYCLE0: crypt_xor=" + string(crypt_xor) + " key_arr[0]=" + string(crypt_key_arr[0]))
    // }

    // 推进计数器
    crypt_cycle += 1
    if crypt_cycle >= crypt_loops
    {
        crypt_cycle = 0
        crypt_keypos = 0
        if crypt_first_wrap
        {
            crypt_first_wrap = false
            if crypt_key_wrap_val >= 0
            {
                crypt_key_arr[0] = crypt_key_wrap_val
            }
        }
    }
    else
    {
        crypt_keypos += 1
        if crypt_keypos >= crypt_key_len then crypt_keypos = 0
    }
}

file_bin_close(crypt_src)
file_bin_seek(crypt_tmp, 0)

// DBG: 读取 XOR 解密后 gzip 头字节 2-9
// crypt_read = file_bin_read_byte(crypt_tmp)  // b0=0x1F magic (skip)
// crypt_read = file_bin_read_byte(crypt_tmp)  // b1=0x8B magic (skip)
// crypt_t1 = file_bin_read_byte(crypt_tmp)  // b2=compression method (should be 8)
// crypt_t2 = file_bin_read_byte(crypt_tmp)  // b3=flags
// crypt_i = file_bin_read_byte(crypt_tmp)  // b4=mtime
// crypt_xor = file_bin_read_byte(crypt_tmp)  // b5=mtime
// crypt_cycle = file_bin_read_byte(crypt_tmp)  // b6=mtime
// crypt_keypos = file_bin_read_byte(crypt_tmp)  // b7=mtime
// crypt_loops = file_bin_read_byte(crypt_tmp)  // b8=xflags
// crypt_key_len = file_bin_read_byte(crypt_tmp)  // b9=OS
// debug_log("DBG_HEADER: b2=" + string(crypt_t1) + " b3=" + string(crypt_t2) + " b4=" + string(crypt_i) + " b8=" + string(crypt_loops) + " b9=" + string(crypt_key_len))

file_bin_seek(crypt_tmp, 0)
file_bin_close(crypt_tmp)

file_delete(argument0)
file_copy(crypt_tmp_path, argument0)
file_delete(crypt_tmp_path)

return (1);
