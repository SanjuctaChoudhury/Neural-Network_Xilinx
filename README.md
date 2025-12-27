# Neural-Network_Xilinx
#For detailed explanation refer my playlist-->https://www.youtube.com/playlist?list=PLqdl4yBjXmfKEP6GJMExV1XTOTVs-8Rlx
**Handwritten Digit Recognition Neural Network (Verilog Implementation)**
**📌 Project Overview**

This project implements a neural network for handwritten digit recognition (0–9) based on 28×28 pixel grayscale images.
The network architecture and parameters are derived from a Jupyter Notebook, and the final inference pipeline is implemented in Verilog.
The goal is to demonstrate how a simple neural network can be translated from a high-level software model into a hardware-oriented design.

**🧠 Neural Network Architecture**

The neural network is composed of 4 layers, as shown below:

**1. Input Layer**

Input image size: 28 × 28 pixels

Total input pixels: 784

Each pixel is encoded on 1 byte

In Verilog, the image is represented as a vector of 784 elements

This vector representation removes the need for an explicit flatten layer

**2. Average Pooling Layer**

Pooling type: Average pooling

Pooling window: 2 × 2

Output image size: 14 × 14

Total pooled pixels: 192

This step reduces the input dimensionality while preserving important spatial information.

**3. Hidden Layer (Dense Layer 1)**

Fully connected (dense) layer

Inputs: 192 pooled pixels

**4. Output Layer (Dense Layer 2)**

Fully connected layer with 10 neurons

Each neuron corresponds to a digit from 0 to 9

The digit with the highest output value is selected as the predicted class

**🔢 Classification Process**

Read the 28×28 input image as a 784-element vector

Apply 2×2 average pooling

Feed pooled data into Dense Layer 1

Compute outputs using Dense Layer 2

Select the neuron with the maximum value as the recognized digit

