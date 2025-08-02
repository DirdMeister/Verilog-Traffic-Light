// Probably will make changes to avoid using the ludicrously high counter limit and a timer for the reset as well

`timescale 1ns / 1ps

module TrafficLight(
    input wire clk, reset,
        
    output wire Green, Yellow, Red
    //output wire [6:0] cnt
);
    
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    //localparam S3 = 2'b11;
    
    reg G, Y, R;
    reg [1:0] present, next;
    reg [99:0] counter = 0;
    
    assign cnt = counter;
    assign Green = G;
    assign Yellow = Y;
    assign Red = R;

  // Reset 
    always @ (posedge clk)
    begin
        if(reset == 1) begin
            G <= 0;
            Y <= 0;
            R <= 1;
            counter <= 0;
            present <= S0;
        end
    else
    begin
    
    case(present)
      
// Green    
    S0:
    begin
        G <= 1;
        Y <= 0;
        R <= 0;
        if(counter >= 600000000)
        begin 
            present <= S1;
            counter <= 0;
        end
        else
            counter <= counter + 1;
        end
// Yellow
    S1:
    begin
        G <= 0;
        Y <= 1;
        R <= 0;
        if(counter >= 200000000) 
        begin 
            present <= S2;
            counter <= 0;
        end
        else
          counter <= counter + 1;
        end
    
// Red
    S2:
    begin
        G <= 0;
        Y <= 0;
        R <= 1;
        if(counter >= 600000000)
        begin 
            present <= S0;
            counter <= 0;
        end
        else
          counter <= counter + 1;
        end
    endcase
    end
    end
    
endmodule
