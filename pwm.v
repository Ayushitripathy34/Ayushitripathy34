module inverter_pwm(
    input clk,
    input reset,
    input [9:0] duty_cycle,
    output reg pwm_out
);

    parameter PWM_PERIOD = 1000000;
    reg [19:0] counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pwm_out <= 0;
        end
        else begin
            counter <= counter + 1;
            if (counter < duty_cycle * PWM_PERIOD / 1024)
                pwm_out <= 1;
            else
                pwm_out <= 0;

            if (counter >= PWM_PERIOD)
                counter <= 0;
        end
    end
endmodule
