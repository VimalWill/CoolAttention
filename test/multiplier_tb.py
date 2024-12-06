import cocotb
from cocotb.clock import Clock
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, Timer

@cocotb.test()
async def mul_8bit_test(dut):
    """Test the 8-bit multiplier."""
    
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    dut.rst.value = 1
    dut.ebl.value = 0
    dut.a_in.value = 0
    dut.b_in.value = 0
    await Timer(20, units="ns")
    
    dut.rst.value = 0
    dut.ebl.value = 1
    dut.a_in.value = 0
    dut.b_in.value = 0
    await Timer(20, units="ns") 
    assert dut.out.value == 0, f"Test Case 1 Failed: {dut.out.value} != 0"
    
    dut.a_in.value = 5
    dut.b_in.value = 3
    await Timer(20, units="ns") 
    assert dut.out.value == 15, f"Test Case 2 Failed: {dut.out.value} != 15"
    
    dut.a_in.value = 255
    dut.b_in.value = 2
    await Timer(20, units="ns")  
    assert dut.out.value == 510, f"Test Case 3 Failed: {dut.out.value} != 510"
    
    dut.a_in.value = 15
    dut.b_in.value = 15
    await Timer(20, units="ns") 
    assert dut.out.value == 225, f"Test Case 4 Failed: {dut.out.value} != 225"
    
    dut.ebl.value = 0
    dut.a_in.value = 20
    dut.b_in.value = 20
    await Timer(20, units="ns") 
    assert dut.out.value == 225, f"Test Case 5 Failed: {dut.out.value} != 225 (Should not change with ebl disabled)"
    
    dut.ebl.value = 1
    
    cocotb.log.info("All test cases passed!")