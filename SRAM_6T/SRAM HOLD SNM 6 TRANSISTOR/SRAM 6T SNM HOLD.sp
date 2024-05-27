
***SRAM 10 TRANSISTOR***

***MOHAMMAD PAHLEVANI & SEYYED ALIREZA EBRAHIMIAN***

***400131037 & 400131033***

***LIBRARY***
.include	"45nm.pm"

***PARAMETERS***
.TEMP	27
.GLOBAL	VDD
.TRAN	1ns 	100ns 	UIC
.PARAM 	VDD = 1
.PARAM 	L = 90n
.PARAM 	WN = 225n
.PARAM 	WP = 675n
.PARAM 	WNA = 90n
.PARAM	U = 0
.PARAM 	UL = '-VDD/sqrt(2)'
.PARAM 	UH = ' VDD/sqrt(2)'

***TRANSISTOR***
Mpl 	VDD 	QB 	QD 	VDD	pmos	w=WP	l=L
Mpr	VDD	Q 	QBD 	VDD 	pmos	w=WP	l=L
Mnl 	QD 	QB 	gnd 	gnd 	nmos	w=WN	l=L
Mnr	QBD 	Q 	gnd 	gnd 	nmos	w=WN	l=L
Mnar 	BLB 	WL 	QBD 	gnd 	nmos	w=WNA	l=L
Mnal	BL 	WL 	QD 	gnd 	nmos	w=WNA	l=L

***VOLTAGES***
VVDD	VDD 	0 	DC=VDD
VWL 	WL 	0 	DC=0

***NODESET***
.NODESET 	V(QB)=VDD
.NODESET	V(QD)=0

***IC***
.IC	V(Q) = VDD
.IC 	V(QB) = 0
.IC 	V(BL) = 0
.IC 	V(BLB) = VDD

***45 DEGREE ANGLE***
EQ 	Q 	0 	VOL=' 1/sqrt(2)*U + 1/sqrt(2)*V(V1)'
EQB 	QB 	0 	VOL='-1/sqrt(2)*U + 1/sqrt(2)*V(V2)'

***INVERTER CHARACTERISTICS***
EV1 	V1 	0 	VOL=' U + sqrt(2)*V(QBD)'
EV2 	V2 	0 	VOL='-U + sqrt(2)*V(QD)'

***ABSOLUTE SNM***
EVD 	VD 	0 	VOL='ABS(V(V1) - V(V2))'
.DC 	U 	UL 	UH 	0.01
.PRINT 	DC 	V(QD) 	V(QBD)
.MEASURE	DC 	MAXVD 	MAX 	V(VD)

***MEASURE SNM***
.MEASURE 	DC 	SNM 	param='1/sqrt(2)*MAXVD'
.MEASURE 	tran 	dyn_pow 	AVG	power 	from 	0ns 	to 	100ns
.PRINT	TRAN	V(QB) 	V(Q)

***OPTION***
.op
.option	post=2

***END***
.END