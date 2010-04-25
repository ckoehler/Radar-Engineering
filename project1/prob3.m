load NWRT_ARRAY.mat;
d_x = d(:,1);
d_y = d(:,2);
plot(d_x, d_y, '*');
title('PAR antenna elements');
xlabel('horizontal');
ylabel('vertical');


N = 100;
elements = length(d);
lambda = .1;
a_0 = [0 0 0]';
w = hann(elements);
% w = rectwin(elements);

spacing = lambda/2;
the_angle = 50*pi/180;

theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);


E_db = array_factor_3d(lambda, theta_x, theta_x, w, d, a_0);


surf(E_db);
