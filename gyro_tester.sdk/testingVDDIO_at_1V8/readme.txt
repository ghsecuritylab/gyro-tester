For testing gyro IC with VDDIO set to 1.8V

This is the exported hardware from fpga code done by Charles that should have the TX data looping out of 3 channels simultaneously. The Rx data input is not tested.

The only change made to this was in the pinouts specified in the constraints file gyro_constraints.xdc. The SPI lines and HSI lines had to be sent out through bank 34 so that Vadj could be set to 1.8V.
Since the master clock output standard must be specified at LVDS25 the rest of bank 34 must also be specified at 2.5V. This means that all IO lines (HSI and SPI) are specified at 2.5V even though the bank voltage is set to 1.8V on the zedboard. That is the only way to quickly test the gyro IC at 1.8V without level shifters.

