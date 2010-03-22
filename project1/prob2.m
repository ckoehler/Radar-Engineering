N = 100;
elements = 13;
lambda = .03;
a_0 = [0 0 0]';
w = hann(elements);
% w = rectwin(elements);

spacing = .36;
the_angle = 50*pi/180;

theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);


dn =  zeros(3, elements);
dn(1,1:elements) = spacing*1:elements;

k = 2*pi/lambda;