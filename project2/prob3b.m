load tep_iqdata.mat;
f = 915e6;
c = 3e8;
lambda = c/f;
N = 301;
theta_x = linspace(-pi/2, pi/2, N);
theta_y = zeros(1,N);
elements = length(D);
a_0 = [0; 0; 1];

w = rectwin(elements);
E = array_factor_2d(lambda, theta_y, theta_x, w, D, a_0);

plot(theta_x*180/pi, E);
% title('East-West antenna pattern')
title('North-South antenna pattern')
xlabel('angle (degrees)');
ylabel('gain (normalized, dB)');