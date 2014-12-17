%code to calculate impact force
%based on "The Standard Equation for Impact Force" by R. Goldstone
%also includes reference to "Physics of climbing ropes: impact forces, fall
%factors and rope drag" by Ulrich Leuthausser (v2 14.5.2012)

clear all; close all; clc;

%---inputs---
w=160; %climber weight (lbs)
H=linspace(0,20); %fall distance (ft)
L=50; %amount of rope out (ft)
impForce=7.9; %ropes listed impact force (kilonewtons)
%------------

%determine climber weight (kilonewtons)
wKN = w*4.45/1000; 

%determine rope modulus (kilonewtons)
k = impForce*(impForce - 1.568)/2.791;

%determine fall factor (unitless)
fallFactor = H/L;
if fallFactor > 2
    error('Fall factor cannot be greater than 2!')
end

%calculate max tension (kilonewtons)
T = wKN + (wKN^2 + 2*k*fallFactor*wKN).^0.5;

%conventional addition friction force on top carabiner
%Goldstone quotes value of 5/3~1.67
%Leuthausser quotes a value of 1.46 (see p7)
%here we use 1.5
Tf = T*1.5;

plot(H,Tf,'Linewidth',2); set(gca,'Fontsize',18);
xlabel('Distance (ft)'); ylabel('Force (kN)');
grid on




