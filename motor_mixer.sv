module motor_mixer (
    input  logic signed [15:0] throttle,
    input  logic signed [15:0] pitch,
    input  logic signed [15:0] roll,
    input  logic signed [15:0] yaw,

    output logic signed [15:0] m1,
    output logic signed [15:0] m2,
    output logic signed [15:0] m3,
    output logic signed [15:0] m4
);
    always_comb begin
        m1 = throttle + pitch - roll + yaw;
        m2 = throttle + pitch + roll - yaw;
        m3 = throttle - pitch + roll + yaw;
        m4 = throttle - pitch - roll - yaw;
    end
endmodule
