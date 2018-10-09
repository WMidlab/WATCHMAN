# RealTB_AXI_Stream
Date : 1st October 2018 - 12:11

# Folder Structure
## hw
Contains the hardware (PL) for the Zynq 7z010

## sdk
Contains the application project :
- DMA Test : simple test for running the AXI DMA and AXI Test Component
- DMA Multiple packes : sending multiple packets and receiving with timing analysis
- Containing information file on code [link](sdk/ReadMe.md)
## script
- CreateProjectVivado.tcl : which the file after the project is built according to the folder configuartion

> **IMPORTANT:**
> This file is used only once at the creation of the project 
> 1) Open Vivado 2018.2
> 2) Edit the name of the project in :  set ProjectName "Project_Name"
> 3) cd ../scripts (Change the directory to the scripts folder
> 4) source CreateProjectVivado.tcl
>
> this will create the Project_Name.prj under the XilinxBuild folder which is ignored with the .gitignore file.

- BuildProjectVivado.tcl (Prototype Version)
Will create the folder for sharing to GitHub.

## XilinxBuild
Build folder with Vivado temporary folders for synth and implementation, etc. 

## Data
Screenshots and data collected during diverse runs of the project.
