# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock_100Mhz]       
 set_property IOSTANDARD LVCMOS33 [get_ports clock_100Mhz]
set_property PACKAGE_PIN R2 [get_ports reset]     
        set_property IOSTANDARD LVCMOS33 [get_ports reset]
#seven-segment LED display
        set_property PACKAGE_PIN W7 [get_ports {LED_out[6]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[6]}]
        set_property PACKAGE_PIN W6 [get_ports {LED_out[5]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[5]}]
        set_property PACKAGE_PIN U8 [get_ports {LED_out[4]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[4]}]
        set_property PACKAGE_PIN V8 [get_ports {LED_out[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[3]}]
        set_property PACKAGE_PIN U5 [get_ports {LED_out[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[2]}]
        set_property PACKAGE_PIN V5 [get_ports {LED_out[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[1]}]
        set_property PACKAGE_PIN U7 [get_ports {LED_out[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[0]}]
        set_property PACKAGE_PIN U2 [get_ports {Anode_Activate[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[3]}]
        set_property PACKAGE_PIN U4 [get_ports {Anode_Activate[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[2]}]
        set_property PACKAGE_PIN V4 [get_ports {Anode_Activate[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[1]}]
        set_property PACKAGE_PIN W4 [get_ports {Anode_Activate[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[0]}]
## Switches
set_property PACKAGE_PIN V17 [get_ports {coin_1}]
	set_property IOSTANDARD LVCMOS33 [get_ports {coin_1}]
set_property PACKAGE_PIN V16 [get_ports {coin_2}]
	set_property IOSTANDARD LVCMOS33 [get_ports {coin_2}]
set_property PACKAGE_PIN W16 [get_ports {coin_5}]
	set_property IOSTANDARD LVCMOS33 [get_ports {coin_5}]
set_property PACKAGE_PIN W17 [get_ports {coin_10}]
	set_property IOSTANDARD LVCMOS33 [get_ports {coin_10}]
set_property PACKAGE_PIN W15 [get_ports {product_3}]
	set_property IOSTANDARD LVCMOS33 [get_ports {product_3}]
set_property PACKAGE_PIN V15 [get_ports {product_6}]
	set_property IOSTANDARD LVCMOS33 [get_ports {product_6}]
set_property PACKAGE_PIN W14 [get_ports {product_7}]
	set_property IOSTANDARD LVCMOS33 [get_ports {product_7}]
set_property PACKAGE_PIN W13 [get_ports {product_12}]
	set_property IOSTANDARD LVCMOS33 [get_ports {product_12}]
set_property PACKAGE_PIN V2 [get_ports {product_15}]
	set_property IOSTANDARD LVCMOS33 [get_ports {product_15}]
set_property PACKAGE_PIN T3 [get_ports {get_change}]
	set_property IOSTANDARD LVCMOS33 [get_ports {get_change}]
	
##Buttons
set_property PACKAGE_PIN U18 [get_ports confirm_purchase]
	set_property IOSTANDARD LVCMOS33 
    [get_ports confirm_purchase]
	
##LEDs
set_property PACKAGE_PIN U16 [get_ports {purchase_confirmed_led}]
	set_property IOSTANDARD LVCMOS33 [get_ports {purchase_confirmed_led}]