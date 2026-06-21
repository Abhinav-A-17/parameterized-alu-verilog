`timescale 1ns/1ps

module alu_tb();

    parameter bit_width = 4;
    reg [bit_width-1:0] in1;
    reg [bit_width-1:0] in2;
    reg [3:0] mode;
    wire [bit_width-1:0] out;
    wire carry_flag;
    wire zero_flag;
    wire neg_flag;

    alu #(bit_width)u1(
        .in1(in1),
        .in2(in2),
        .mode(mode),
        .out(out),
        .carry_flag(carry_flag),
        .neg_flag(neg_flag),
        .zero_flag(zero_flag)
    );

    initial begin

        $dumpfile("waves.vcd");
        $dumpvars(0);
        in1 = 0;
        in2 = 0;
        mode = 4'b1111;
        #10;
        mode = 4'b0000;
        in1 = 4'hA;
        in2 = 4'h2;
        #10;
        in1 = 4'hC;
        in2 = 4'h8;
        #10;
        mode = 4'b0001;
        in1 = 4'hF;
        in2 = 4'h5;
        #10;
        in1 = 4'h5;
        in2 = 4'hF;
        #10;
        mode = 4'b0010;
        in1 = 4'h5;
        in2 = 4'h7;
        #10;
        mode = 4'b0100;
        in1 = 4'h5;
        in2 = 4'h7;
        #10;
        mode = 4'b1000;
        in1 = 4'h5;
        in2 = 4'h7;
        #10;
        mode = 4'b1110;
        in1 = 4'h5;
        #10;
        mode = 4'b1101;
        in1 = 4'h5;
        #10;
        mode = 4'b1011;
        in2 = 4'h5;
        #10;
        mode = 4'b0111;
        in2 = 4'h5;
        #10;
        mode = 4'b0011;
        in1 = 4'h5;
        in2 = 4'h7;
        #10;
        in1 = 4'h7;
        in2 = 4'h5;
        #10;
        mode = 4'b0110;
        in1 = 4'h5;
        in2 = 4'h5;
        #10;
        in1 = 4'h7;
        in2 = 4'h5;
        #10;
        mode = 4'b1100;
        in1 = 4'h5;
        in2 = 4'h7;
        #10;
        in1 = 4'h7;
        in2 = 4'h5;
        #10;
        $finish;


    end



endmodule