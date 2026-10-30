`timescale 1ns/1ps

module tb_mux16;

reg [15:0] I;
reg [3:0] S;
wire Y;

integer infile;
integer outfile;
integer status;

mux16 DUT(
    .I(I),
    .S(S),
    .Y(Y)
);

initial
begin

    $dumpfile("mux16.vcd");
    $dumpvars(0, tb_mux16);

    infile = $fopen("input.txt","r");
    outfile = $fopen("output.txt","w");

    if(infile == 0)
    begin
        $display("Cannot open input.txt");
        $finish;
    end

    if(outfile == 0)
    begin
        $display("Cannot create output.txt");
        $finish;
    end

    $fwrite(outfile," Inputs               Sel   Output\n");
    $fwrite(outfile,"------------------------------------\n");

    while(!$feof(infile))
    begin

        status = $fscanf(infile,"%b %d\n",I,S);

        #5;

        $fwrite(outfile,"%016b     %2d      %b\n",I,S,Y);

    end

    $fclose(infile);
    $fclose(outfile);

    $display("Simulation Completed Successfully.");

    $finish;

end

endmodule