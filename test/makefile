TOPLEVEL_LANG ?= verilog
SIM ?= verilator

# Top-level module and testbench module
TOPLEVEL ?= adder_nb
MODULE ?= multiplier_tb

SIM_ARGS += --trace

# Set paths for Verilog source files and testbench
VERILOG_SOURCES = \
    ../rtl/mac.sv \
    ../rtl/multiplier.sv \
    ../rtl/adder.sv
# PYTHONPATH := $(PWD)/test/

# Include Cocotb's standard makefile
include $(shell cocotb-config --makefiles)/Makefile.sim
