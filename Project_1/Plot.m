%% Calculate and Plot Analytical Inductance

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


%% Calculate and Plot Analytical Torque
T = (-0.53*sind(2*theta))./((3-2*cosd(2*theta)).^2);
figure
plot(theta,T)
title("Torque Variation vs. Rotor Position","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$T$ [Nm]","Interpreter","latex");
grid minor;
xlim([0 360])
%% Import and Plot Inductance from FEA with Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\L Plot1.csv");
theta = data.x_theta_deg_;
L = data.Matrix1_L_Winding1_Winding1__mH_;
plot(theta,L);
grid minor;
title("Inductance Variation vs. Rotor Position from Maxwell, Linear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$L$ [mH]","Interpreter","latex");

L_0 = L(find(theta==0))
L_45 = L(find(theta==45))
L_90 = L(find(theta==90))
%% Import and Plot Stored Energy from FEA with Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\Expression Cache Plot1.csv");
theta = data.x_theta_deg_;
E = data.ExprCache_W_mag_exp1___;
plot(theta,E);
grid minor;
title("Stored Energy vs. Rotor Position from Maxwell, Linear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$E$ [J]","Interpreter","latex");

E_0 = E(find(theta==0))
E_45 = E(find(theta==45))
E_90 = E(find(theta==90))
%% Import and Plot Torque from FEA with Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\Torque Plot1.csv");
theta = data.x_theta_deg_;
T= data.Torque1_Torque_mNewtonMeter_;
plot(theta,T);
grid minor;
title("Torque Variation vs. Rotor Position from Maxwell, Linear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$T$ [mNm]","Interpreter","latex");


%% Import and Plot Inductance from FEA with Non-Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\L Plot1_sat.csv");
theta = data.x_theta_deg_;
L = data.Matrix1_L_Winding1_Winding1__mH_;
plot(theta,L);
grid minor;
title("Inductance Variation vs. Rotor Position from Maxwell, Nonlinear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$L$ [mH]","Interpreter","latex");

L_0 = L(find(theta==0))
L_45 = L(find(theta==45))
L_90 = L(find(theta==90))
%% Import and Plot Stored Energy from FEA with Non-Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\Expression Cache Plot1_sat.csv");
theta = data.x_theta_deg_;
E = data.ExprCache_W_mag_exp1___;
plot(theta,E);
grid minor;
title("Stored Energy vs. Rotor Position from Maxwell, Nonlinear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$E$ [J]","Interpreter","latex");

E_0 = E(find(theta==0))
E_45 = E(find(theta==45))
E_90 = E(find(theta==90))
%% Import and Plot Torque from FEA with Non-Linear Material
clear all;
clc;
close all;
data = readtable("Result_Data\Torque Plot1_sat.csv");
theta = data.x_theta_deg_;
T= data.Torque1_Torque_mNewtonMeter_;
plot(theta,T);
grid minor;
title("Torque Variation vs. Rotor Position from Maxwell, Nonlinear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$T$ [mNm]","Interpreter","latex");

%% Import and Plot Torque from FEA with Current Control
clear all;
clc;
close all;
data = readtable("Result_Data\Cont_Torque Plot1.csv");
theta = data.x_theta_deg_;
T= data.Torque1_Torque_mNewtonMeter_;
subplot(2,1,1)
plot(theta,T);
grid minor;
title("Torque Variation vs. Rotor Position from Maxwell, Linear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$T$ [mNm]","Interpreter","latex");
subplot(2,1,2)
I = 2.5*ones(length(theta),1);
I(find(theta >= 90 & theta <= 180)) = 0;
I(find(theta >= 270 & theta <= 360)) = 0;
plot(theta,I);
grid minor;
title("Current vs. Rotor Position from Maxwell, Linear Material","Interpreter","latex");
xlabel("$\theta$ [deg]","Interpreter","latex");
ylabel("$I$ [A]","Interpreter","latex");
sgtitle("Torque and Current Variation for Controlled System","interpreter","latex")

