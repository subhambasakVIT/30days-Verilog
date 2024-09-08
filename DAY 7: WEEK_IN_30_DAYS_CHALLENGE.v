//This exercise is an extension of module_shift. Instead of module ports being only single pins, we now have modules with vectors as ports, to which you will attach wire vectors instead of plain wires. Like everywhere else in Verilog, the vector length of the port does not have to match the wire connecting to it, but this will cause zero-padding or trucation of the vector. This exercise does not use connections with mismatched vector lengths.
//You are given a module my_dff8 with two inputs and one output (that implements a set of 8 D flip-flops). Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on sel[1:0]: The value at the input d, after the first, after the second, or after the third D flip-flop. (Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)
//The module provided to you is: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
//The multiplexer is not provided. One possible way to write one is inside an always block with a case statement inside.

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    
    wire [7:0] d1_out,d2_out,d3_out;
    my_dff8 d1(.clk(clk),.d(d),.q(d1_out));
    my_dff8 d2(.clk(clk),.d(d1_out),.q(d2_out));
    my_dff8 d3(.clk(clk),.d(d2_out),.q(d3_out));
    
    //multiplexer code
    always @(*)
        begin
            
            case(sel)
                2'b00: q = d;
                2'b01: q = d1_out;
                2'b10: q = d2_out;
                2'b11: q = d3_out;
            endcase
        end

endmodule
