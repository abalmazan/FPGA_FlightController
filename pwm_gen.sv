module pwm_gen (
    input  logic clk,
    input  logic rst,
    input  logic [15:0] duty,
    output logic pwm
);
    logic [18:0] count;

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 0;
            pwm   <= 1'b0;
        end else begin
            count <= count + 1;
            pwm <= (count < duty);
        end
    end
endmodule
