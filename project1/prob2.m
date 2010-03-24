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
% spacing = .36/elements;
delta = .36/11.0;
the_angle = 50*pi/180;

% =========================
% = no touchy beyond here =
% =========================
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);

theta = atan(sqrt(tan(theta_x).^2+tan(theta_y).^2));
phi = atan(tan(theta_x)/tan(theta_y));

dn =  zeros(3, elements);
dn(1,1:elements) = spacing*[0:elements-1];
dn(1,1:elements) = delta.*[0 1 4 9 11];
% dn = d';

k = 2*pi/lambda;
a_r = [sin(theta)*cos(phi); sin(theta)*sin(phi);  cos(theta)];
E = [];
% loop through our angle
for ii=1:length(theta_x)
	tmp = 0;
	
	% now loop through all the elements
	for jj=1:elements
		% get the location of where we want the E-field to be computed
		a = a_r(:, ii) - a_0;
		tmp = tmp + w(jj)*exp(j*k*dot(a,dn(:,jj)));
	end
	E = [E tmp];
end

E_db = 10*log10((E.*conj(E)).^2);
E_db = E_db - max(E_db);
title_str = sprintf('Azimuthal antenna pattern (%i elements, irregular spacing)', elements);
% title_str = sprintf('Azimuthal antenna pattern (%i elements, %2.0f cm spacing)', elements, spacing*100);
plot(theta_x*180/pi, E_db);
title(title_str);
xlabel('Angle (degrees)');
ylabel('Antenna Pattern (dB)');