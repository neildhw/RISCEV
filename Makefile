testbench: tb.cpp
	verilator -Wall --trace --cc --exe --build tb.cpp top.sv
