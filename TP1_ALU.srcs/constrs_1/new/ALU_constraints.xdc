## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]



## INPUT

##i_switch
set_property PACKAGE_PIN V17 [get_ports {i_switch[0]}]
set_property PACKAGE_PIN V16 [get_ports {i_switch[1]}]
set_property PACKAGE_PIN W16 [get_ports {i_switch[2]}]
set_property PACKAGE_PIN W17 [get_ports {i_switch[3]}]
set_property PACKAGE_PIN W15 [get_ports {i_switch[4]}]
set_property PACKAGE_PIN V15 [get_ports {i_switch[5]}]
set_property PACKAGE_PIN W14 [get_ports {i_switch[6]}]
set_property PACKAGE_PIN W13 [get_ports {i_switch[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_switch[0]}]


##i_enable
set_property PACKAGE_PIN W19 [get_ports {i_enable[0]}]
set_property PACKAGE_PIN U18 [get_ports {i_enable[1]}]
set_property PACKAGE_PIN T17 [get_ports {i_enable[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {i_enable[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_enable[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_enable[0]}]


##i_clock
set_property PACKAGE_PIN W5 [get_ports i_clock]

set_property IOSTANDARD LVCMOS33 [get_ports i_clock]


##i_reset
set_property PACKAGE_PIN T18 [get_ports i_reset]

set_property IOSTANDARD LVCMOS33 [get_ports i_reset]



##OUTPUT

##o_result
set_property PACKAGE_PIN U16 [get_ports {o_result[0]}]
set_property PACKAGE_PIN E19 [get_ports {o_result[1]}]
set_property PACKAGE_PIN U19 [get_ports {o_result[2]}]
set_property PACKAGE_PIN V19 [get_ports {o_result[3]}]
set_property PACKAGE_PIN W18 [get_ports {o_result[4]}]
set_property PACKAGE_PIN U15 [get_ports {o_result[5]}]
set_property PACKAGE_PIN U14 [get_ports {o_result[6]}]
set_property PACKAGE_PIN V14 [get_ports {o_result[7]}]

set_property DRIVE 12 [get_ports {o_result[7]}]
set_property DRIVE 12 [get_ports {o_result[6]}]
set_property DRIVE 12 [get_ports {o_result[5]}]
set_property DRIVE 12 [get_ports {o_result[4]}]
set_property DRIVE 12 [get_ports {o_result[3]}]
set_property DRIVE 12 [get_ports {o_result[2]}]
set_property DRIVE 12 [get_ports {o_result[1]}]
set_property DRIVE 12 [get_ports {o_result[0]}]

set_property SLEW SLOW [get_ports {o_result[7]}]
set_property SLEW SLOW [get_ports {o_result[6]}]
set_property SLEW SLOW [get_ports {o_result[5]}]
set_property SLEW SLOW [get_ports {o_result[4]}]
set_property SLEW SLOW [get_ports {o_result[3]}]
set_property SLEW SLOW [get_ports {o_result[2]}]
set_property SLEW SLOW [get_ports {o_result[1]}]
set_property SLEW SLOW [get_ports {o_result[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {o_result[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[0]}]


##o_carry
set_property PACKAGE_PIN V13 [get_ports o_carry]

set_property DRIVE 12 [get_ports o_carry]

set_property SLEW SLOW [get_ports o_carry]

set_property IOSTANDARD LVCMOS33 [get_ports o_carry]


##o_zero
set_property PACKAGE_PIN V3 [get_ports o_zero]

set_property DRIVE 12 [get_ports o_zero]

set_property SLEW SLOW [get_ports o_zero]

set_property IOSTANDARD LVCMOS33 [get_ports o_zero]




