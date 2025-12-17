module pid_axis (
    input  logic clk,
    input  logic rst,
    input  logic tick,

    input  logic signed [15:0] setpoint,
    input  logic signed [15:0] measurement,

    input  logic signed [15:0] kp,
    input  logic signed [15:0] ki,
    input  logic signed [15:0] kd,

    output logic signed [15:0] control
);
    logic signed [15:0] error;
    logic signed [15:0] prev_error;
    logic signed [31:0] integral;

    always_ff @(posedge clk) begin
        if (rst) begin
            error      <= 0;
            prev_error <= 0;
            integral   <= 0;
            control    <= 0;
        end else if (tick) begin
            error <= setpoint - measurement;
            integral <= integral + error;

            control <= ((kp * error) +
                        (ki * integral[23:8]) +
                        (kd * (error - prev_error))) >>> 8;

            prev_error <= error;
        end
    end
endmodule
