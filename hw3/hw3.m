load fluct_loss.mat;

P_d = linspace(.3,.99, 70);
G = 33;			% antenna gain
P_t = 25e3;		% peak transmit power
tau = .15e-6;	% pulse width

f = 9400e6;		% carrier frequency
c = 3e8;		% speed of light
L_f = Lf;		
sig = 10;		% radar cross section, 10 m^2
prf = 4000;
omega_r = 20;
prt = 1/prf;
k = 1.38e-23;	% Boltzmann constant
T_0 = 290;		% std temp
F_n = 5;		% rec noise figure (dB)
B = 15e6;		% rec bandwidth
L_s = 12;		% system losses (dB)
theta_B_h = .8;
theta_B_v = 15;


T_fa = (4*3600);	% time between false alarms
P_fa = 1/(B*T_fa);	% probability of false alarm


lambda = c / f;
n = theta_B_h*prf/(6*omega_r);	% # of pulses

A_e = G * lambda^2 /( 4 * pi);	% effective aperture
P_av = tau / prt * P_t;		% avg power

% bunch of SNR calculations
A = log(.62./P_fa);
B = log(P_d./(1-P_d));

SNR_1 = 10*log10(A + .12 * A .* B + 1.7 * B);
SNR_n = -5 * log10(n) + (6.2 + 4.54/sqrt(n + .44)) * SNR_1;


E_i = SNR_1 / (SNR_n * n); % integration efficiency factor

% max range w/o fluctuation loss
R_max_ll = (P_av * G * A_e * sig * n * E_i ./ ((4*pi)^2 * k * T_0 * F_n * B * tau * prf .* SNR_1 * L_s)).^(1/4);
plot(P_d, R_max_ll);

R_max = (P_av * G * A_e * sig * n * E_i ./ ((4*pi)^2 * k * T_0 * F_n * B * tau * prf .* SNR_1 .* L_f * L_s)).^(1/4);
figure;
plot(P_d, R_max);
