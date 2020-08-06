module encryption(data,key,out);
input [127:0] data,key;
output [127:0] out;
wire [127:0] out0,out1,out2,out3,out4,out5,out6,out7,out8;
wire [127:0] sb0,sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9;
wire [127:0] sr0,sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8,sr9;
wire [127:0] mixcol0,mixcol1,mixcol2,mixcol3,mixcol4,mixcol5,mixcol6,mixcol7,mixcol8;
wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
wire [127:0] pr_key;

//code to generate round keys
round_key11 r1(key,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);
assign pr_key = data^key;

//Round1
sub_byte s0(pr_key,sb0);
shift_row s00(sb0,sr0);
mix_col  m0(sr0,mixcol0);
assign out0 = mixcol0 ^ key1;

//Round2
sub_byte s1(out0,sb1);
shift_row s01(sb1,sr1);
mix_col  m1(sr1,mixcol1);
assign out1 = mixcol1 ^ key2;

//Round3
sub_byte s2(out1,sb2);
shift_row s02(sb2,sr2);
mix_col  m2(sr2,mixcol2);
assign out2 = mixcol2 ^ key3;

//Round4
sub_byte s3(out2,sb3);
shift_row s03(sb3,sr3);
mix_col  m3(sr3,mixcol3);
assign out3 = mixcol3 ^ key4;

//Round5
sub_byte s4(out3,sb4);
shift_row s04(sb4,sr4);
mix_col  m4(sr4,mixcol4);
assign out4 = mixcol4 ^ key5;

//Round6
sub_byte s5(out4,sb5);
shift_row s05(sb5,sr5);
mix_col  m5(sr5,mixcol5);
assign out5 = mixcol5 ^ key6;

//Round7
sub_byte s6(out5,sb6);
shift_row s06(sb6,sr6);
mix_col  m6(sr6,mixcol6);
assign out6 = mixcol6 ^ key7;

//Round8
sub_byte s7(out6,sb7);
shift_row s07(sb7,sr7);
mix_col  m7(sr7,mixcol7);
assign out7 = mixcol7 ^ key8;

//Round9
sub_byte s8(out7,sb8);
shift_row s08(sb8,sr8);
mix_col  m8(sr8,mixcol8);
assign out8 = mixcol8 ^ key9;

//Round10
sub_byte s9(out8,sb9);
shift_row s09(sb9,sr9);//no mix column
assign out = sr9 ^ key10;

endmodule
