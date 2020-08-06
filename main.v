module parking(full,pswd_inc,exit,ir,pass_entry1,enter1,pass_entry2,enter2,exit_num,pass_exit,enter3);

output reg [15:0]exit;
output reg full,pswd_inc;

input enter1,enter2,enter3;
input [127:0] pass_entry1,pass_entry2;
input [127:0] pass_exit;
input [3:0] exit_num;
input ir;

 
reg [127:0]store1[0:15],store2[0:15],store3[0:15];
reg [15:0]entrance,lock;
reg [3:0] j;
wire [127:0] pass1,pass2,pass3;

initial
begin
	entrance=16'b0;
	lock=16'b0;
	full=1'b0;
	exit=16'b0;
	j=4'b0;
end

always@(posedge ir)
begin
	if(entrance[j]==1'b0)
	begin
		entrance[j]=1'b1;
		exit[j] = 0;
		j=j+1;
		$display("entrance=%b",entrance);
	end
	else
	begin
		full=1'b1;
	end
end

always@(posedge ir or j)
begin
	if(exit[j]==1'b1)
	begin
		full=1'b0;
	end
end


always@(posedge enter1)
begin
	#2	store1[j]=pass1;
end
encryption e1(pass_entry1,"password12345678",pass1);

always@(posedge enter2)
begin

	#2	store2[j]=pass2;
end
encryption e2(pass_entry2,"password12345678",pass2);

always@(posedge enter3)
begin
	#2	store3[exit_num+1]=pass3;
end
encryption e3(pass_exit,"password12345678",pass3);
	
always@(negedge enter2)
begin
	if(store1[j]==store2[j] && entrance[j-1]==1)
	begin
		lock[j-1]=1'b1;
	end
	else
	begin
		lock[j-1]=1'b0;
	end
	$display("lock = %b", lock);
end

always@(negedge enter3)
begin
	if(store1[exit_num+1] == store3[exit_num+1] )
	begin
		exit[exit_num]=1'b1;
		entrance[exit_num]=1'b0;
		lock[exit_num]=1'b0;
		full=1'b0;
	end
	else
	begin	
		pswd_inc=1; 
		#5
		pswd_inc = 0;
	end
	$display("Exit=%b", exit);
end
endmodule

