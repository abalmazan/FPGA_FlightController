module plant_axis (
    input  logic clk,
    input  logic rst,
    input  logic tick,

    input  logic signed [15:0] control,
    input  logic signed [15:0] disturbance,

    output logic signed [15:0] angle
);
    logic signed [15:0] rate;

    always_ff @(posedge clk) begin
        if (rst) begin
            rate  <= 0;
            angle <= 0;
        end else if (tick) begin
            rate  <= rate + control + disturbance;
            angle <= angle + rate;
        end
    end
endmodule
