module stimulus;

wire [15:0]exit;
wire full,pswd_inc;

reg [127:0] pass_entry1,pass_entry2;
reg [127:0] pass_exit;
reg ir,enter1,enter2,enter3;
reg [3:0] exit_num;

parking p1(full,pswd_inc,exit,ir,pass_entry1,enter1,pass_entry2,enter2,exit_num,pass_exit,enter3);

always@(*)
begin
	if(full==1'b1)
		$display("full");
end

initial
begin

//car1
	ir=1'b0;
	enter1=1'b0;
	enter2=1'b0;
	enter3=1'b0;
	#5	ir=1'b1;		       	  #5	ir=1'b0;
	#5	pass_entry1="sentence2encrypt";enter1=1'b1; #5	enter1=1'b0;
	#5	pass_entry2="sentence2encrypt";enter2=1'b1; #5	enter2=1'b0;
	#5	exit_num=4'b0000;
	#5	pass_exit="sentence2encrypt";  enter3=1'b1; #5	enter3=1'b0;

//car 2
	ir=1'b0;
	enter1=1'b0;
	enter2=1'b0;
	enter3=1'b0;
	#5	ir=1'b1;		       	  #5	ir=1'b0;
	#5	pass_entry1=128'ha9d;enter1=1'b1; #5	enter1=1'b0;
	#5	pass_entry2=128'ha9d;enter2=1'b1; #5	enter2=1'b0;
	#5	exit_num=4'b0001;
	#5	pass_exit=128'ha9d;  enter3=1'b1; #5	enter3=1'b0;

//car 3
	ir=1'b0;
	enter1=1'b0;
	enter2=1'b0;
	enter3=1'b0;
	#5	ir=1'b1;		       	  #5	ir=1'b0;
	#5	pass_entry1=128'h256;enter1=1'b1; #5	enter1=1'b0;
	#5	pass_entry2=128'h256;enter2=1'b1; #5	enter2=1'b0;

//car4
	ir=1'b0;
	enter1=1'b0;
	enter2=1'b0;
	enter3=1'b0;
	#5	ir=1'b1;		       	  #5	ir=1'b0;
	#5	pass_entry1=128'h142;enter1=1'b1; #5	enter1=1'b0;
	#5	pass_entry2=128'h142;enter2=1'b1; #5	enter2=1'b0;
	#5	exit_num=4'b0011;
	#5	pass_exit=128'h142;  enter3=1'b1; #5	enter3=1'b0;

//car3 exit
	enter3=0;
	#5	exit_num=4'b0010;
	#5	pass_exit=128'h265;  enter3=1'b1; #5	enter3=1'b0;
end
endmodule