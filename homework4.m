close all; clear all; clc;
syms Vin Vm Vd Vout_A Vout_B Il Il_A Il_B Ic Ir C L R t s

%% Phase A
% x = [Vout Vm Il Ic Ir]
% written eqs into matrix A
A = [s -s 0 0 0;        % (1)
     0 -1 L*s 0 0;      % (2)
     C*s 0 0 -1 0;      % (3)
     -1 0 0 0 R;        % (4)
     0 0 1 1 1];        % (5)

b = [Vd; L*Il_A; C*Vout_A; 0; 0]; 
x = A\b;

Vout = x(1)
Il = x(3)

%% Phase B
% x = [Vout Vm Il Ic Ir]
% written eqs into matrix A2
A2 = [0 -1 L*s 0 0;     % (6)
      C*s 0 0 -1 0;     % (7)
      s -1 0 0 0;       % (8)
      -1 0 0 0 R;       % (9)
      0 0 1 1 1];       % (10)

b2 = [L*Il_B; C*Vout_B; Vd; 0; 0];
x2 = A2\b;

Vout2 = x2(1)
Il2 = x2(3)
%% Inverse Laplace
VoA_t = ilaplace(Vout)
IlA_t = ilaplace(Il)

VoB_t = ilaplace(Vout2)
IlB_t = ilaplace(Il2)