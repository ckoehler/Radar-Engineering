N = 200;
elements = 5;
lambda = .03;
a_0 = [0 0 0]';
w = hann(elements);
w = rectwin(elements);

spacing = .36/elements;
% delta = .36/11.0;
the_angle = 50*pi/180;

% =========================
% = no touchy beyond here =
% =========================
theta_x = linspace(-pi/2, pi/2, N);
theta_y = linspace(-pi/2, pi/2, N);

theta = atan(sqrt(tan(theta_x).^2+tan(theta_y).^2));
phi = atan(tan(theta_x)/tan(theta_y));

dn =  zeros(3, elements);
dn(1,1:elements) = spacing*[1:elements];
% dn(1,1:elements) = delta.*[0 1 4 9 11];


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
% title_str = sprintf('Azimuthal antenna pattern (%i elements, uneven spacing)', elements);
title_str = sprintf('Azimuthal antenna pattern (%i elements, %2.0f cm spacing)', elements, spacing*100);
plot(theta_x*180/pi, E_db);
title(title_str);
xlabel('Angle (degrees)');
ylabel('Antenna Pattern (dB)');