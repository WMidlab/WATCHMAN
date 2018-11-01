#include "iic_DAC_LTC2657.h"


int DAC_LTC2657_initialize(float voltage){

	int Status = XST_SUCCESS;
	
	XIic_Config *ConfigPtr;	/* Pointer to configuration data */
	
	char WriteBuffer[3];
	
	ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&Iic, ConfigPtr,
					ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
	// No interrupt like it is only write only
	
	XIic_Start(&Iic);
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/*
	int XIic_MasterSend	(	XIic* 	InstancePtr, u8* 	TxMsgPtr, int 	ByteCount)
	Function to be called for accessing the IIC device
	*/
	
	//Voltage 
	int intvolt = (int)(65536.0 * voltage / 2.5);	
	printf("Voltage : %lf\t%d\r\n",voltage,intvolt);

	WriteBuffer[0] = 0x0F;	//0b00111111;
	WriteBuffer[1] = intvolt>>8;	//0b10000000; // MSB First
	WriteBuffer[2] = intvolt & 0x00FF;	//0b00000000; // LSB Last

	int i;
	for(i=0; i <5 ; i++){
		Status = XIic_MasterSend(&Iic,WriteBuffer,4);	// +1 for I2C address
		if(Status == XST_SUCCESS){
			break;
		}
	}
	if(i ==5)
		return XST_FAILURE;
	sleep(1);
	
	WriteBuffer[0] = 0x1F;	//0b00111111;
	WriteBuffer[1] = intvolt>>8;	//0b10000000; // MSB First
	WriteBuffer[2] = intvolt & 0x00FF;	//0b00000000; // LSB Last

	for(i=0; i <5 ; i++){
		Status = XIic_MasterSend(&Iic,WriteBuffer,4);
		if(Status == XST_SUCCESS){
			break;
		}
	}
	if(i ==5)
		return XST_FAILURE;
		
	return Status;	
}

