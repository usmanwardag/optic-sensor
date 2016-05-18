clear all;

angles = 0:1:180;
responses = polarizer(1, angles);

plot(responses)
axis ([0 180 0 1]);
xlabel('Angles (in degrees)');
ylabel('Light Intensity Attentuation');
title('Polarizer Response Curve');
grid on
