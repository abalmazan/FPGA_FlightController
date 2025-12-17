# FPGA_FlightController
Drone flight controller simulation in SystemVerilog using the Nexys 4 DDR (Vivado).

Project Overview
This project implements a hardware based flight control simulation core on the Nexys DDR4 FPGA development board. The design models the essential components of a quadcopter flight controller sensor behavior, control logic, and motor signaling entirely in FPGA logic, without relying on any external hardware.
The system simulates angular motion, applies a fixed point PID control loop, and generates PWM motor commands at a pre determined update rate. The project is intended as an educational demonstration of real time control systems implemented using a simple, FPGA design style.
