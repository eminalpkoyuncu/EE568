clear all;
clc;
N = 300;
theta = 1:1:360;
lgap = 1e-3*(3-2*cosd(2*theta));
R = lgap./(4*pi*1e-7*15*25*1e-6);
L = N^2./R;
figure;
plot(theta,L*1e3)
title("Inductance Variation vs. Rotor Position","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$L(\theta)$ [mH]","Interpreter","latex");
grid minor;
xlim([0 360])


%%
T = (-0.53*sind(2*theta))./((3-2*cosd(2*theta)).^2);
figure
plot(theta,T)
title("Torque Variation vs. Rotor Position","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$T$ [Nm]","Interpreter","latex");
grid minor;
xlim([0 360])