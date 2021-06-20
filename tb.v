`timescale 1ns/1ns
module tb;
    initial
    begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);
    end

    reg [0:7] Red, Green, Blue;
    reg clk;
    wire [0:7] RedOut, GreenOut, BlueOut;

    RGBtoGrayscale uut(Red, Green, Blue, RedOut, GreenOut, BlueOut, clk);
    always #5 clk = ~clk;

    initial
    begin
        clk <= 1'b1;
        #5;
        for (Red = 0; Red <= 240; Red = Red + 10)
        begin
            for (Blue = 0; Blue <= 240; Blue = Blue + 10)
            begin
                for (Green = 0; Green <= 240; Green = Green + 10)
                repeat (2) @(posedge clk);
            end
        end
        $finish;
    end
endmodule
