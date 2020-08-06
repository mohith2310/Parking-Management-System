module mix_col(inp_matrix,out_matrix);
input [0:127]inp_matrix;
output [0:127]out_matrix;

assign out_matrix[0:7] = xtime(inp_matrix[0:7])^xtime(inp_matrix[8:15])^inp_matrix[8:15]^inp_matrix[16:23]^inp_matrix[24:31];
assign out_matrix[8:15] = inp_matrix[0:7]^xtime(inp_matrix[8:15])^xtime(inp_matrix[16:23])^inp_matrix[16:23]^inp_matrix[24:31];
assign out_matrix[16:23] = inp_matrix[0:7]^inp_matrix[8:15]^xtime(inp_matrix[16:23])^xtime(inp_matrix[24:31])^inp_matrix[24:31];
assign out_matrix[24:31] = xtime(inp_matrix[0:7])^inp_matrix[0:7]^inp_matrix[8:15]^inp_matrix[16:23]^xtime(inp_matrix[24:31]);

assign out_matrix[32:39] = xtime(inp_matrix[32:39])^xtime(inp_matrix[40:47])^inp_matrix[40:47]^inp_matrix[48:55]^inp_matrix[56:63];
assign out_matrix[40:47] = inp_matrix[32:39]^xtime(inp_matrix[40:47])^xtime(inp_matrix[48:55])^inp_matrix[48:55]^inp_matrix[56:63];
assign out_matrix[48:55] = inp_matrix[32:39]^inp_matrix[40:47]^xtime(inp_matrix[48:55])^xtime(inp_matrix[56:63])^inp_matrix[56:63];
assign out_matrix[56:63] = xtime(inp_matrix[32:39])^inp_matrix[32:39]^inp_matrix[40:47]^inp_matrix[48:55]^xtime(inp_matrix[56:63]);

assign out_matrix[64:71] = xtime(inp_matrix[64:71])^xtime(inp_matrix[72:79])^inp_matrix[72:79]^inp_matrix[80:87]^inp_matrix[88:95];
assign out_matrix[72:79] = inp_matrix[64:71]^xtime(inp_matrix[72:79])^xtime(inp_matrix[80:87])^inp_matrix[80:87]^inp_matrix[88:95];
assign out_matrix[80:87] = inp_matrix[64:71]^inp_matrix[72:79]^xtime(inp_matrix[80:87])^xtime(inp_matrix[88:95])^inp_matrix[88:95];
assign out_matrix[88:95] = xtime(inp_matrix[64:71])^inp_matrix[64:71]^inp_matrix[72:79]^inp_matrix[80:87]^xtime(inp_matrix[88:95]);

assign out_matrix[96:103] = xtime(inp_matrix[96:103])^xtime(inp_matrix[104:111])^inp_matrix[104:111]^inp_matrix[112:119]^inp_matrix[120:127];
assign out_matrix[104:111] = inp_matrix[96:103]^xtime(inp_matrix[104:111])^xtime(inp_matrix[112:119])^inp_matrix[112:119]^inp_matrix[120:127];
assign out_matrix[112:119] = inp_matrix[96:103]^inp_matrix[104:111]^xtime(inp_matrix[112:119])^xtime(inp_matrix[120:127])^inp_matrix[120:127];
assign out_matrix[120:127] = xtime(inp_matrix[96:103])^inp_matrix[96:103]^inp_matrix[104:111]^inp_matrix[112:119]^xtime(inp_matrix[120:127]);

function [0:7]xtime;
input [0:7]i;
begin
if(i[0] ==0)
xtime = {i[1:7],1'b0};
else
xtime = {i[1:7],1'b0}^8'h1b;
end
endfunction
endmodule

