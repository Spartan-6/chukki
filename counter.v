module up_down(input clk, input reset, input updown, output [7:0] count, output [7:0]seg);
reg [7:0] count=0;
reg [7:0] seg;
always@(posedge clk or posedge reset)
begin
if (reset==1)
count<=7'd0;
else
if(updown==0)
if(count==7'd99)
count<=7'd0;
else
count<=count+7'd1;
else
if(count==7'd0)
count<=7'd99;
else
count<==count-7'd1;
end
always @ (count)
begin
case(count)
4'b0000: seg = 8'b00000011;
4'b0001: seg = 8'b10011111;
4'b0010: seg = 8'b00100101;
4'b0011: seg = 8'b00001101;
4'b0100: seg = 8'b10011001;
4'b0101: seg = 8'b01001001;
4'b0110: seg = 8'b01000001;
4'b0111: seg = 8'b00011111;
4'b1000: seg = 8'b00000001;
4'b1001: seg = 8'b00001001;

endcase
end
endmodule

