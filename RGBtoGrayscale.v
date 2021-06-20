module RGBtoGrayscale(Red, Green, Blue, RedOut, GreenOut, BlueOut, clk);
    input [0:7] Red, Green, Blue;
    input clk;
    output reg [0:7] RedOut, GreenOut, BlueOut;

    reg [0:7]GrayValue;

    always @(negedge clk)
    begin
        GrayValue = Red*0.3 + Green*0.59 + Blue*0.11;
        //GrayValue = (Red >> 2) + (Red >> 5) + (Green >> 1) + (Green >> 4) + (Blue >> 4) + (Blue >> 5);
        RedOut <= GrayValue;
        BlueOut <= GrayValue;
        GreenOut <= GrayValue;
    end
endmodule