close all; clear all; clc;

syms L C R_load V_i I_L I_C I_Rload V_o s zeta
%% Question 1: LPF2
% given: L C R_load V_i
% unknown variables: I_L I_C I_Rload V_o
A = [1 -1 -1 0;         % I_L - I_C - I_Rload = 0
    L*s 0 0 1;          % V_o + L*d(I_L)/dt = V_i
    0 1 0 -C*s;         % I_C - C*d(V_o)/dt = 0
    0 0 -R_load 1];     % -I_Rload*R_load + V_load = 0
b = [0; V_i; 0; 0]; 
x = A\b;                % solving for unknown vars. 
%% Question 2
omega4 = 10;            % given
zeta = [0.1; 0.7; 1];   % given

F_LPF2_damped_01 = RR_tf([omega4^2],[1 2*zeta(1)*omega4 omega4^2]);
F_LPF2_damped_07 = RR_tf([omega4^2],[1 2*zeta(2)*omega4 omega4^2]);
F_LPF2_damped_1 = RR_tf([omega4^2],[1 2*zeta(3)*omega4 omega4^2]);

figure
RR_bode(F_LPF2_damped_01); title('zeta = 0.1');
figure(2)
RR_bode(F_LPF2_damped_07); title('zeta = 0.7');
figure(3)
RR_bode(F_LPF2_damped_1); title('zeta = 1');



