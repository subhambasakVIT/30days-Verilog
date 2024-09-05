// Given several input vectors, concatenate them together then split them up into several output vectors. There are six 5-bit input vectors: a, b, c, d, e, and f, for a total of 30 bits of input. There are four 8-bit output vectors: w, x, y, and z, for 32 bits of output. The output should be a concatenation of the input vectors followed by two 1 bits:
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};

endmodule


// Given an 8-bit input vector [7:0], reverse its bit ordering.
module top_module( 
    input [7:0] in,
    output [7:0] out
);

    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
    
endmodule


//Build a circuit that sign-extends an 8-bit number to 32 bits. This requires a concatenation of 24 copies of the sign bit (i.e., replicate bit[7] 24 times) followed by the 8-bit number itself.
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = { {24{in[7]}} ,in };

endmodule
