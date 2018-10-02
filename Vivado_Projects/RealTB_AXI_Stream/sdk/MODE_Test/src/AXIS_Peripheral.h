
#ifndef AXIS_PERIPHERAL_H   /* prevent circular inclusions */
#define AXIS_PERIPHERAL_H   /* by using protection macros */

/*** Definition of Registers ****************************************/


#define	CONTROL_REG			0
#define	NBR_OF_PACKETS_REG	1
#define	CONTENT_PACKET_1	2
#define	MODE_REG			3

// Modes for MODE REGISTER
#define	RAMP_MODE			0
#define	SAW_MODE			1
#define	BIT_MODE			2
	
#endif  /* end of protection macro */
