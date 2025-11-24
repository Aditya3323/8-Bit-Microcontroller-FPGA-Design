# 8-Bit-Microcontroller-FPGA-Design

This project implements a custom 8-bit microcontroller on an FPGA using VHDL/Verilog.
It includes a simple RISC-style instruction set, an ALU, register file, program counter, control unit, and memory.
The complete design was simulated, synthesized, and tested on an FPGA board using tools like Xilinx Vivado.

This project was also presented at IEEE ICFT 2025, showcasing the architecture and FPGA implementation.

## 🖼️ Architecture Diagram

![Architecture Diagram](https://github.com/Aditya3323/8-Bit-Microcontroller-FPGA-Design/blob/main/docs/Block%20Diagram.png)

The block diagram illustrates the complete internal architecture of the custom 8-bit microcontroller designed on FPGA.
It includes all major functional units and their data/control interconnections:

 - Program Counter (PC): Holds the address of the next instruction to execute.

 - ROM: Stores program instructions.

 - Control Unit: Decodes instructions and generates the control word (cu_out) used to coordinate all modules.

 - RAM & RAM Register: Used for data storage and address selection.

 - Accumulator (ACC) and Register B: Temporary registers for arithmetic and logical operations.

 - ALU: Performs all 8-bit arithmetic and logic operations based on control signals.

 - P0 & P1 Registers: GPIO-style registers for external I/O.

 - Direction Handling Unit: Controls the direction (input/output) of Port 0 and Port 1 pins.

 - Data Handler: Central unit responsible for routing ALU outputs, RAM data, and register values based on the instruction fields.

This diagram represents the full fetch–decode–execute datapath and signal flow, demonstrating how instructions interact with hardware blocks to form a functional microcontroller.

### 📊 FPGA Resource

![FPGA Utilization](https://github.com/Aditya3323/8-Bit-Microcontroller-FPGA-Design/blob/main/docs/WhatsApp%20Image%202025-08-14%20at%2011.29.48_794570e5.jpg)

This table shows the resource utilization after synthesizing and implementing the microcontroller design on the target FPGA device:

 -LUTs (168 used, 0.52%): Indicates very low logic consumption, meaning efficient hardware design.

 -LUTRAM (8 used, 0.08%): Minimal memory LUT usage.

 -Flip-Flops (55 used, 0.08%): Low sequential logic requirement.

 -I/O Pins (18 used, 8.57%): Required for ports, data lines, control signals.

 -BUFG (1 used, 3.13%): Clock buffer usage.

This demonstrates that the microcontroller is resource-efficient, low-power, and thermally stable, making it suitable for FPGA deployment and future scalability.
