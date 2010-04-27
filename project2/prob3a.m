load tep_iqdata.mat;

f = 915e6;
c = 3e8;
lambda = c/f;
N = 201;
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);
elements = length(D);
a_0 = [0; 0; 1];

w = rectwin(elements);
E = array_factor_3d(lambda, theta_x, theta_y, w, D, a_0);

pcolor(E);