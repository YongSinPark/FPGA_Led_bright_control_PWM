`timescale 1ns / 1ps

module MUX(
    input i_light0, i_light1, i_light2, i_light3,
    input [2:0] i_mode,
    output o_light_bright
    );
    reg r_light_bright;
    assign o_light_bright = r_light_bright;

    always @(*) begin
        r_light_bright <= 1'b0;
        case (i_mode)
            3'h0 : r_light_bright <= 1'b0;
            3'h1 : r_light_bright <= i_light0;
            3'h2 : r_light_bright <= i_light1;
            3'h3 : r_light_bright <= i_light2;
            3'h4 : r_light_bright <= i_light3;
        endcase
    end
endmodule
