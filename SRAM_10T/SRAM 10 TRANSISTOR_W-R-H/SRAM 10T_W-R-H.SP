
***SRAM 10 TRANSISTOR***

***MOHAMMAD PAHLEVANI & SEYYED ALIREZA EBRAHIMIAN***

***400131037 & 400131033***

***LIBRARY***
.include 	"45nm.pm"

***PARAMETERS***
.Global	VDD	GND
.TRAN	1ps	9ns

***VOLTAGES***
VDD	vdd	gnd	1
VBL	BL 	gnd 	PULSE 	1	0	3NS	0.8PS	0.8PS	6NS	9NS
VBLB 	BLB 	gnd 	PULSE 	0 	1	6NS 	0.8PS 	0.8PS 	3NS 	9NS
VWL 	WL 	gnd 	PULSE 	1	0 	3NS  	0.8PS 	0.8PS 	3NS 	6NS	0.8PS	0.8PS	3NS	9NS
VWWL 	WWL 	gnd 	PULSE 	1	0 	3NS  	0.8PS 	0.8PS 	3NS 	6NS	0.8PS	0.8PS	3NS	9NS

***TRANSISTOR***
Mnr	QB 	Q 	gnd 	gnd 	nmos	w=45n	l=45n  
Mnl 	Q 	QB 	gnd 	gnd 	nmos	w=45n	l=45n
Mpr	vdd 	Q 	QB 	vdd 	pmos	w=90n	l=45n 
Mpl 	vdd 	QB 	Q 	vdd 	pmos	w=90n	l=45n
Mnarr 	BLB 	WL 	2 	gnd 	nmos	w=45n	l=45n
Mnall	BL 	WL 	1 	gnd 	nmos	w=45n	l=45n
Mnar 	2 	WWL 	QB 	gnd 	nmos	w=45n	l=45n
Mnal 	1 	WWL 	Q 	gnd 	nmos	w=45n	l=45n
Mndr 	2 	QB 	gnd 	gnd 	nmos	w=45n	l=45n
Mndl 	1 	Q 	gnd 	gnd 	nmos	w=45n	l=45n

***OPTION***
.options	post=2	nomod 
.op 
	
***END***
.end