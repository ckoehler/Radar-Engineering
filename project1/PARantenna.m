
elements = 25;
lambda = .1;
a_0 = [0 0 0]';
w = hann(elements);
w = rectwin(elements);

spacing = lambda/2;
the_angle = 50*pi/180;
theta_x = -the_angle:.01:the_angle;
theta_y = -the_angle:.01:the_angle;
[theta_x,theta_y] = meshgrid(0:2*pi/elements:2*pi,0:2*pi/elements:2*pi);
% theta_y = theta_y';

theta = atan(sqrt(tan(theta_x).^2+tan(theta_y).^2));
phi = atan(tan(theta_x)./tan(theta_y));

dn =  zeros(elements, elements);
dn(1,1:elements) = spacing*[1:elements];

k = 2*pi/lambda;
a_r = [sin(theta).*cos(phi); sin(theta).*sin(phi);  cos(theta)];
% E = [];
% loop through our angle
for ii=1:length(theta_x)
	tmp = 0;

	% get the location of where we want the E-field to be computed
	a = a_r(:, ii) - a_0;	

	% now loop through all the elements
	for jj=1:elements
		tmp = tmp + w(jj)*exp(j*k*dot(a,dn(:,jj)));
	end
	E(ii) = tmp;
end

E_db = 10*log10((E.*conj(E)).^2);

plot(E_db);
xlabel('Angle (degrees)');
ylabel('Antenna Pattern (dB)');