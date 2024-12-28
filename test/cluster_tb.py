import cocotb
from cocotb.triggers import FallingEdge, RisingEdge
from cocotb.clock import Clock, Timer
import random
import random

@cocotb.test()
async def test_mac_cluster(dut):
    """Test the n-bit adder module"""

    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    
    dut.rst.value = 1
    dut.ebl.value = 0
    await Timer(50, units="ns")
    cocotb.log.info("Reset deasserted")
    
    dut.rst.value = 0
    dut.ebl.value = 1

    dut.m1_a.value = 0
    dut.m1_b.value = 0
    dut.m2_a.value = 0
    dut.m2_b.value = 0
    dut.m3_a.value = 0
    dut.m3_b.value = 0
    dut.m4_a.value = 0
    dut.m4_b.value = 0
    dut.m5_a.value = 0
    dut.m5_b.value = 0
    dut.m6_a.value = 0
    dut.m6_b.value = 0
    dut.m7_a.value = 0
    dut.m7_b.value = 0
    dut.m8_a.value = 0
    dut.m8_b.value = 0
    await Timer(50, units="ns") 
    assert dut.out.value == 0, f"Test Case 1 Failed: {dut.out.value} != 0"
    cocotb.log.info(f"Enable signal set: {dut.ebl.value}")
    
    a = random.randint(0, 255)
    b = random.randint(0, 255)
    c = random.randint(0, 255)
    d = random.randint(0, 255)
    e = random.randint(0, 255)
    f = random.randint(0, 255)
    g = random.randint(0, 255)
    h = random.randint(0, 255)
    i = random.randint(0, 255)
    j = random.randint(0, 255)
    k = random.randint(0, 255)
    l = random.randint(0, 255)
    m = random.randint(0, 255)
    n = random.randint(0, 255)
    o = random.randint(0, 255)
    p = random.randint(0, 255)
    

    dut.m1_a.value = a
    dut.m1_b.value = b
    dut.m2_a.value = c
    dut.m2_b.value = d
    dut.m3_a.value = e
    dut.m3_b.value = f
    dut.m4_a.value = g
    dut.m4_b.value = h
    dut.m5_a.value = i
    dut.m5_b.value = j
    dut.m6_a.value = k
    dut.m6_b.value = l
    dut.m7_a.value = m
    dut.m7_b.value = n
    dut.m8_a.value = o
    dut.m8_b.value = p

    await Timer(50, units="ns") 

    # expected = ((a*b) + (c*d)) & ((1 << 16) - 1)
    expected = expected = ((a * b + c * d) + (e * f + g * h) + (i * j + k * l) + (m * n + o * p)) & ((1 << 16) - 1)
    acutal = int(dut.out.value)
    cocotb.log.info(f"debug {dut.out.value}")
    assert expected == acutal, f"Test Case 2 Failed: {dut.out.value} != {expected}"
    cocotb.log.info(f"output of mac cluster: {acutal}")
