`timescale 1ns / 1ps

module FSM_light_button(
    input i_clk, i_reset, 
    input i_button0, i_button1, i_button2,
    output [2:0] o_led_state
    );
    parameter   S_LED_0 = 3'h0,
                S_LED_1 = 3'h1,
                S_LED_2 = 3'h2,
                S_LED_3 = 3'h3,
                S_LED_4 = 3'h4;
    
    reg [2:0] cur_state = 0, next_state = 0;
    reg [2:0] r_led_state = 0;

    assign o_led_state = r_led_state;

    always @(posedge i_clk, posedge i_reset) begin
        if(i_reset) cur_state <= S_LED_0;
        else cur_state <= next_state;
    end


    always @(cur_state, i_button0, i_button1, i_button2) begin
        next_state <= S_LED_0;
        case(cur_state)
        S_LED_0: begin
            if(i_button1 == 1'b1) next_state <= S_LED_1;
            else next_state <= S_LED_0;
        end
        S_LED_1: begin
            if(i_button1 == 1'b1) next_state <= S_LED_2;
            else if(i_button2 == 1'b1) next_state <= S_LED_0;
            else if(i_button0 == 1'b1) next_state <= S_LED_0;
            else next_state <= S_LED_1;
        end
        S_LED_2: begin
            if(i_button1 == 1'b1) next_state <= S_LED_3;
            else if(i_button2 == 1'b1) next_state <= S_LED_1;
            else if(i_button0 == 1'b1) next_state <= S_LED_0;
            else next_state <= S_LED_2;
        end
        S_LED_3: begin
            if(i_button1 == 1'b1) next_state <= S_LED_4;
            else if(i_button2 == 1'b1) next_state <= S_LED_2;
            else if(i_button0 == 1'b1) next_state <= S_LED_0;
            else next_state <= S_LED_3;
        end
        S_LED_4: begin
            if(i_button1 == 1'b1) next_state <= S_LED_4;
            else if(i_button2 == 1'b1) next_state <= S_LED_3;
            else if(i_button0 == 1'b1) next_state <= S_LED_0;
            else next_state <= S_LED_4;
        end
        endcase
    end

    always @(cur_state) begin
        r_led_state <= 3'h0;
        case(cur_state)
        S_LED_0 : r_led_state <= 3'h0;
        S_LED_1 : r_led_state <= 3'h1;
        S_LED_2 : r_led_state <= 3'h2;
        S_LED_3 : r_led_state <= 3'h3;
        S_LED_4 : r_led_state <= 3'h4;
        endcase
    end

endmodule
