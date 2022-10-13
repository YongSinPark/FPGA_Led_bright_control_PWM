`timescale 1ns / 1ps

module tb_LED_Control();
    reg i_clk = 1'b0, i_reset;
    reg i_button0, i_button1, i_button2;
    // wire o_led_bright_mode;

    // wire w_clk;
    wire w_button0, w_button1, w_button2;
    // wire [2:0] led_state;
    // wire [9:0] w_counter;
    // wire w_light_1, w_light_2, w_light_3, w_light_4;

    // Prescaler_for_1MHz Prescaler_for_1MHz(
    // .i_clk(i_clk),
    // .i_reset(i_reset),
    // .o_clk(w_clk)
    // );

    // Counter Counter(
    // .i_clk(w_clk), 
    // .i_reset(i_reset),
    // .o_counter(w_counter)
    // );

    // Comparator Comparator(
    // .i_counter(w_counter),
    // .o_light_1(w_light_1), 
    // .o_light_2(w_light_2), 
    // .o_light_3(w_light_3), 
    // .o_light_4(w_light_4)
    // );

    // MUX MUX(
    // .i_light0(w_light_1),
    // .i_light1(w_light_2),
    // .i_light2(w_light_3),
    // .i_light3(w_light_4),
    // .i_mode(led_state),
    // .o_light_bright(o_led_bright_mode)
    // );

    Button Button0(
    .i_clk(i_clk), 
    .i_reset(i_reset), 
    .i_button(i_button0),
    .o_buttonState(w_button0)
    );

    Button Button1(
    .i_clk(i_clk), 
    .i_reset(i_reset), 
    .i_button(i_button1),
    .o_buttonState(w_button1)
    );
    
    Button Button2(
    .i_clk(i_clk), 
    .i_reset(i_reset), 
    .i_button(i_button2),
    .o_buttonState(w_button2)
    );

    // FSM_light_button FSM_light_button(
    // .i_clk(i_clk), 
    // .i_reset(i_reset), 
    // .i_button0(w_button0),
    // .i_button1(w_button1),
    // .i_button2(w_button2),
    // .o_led_state(led_state)
    // );

    always #5 i_clk = ~i_clk;

    initial begin
        #00 i_reset = 1'b0; i_button0 = 1'b0; i_button1 = 1'b0; i_button2 = 1'b0;
        for(integer i = 0; i < 5000; i = i + 1) begin
            #100 i_reset = 1'b0; i_button0 = 1'b0; i_button1 = 1'b1; i_button2 = 1'b0;
            #100 i_reset = 1'b0; i_button0 = 1'b0; i_button1 = 1'b0; i_button2 = 1'b0;
        end


        #100 $finish;
    end

endmodule
