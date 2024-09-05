//You are given a module add16 that performs a 16-bit addition. Instantiate two of them to create a 32-bit adder. One add16 module computes the lower 16 bits of the addition result, while the second add16 module computes the upper 16 bits of the result, after receiving the carry-out from the first adder. Your 32-bit adder does not need to handle carry-in (assume 0) or carry-out (ignored), but the internal modules need to in order to function correctly. (In other words, the add16 module performs 16-bit a + b + cin, while your module performs 32-bit a + b).Connect the modules together as shown in the diagram below. The provided module add16 has the following declaration:module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire add1_carry;

    add16 add1(.a(a[15:0]) , .b(b[15:0]) , .sum(sum[15:0]) , .cout(add1_carry));
    add16 add2(.a(a[31:16]) , .b(b[31:16]) , .sum(sum[31:16]) , .cin(add1_carry));
    
    
endmodule


//In this exercise, you will create a circuit with two levels of hierarchy. Your top_module will instantiate two copies of add16 (provided), each of which will instantiate 16 copies of add1 (which you must write). Thus, you must write two modules: top_module and add1.

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire add1_carry;
    add16 add1(.a(a[15:0]) , .b(b[15:0]) , .sum(sum[15:0]) , .cout(add1_carry));
    add16 add2(.a(a[31:16]) , .b(b[31:16]) , .sum(sum[31:16]) , .cin(add1_carry));
       
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
// Full adder module here
    assign sum = a^b^cin;
    assign cout = a&b | cin &(a^b);

endmodule


//In this exercise, you are provided with the same module add16 as the previous exercise, which adds two 16-bit numbers with carry-in and produces a carry-out and 16-bit sum. You must instantiate three of these to build the carry-select adder, using your own 16-bit 2-to-1 multiplexer.

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum0, sum1; // Intermediate sums for the upper 16 bits
    wire cout0, cout1, cout2; // Carry-outs

    // First 16-bit adder (for lower 16 bits, carry-in is 0)
    add16 u1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),        // Assume carry-in is 0
        .sum(sum[15:0]),
        .cout(cout0)       // Carry-out for the lower 16 bits
    );

    // Second 16-bit adder (for upper 16 bits, with carry-in = 0)
    add16 u2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout1)
    );

    // Third 16-bit adder (for upper 16 bits, with carry-in = 1)
    add16 u3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout2)
    );

    // 2-to-1 multiplexer to select the correct upper sum
    assign sum[31:16] = (cout0) ? sum1 : sum0;

endmodule



//Build the adder-subtractor below.You are provided with a 16-bit adder module, which you need to instantiate twice:module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed as b[31:0] XORed with sub replicated 32 times. See replication operator.). Also connect the sub input to the carry-in of the adder.

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
   // module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

    wire add1_carry ;
    wire [31:0] bsub;
    assign bsub = b ^ {32{sub}};
    //assign bsub[31:16] = b[31:16]^sub;
    add16 add1(.a(a[15:0]), .b(bsub[15:0]) , .cin(sub) , .sum(sum[15:0]) , .cout(add1_carry));
    add16 add2(.a(a[31:16]), .b(bsub[31:16]) , .cin(add1_carry) , .sum(sum[31:16]));
    

endmodule
