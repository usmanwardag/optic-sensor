# optic-sensor
This project simulates the behavior of a fiber optic sensor that acts as a replacement of flex sensor. The design is taken from Wang et al (2015).

## Theory
The optical sensor has an LED, two rotatable polarizers and a photo-transistor. Through the first polarizer, the light is polarized along a single axis. The second polarizer moves with the motion of finger and thus helps predict the position of finger. When the finger is straight, the two sensors are perfectly aligned. 

![Optical Sensor](https://github.com/usmanwardag/optic-sensor/blob/master/Images/sensor.PNG)

## Simulation Model
Simulation is done by first getting the response of second polarizer as its angle is changed. 

![Simulation Behavior](https://github.com/usmanwardag/optic-sensor/blob/master/Images/simulation_behavior.PNG)

Afterwards, a second order polynomial is fitted. The advantage of such an approach is that expensive calculations are done only one time.

## Use Case

##### Run Simulink Model

By chaning the inputs, the response of model can be visualized.

##### Run Matlab Script

Pass any angle to `poly_find()` to get the ratio of amplitudes.

    poly_find(10, 45)

Get coefficients of fitted polynomial curve.

    poly_fit()

