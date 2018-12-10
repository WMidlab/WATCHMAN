#include "iic_DAC_LTC2657.h"


int DAC_LTC2657_initialize(void){

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
		
	return Status;	
}

int DAC_LTC2657_setvoltage(float voltage){

	int Status;
	char WriteBuffer[3];
		
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
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

int DAC_LTC2657_setchannelA( float voltage){

	int Status;
	char WriteBuffer[3];
		
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
		//Voltage 
	int intvolt = (int)(65536.0 * voltage / 2.5);	
	printf("Voltage : %lf\t%d\r\n",voltage,intvolt);

	WriteBuffer[0] = 0x30;	//0b00111111;
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
		
	return Status;	

}

int DAC_LTC2657_setchannelB( float voltage){

	int Status;
	char WriteBuffer[3];
		
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
		//Voltage 
	int intvolt = (int)(65536.0 * voltage / 2.5);	
	printf("Voltage : %lf\t%d\r\n",voltage,intvolt);

	WriteBuffer[0] = 0x31;	//0b00111111;
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
		
	return Status;	

}

int DAC_LTC2657_setVped( float voltage){

	int Status;
	char WriteBuffer[3];
		
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
		//Voltage 
	int intvolt = (int)(65536.0 * voltage / 2.5);	
	printf("Voltage : %lf\t%d\r\n",voltage,intvolt);

	WriteBuffer[0] = 0x37;	//0b00111111;
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
		
	return Status;	

}

int DAC_LTC2657_SetChannelVoltage(int channel, float voltage){

	int Status;
	char WriteBuffer[3];
		
	Status = XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	
	//Channel
	switch(channel){
		case CHANNEL_A:		xil_printf("Channel A:%d\t",channel);	break;
		case CHANNEL_B:		xil_printf("Channel B:%d\t",channel);	break;
		case CHANNEL_C:		xil_printf("Channel C:%d\t",channel);	break;
		case CHANNEL_D:		xil_printf("Channel D:%d\t",channel);	break;
		case CHANNEL_E:		xil_printf("Channel E:%d\t",channel);	break;
		case CHANNEL_F:		xil_printf("Channel F:%d\t",channel);	break;
		case CHANNEL_G:		xil_printf("Channel G:%d\t",channel);	break;
		case CHANNEL_H:		xil_printf("Channel H:%d\t",channel);	break;
		case CHANNEL_ALL:	xil_printf("Channel ALL:%d\t",channel);	break;
		default :		
			return XST_FAILURE;
			break;	
	}
	
		//Voltage 
	int intvolt = (int)(65536.0 * voltage / 2.5);	
	printf("%lf V\r\n",voltage);
	
	
	WriteBuffer[0] = 0x30 | channel;	
	WriteBuffer[1] = intvolt>>8;	//0b10000000; // MSB First
	WriteBuffer[2] = intvolt & 0x00FF;	//0b00000000; // LSB Last

	int i;
	for(i=0; i <5 ; i++){
		Status = XIic_MasterSend(&Iic,WriteBuffer,4);
		if(Status == XST_SUCCESS){
			break;
		}
	}
	if(i ==5)
		return XST_FAILURE;
		
	sleep(1);	//Time for the DAC to ouput and stabilize the voltages
	return Status;	

}

