import cocotb
from cocotb.triggers import FallingEdge, RisingEdge
from cocotb.clock import Clock, Timer
import random

@cocotb.test()
async def test_mac_8bit(dut):
    """Test the n-bit adder module"""

    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    dut.rst.value = 1
    dut.ebl.value = 0
    dut.a_in.value = 0
    dut.b_in.value = 0
    await Timer(20, units="ns")
    cocotb.log.info("Reset deasserted")
    
    dut.rst.value = 0
    dut.ebl.value = 1
    dut.a_in.value = 0
    dut.b_in.value = 0
    dut.c_in.value = 0
    dut.d_in.value = 0
    await Timer(20, units="ns") 
    assert dut.out.value == 0, f"Test Case 1 Failed: {dut.out.value} != 0"
    cocotb.log.info(f"Enable signal set: {dut.ebl.value}")
    
    a = 20
    b = 30
    c = 40
    d = 20

    dut.a_in.value = a
    dut.b_in.value = b
    dut.c_in.value = c
    dut.d_in.value = d
    await Timer(20, units="ns") 

    expected = ((a*b) + (c*d)) & ((1 << 16) - 1)
    acutal = int(dut.out.value)
    assert expected == acutal, f"Test Case 2 Failed: {dut.out.value} != {expected}"
    cocotb.log.info(f"output of 8-bit mac: {acutal}")
