module flight_top (
    input  logic        clk100mhz,
    input  logic        btnC,
    input  logic [15:0] sw,
    output logic [15:0] led
);
    logic rst;
    assign rst = btnC;

    // 1 kHz tick
    logic tick;
    tick_gen TG (.clk(clk100mhz), .rst(rst), .tick(tick));

    // Simulated disturbance from switches
    logic signed [15:0] disturbance;
    assign disturbance = {8'd0, sw[7:0]};

    // Angle and control
    logic signed [15:0] angle;
    logic signed [15:0] control;

    // PID controller
    pid_axis PID (
        .clk(clk100mhz),
        .rst(rst),
        .tick(tick),
        .setpoint(16'd0),
        .measurement(angle),
        .kp(16'd80),
        .ki(16'd2),
        .kd(16'd40),
        .control(control)
    );

    // Plant model
    plant_axis PLANT (
        .clk(clk100mhz),
        .rst(rst),
        .tick(tick),
        .control(control),
        .disturbance(disturbance),
        .angle(angle)
    );

    // PWM (visual only)
    logic pwm;
    pwm_gen PWM (
        .clk(clk100mhz),
        .rst(rst),
        .duty(control[15:0]),
        .pwm(pwm)
    );

    // LEDs
    assign led[7:0]  = angle[15:8];
    assign led[15:8] = control[15:8];
endmodule
