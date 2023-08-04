# IJ R4 LED Matrix Editor

![Clipboard](https://github.com/mutterer/IJR4Matrix/assets/711344/ca0e6c74-2a5c-49de-a000-ff6983c7d1e4)

## Description
This is an ImageJ based led matrix frames editor for the Arduino Uno R4 WiFi led matrix.

## Software involved 
- **ImageJ**
  
ImageJ is a free open source image processing software developed by Wayne Rasband.
- **JSSC library**

JSSC is a Java library for serial pot communication. 
- **Serial Macro Extensions plugin**
  
This ImageJ plugin is a JSSC wrapper to provide serial access from the ImageJ macro programming language. 
- **ActionBar plugin**
  
This ImageJ plugin allows to extend ImageJ GUI with customizable button bars.
- **LED_Matrix.ijm config file**
  
This file is used by ActionBar to render the additional GUI buttons and define what they are doing. 
- **Matrix.tif sample file**
  
This is an example multipage TIFF file that can hold matrix frames.  
- **PreviewMatrix.ino**
  
This is the UNO R4 WiFi firmware that accepts sets of bytes and updates the LED matrix. It's modified from the Arduino "live preview" example sketch. 
 
## Installation
- Install ImageJ from instructions at ```https://imagej.nih.gov/ij/download.html```
- Clone this repository
- Move all files to your local ```ImageJ/plugins/``` folder


## Usage
- Start ImageJ
- Select ```ImageJ>Plugins>ActionBar>LED_Matrix``` to start the led matrix editor
- Plug your UNO R4 WiFi
- Select serial port using the ```Select Port``` button
- Establish connection by pressing the ```Connect``` button
- Draw pixels on the matrix
- Convert image and send it to the R4 with the ```Send Frame``` button

- ```New Matrix``` create a blank matrix window with 2 frames 
- ```Hexdump``` logs 3x32bit hex words that encode the current frame
- ```Close Serial``` frees the serial port if you want to switch to the Arduino IDE
- Use ```ImageJ>Image>Stack>Add Slice``` to add a new frame to the stack
- Use *whatever* ImageJ functions to create new frames programmatically
- Enjoy!


