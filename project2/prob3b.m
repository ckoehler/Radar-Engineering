load tep_iqdata.mat;
lambda = .1;
N = 251;
theta_x = linspace(-pi/2, pi/2, N);
theta_y = zeros(1,N);
elements = length(D);
a_0 = [0; 0; 1];

w = rectwin(elements);
E = array_factor_2d(lambda, theta_x, theta_y, w, D, a_0);

plot(theta_x*180/pi, E);