`timescale 1ns / 1ps

module TrafficLight_TB;
    
    wire Green, Yellow, Red; 
    reg clk, reset;
    wire [6:0] cnt;    
    
TrafficLight TF (
    .clk(clk),
    .reset(reset),
    .Green(Green),
    .Yellow(Yellow),
    .Red(Red),
    .cnt(cnt)
);

//Toggle clock
initial clk = 0;
always #5 clk = ~clk;

// Toggle reset off and on
initial begin
    #5;
    reset = 1;
    #5;
    reset = 0;
end

endmodule
