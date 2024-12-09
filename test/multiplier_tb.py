import cocotb
from cocotb.triggers import FallingEdge, RisingEdge
from cocotb.clock import Clock, Timer
import random

@cocotb.test()
async def test_adder_nb(dut):
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
    await Timer(20, units="ns") 
    assert dut.out.value == 0, f"Test Case 1 Failed: {dut.out.value} != 0"
    cocotb.log.info(f"Enable signal set: {dut.ebl.value}")
    
    test_cases = [(10, 20), (0, 0), (65535, 1)]
    for a, b in test_cases:
        dut.a_in.value = a
        dut.b_in.value = b
        cocotb.log.info(f"Inputs set: a={a}, b={b}")
        
        await Timer(20, units="ns") 
        
        expected = (a + b) & ((1 << 16) - 1)
        actual = int(dut.out.value)
        
        cocotb.log.info(f"Output: {actual}, Expected: {expected}")
        assert actual == expected, f"Test failed: {a} + {b} = {actual}, expected {expected}"
