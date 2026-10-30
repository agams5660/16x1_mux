module mux16(
    input  [15:0] I,
    input  [3:0] S,
    output reg Y
);

always @(*)
begin
    case(S)
        4'd0 : Y = I[0];
        4'd1 : Y = I[1];
        4'd2 : Y = I[2];
        4'd3 : Y = I[3];
        4'd4 : Y = I[4];
        4'd5 : Y = I[5];
        4'd6 : Y = I[6];
        4'd7 : Y = I[7];
        4'd8 : Y = I[8];
        4'd9 : Y = I[9];
        4'd10: Y = I[10];
        4'd11: Y = I[11];
        4'd12: Y = I[12];
        4'd13: Y = I[13];
        4'd14: Y = I[14];
        4'd15: Y = I[15];
    endcase
end

endmodule