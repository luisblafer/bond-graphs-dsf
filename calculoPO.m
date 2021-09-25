%% SCRIPT PARA CALCULAR LOS PUNTOS DE OPERACIÓN DEL MCC-IP Y CONSTANTES
% CON ESTOS SCRIPTS PODEMOS CALCULAR LOS PUNTOS DE OPERACION DE NUESTRO
% MOTOR PARA LAS DIFERENTES CONDICIONES DE LAS VARIABLES DE ENTRADA DEL
% MISMO.


% LIMPIAMOS EL WORKSPACE
clc
clear all
close all


%% DEFINIMOS PARÁMETROS
Ra = 365.0e-3;
La = 161.0e-6;
J = 134e-6;
UaN = 48.0;
TcN = 800e-3;
W0 = 3670 *2*pi/60;
Wn = 3420 *2*pi/60;
I0 = 289e-3;
In = 6.8;
Km = 123e-3;
b = Km*I0/W0;

%% ESTRUCTURA SIMBÓLICA DE LAS VARIABLES
s.Ra = Ra;
s.La = La;
s.Un = UaN;
s.W0 = W0;
s.Wn = Wn;
s.I0 = I0;
s.In = In;
s.Km = Km;
s.b = b;
s.J = J;

%% CALCULO DEL ESTADO DE LAS VARIABLES
[W,I] = stateRpe(1.0*UaN,0.0*TcN,s);

J_state = W*J;
La_state = I*La;

J_state
La_state

%%
% Constantes de tiempo subsistemas del motor

% Armadura
Ta = La / Ra;

% Rotorica
Tr = J / b;

% Mecanica
Tm = (J*Ra) / (Km^2+b*Ra);
