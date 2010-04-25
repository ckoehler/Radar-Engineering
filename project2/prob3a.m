load tep_iqdata.mat;
lambda = .1;
N = 151;
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);
elements = length(D);
a_0 = [0; 0; 1];

w = rectwin(elements);
E = array_factor_3d(lambda, theta_x, theta_y, w, D, a_0);

surf(E);