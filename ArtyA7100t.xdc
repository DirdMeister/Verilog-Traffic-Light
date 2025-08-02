## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

## Buttons
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { reset }]; #IO_L6N_T0_VREF_16 Sch=btn[0]

## ChipKit Outer Digital Header
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { Green }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { Yellow }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { Red  }]; #IO_L8N_T1_D12_14 Sch=ck_io[2]
