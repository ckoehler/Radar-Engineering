N = 501;
elements = length(d);
% elements = 13;
lambda = .1;
theta_x0 = pi/4;
theta_y0 = 0;

theta0 = atan(sqrt(tan(theta_x0).^2+tan(theta_y0).^2));
phi0 = atan2(tan(theta_y0),tan(theta_x0));

% a_0 = [sin(theta0)*cos(phi0); sin(theta0)*sin(phi0); cos(theta0)];
a_0 = [0; 0; 1];

% w = hann(elements);
%w = hamming(elements);
w = rectwin(elements);
dn = d;
% spacing = lambda/2;
% spacing = .36/elements;
% delta = .36/11.0;


% =========================
% = no touchy beyond here =
% =========================
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);
theta_y = zeros(1,N);


E_db = array_factor_2d(lambda, theta_x, theta_y, w, dn, a_0);

title_str = sprintf('Azimuthal antenna pattern (%i elements, 0\\circ)', elements);
% title_str = sprintf('Azimuthal antenna pattern (%i elements, %2.0f cm spacing)', elements, spacing*100);
plot(theta_x*180/pi, E_db);
title(title_str);
xlabel('Angle (degrees)');
ylabel('Antenna Pattern (dB)');