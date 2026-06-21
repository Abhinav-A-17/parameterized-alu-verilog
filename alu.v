module alu #(
    parameter bit_width = 4
) (
    input [bit_width-1:0] in1,  //a parameterized input 1
    input [bit_width-1:0] in2,  //a parameterized input 2
    input [3:0] mode,           //a mode input to control the operations
    output reg [bit_width-1:0] out,
    output reg carry_flag,      //detects carry
    output zero_flag,           //detects zero
    output reg neg_flag         //detects negative number
);

    always @(*) begin

        //initialize outputs to 0
        out = 0;
        carry_flag = 0;
        neg_flag = 0;

        case(mode)
            //ARITHMETIC
            4'b0000: {carry_flag,out} = in1 + in2;  //addition
            4'b0001: begin
                out = in1 - in2;                     //subtraction
                if(in1<in2) neg_flag = 1'b1; 
            end
            4'b0010: out = in1 & in2;               //bitwise AND
            4'b0100: out = in1 | in2;               //bitwise OR
            4'b1000: out = in1 ^ in2;               //bitwise XOR
            //COMPARATOR
            4'b0011: out = (in1 < in2);             //less than
            4'b0110: out = (in1 == in2);            //equals
            4'b1100: out = (in1 > in2);             //greater than
            //SHIFT
            4'b1110: out = {1'b0,in1} >> 1;                //in1 right shift
            4'b1101: {carry_flag,out} = in1 << 1;   //in1 left shift
            4'b1011: out = in2 >> 1;                //in2 right shift
            4'b0111: {carry_flag,out} = {1'b0,in2} << 1;   //in2 left shift
            4'b1111: out = 0;
            default: out = 0;
        endcase
    end

    assign zero_flag = (out==0);                    // detects 0 in out

    
endmodule