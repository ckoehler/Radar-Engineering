N = 1001;
% elements = length(d);
elements = 5;
lambda = .03;
% a_0 = [sin(pi/4)*cos(0); sin(pi/4)*sin(0); cos(pi/4)];
a_0 = [0; 0; 1];

% w = hann(elements);
% w = hamming(elements);
w = rectwin(elements);

% spacing = lambda/2;
spacing = .36/(elements-1);
delta = .36/11.0;

% =========================
% = no touchy beyond here =
% =========================
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);
% theta_y = zeros(1,N);

dn =  zeros(3, elements);
% dn(1,1:elements) = spacing*[0:elements-1];
dn(1,1:elements) = delta*[0 1 4 9 11];
dn = dn';

E_db = array_factor_2d(lambda, theta_x, theta_y, w, dn, a_0);

title_str = sprintf('Azimuthal antenna pattern (%i elements, irregular spacing)', elements);
% title_str = sprintf('Azimuthal antenna pattern (%i elements, %2.0f cm spacing)', elements, spacing*100);
plot(theta_x*180/pi, E_db);
title(title_str);
xlabel('Angle (degrees)');
ylabel('Antenna Pattern (dB)');