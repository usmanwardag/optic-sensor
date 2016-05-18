function y = polarizer(gain, angle)

% Plots attenuation in Light Intensity caused by Polarizer tilt.

% Arguments:
% ----------
%   - gain: Intensity of Incident light
%   - angle: angle of polarizer tilt (in degrees)


angle = angle .* pi/180; % Convert angle to radians
y = gain *((cos(angle)).^2); % Malus's Law Equation Implemention

end