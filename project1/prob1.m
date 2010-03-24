N = 201;
elements = 25;
lambda = .1;
a_0 = [0; 0; 0];
% w = hann(elements);
w = rectwin(elements);

spacing = lambda/2;
the_angle = 50*pi/180;

theta_x = linspace(-the_angle, the_angle, N);
theta_y = linspace(-the_angle, the_angle, N);


dn =  zeros(3, elements);
dn(1,1:elements) = spacing*0:elements-1;

k = 2*pi/lambda;

% E = [];
E = zeros(length(theta_x), length(theta_y));
for ii=1:length(theta_x)
	for kk=1:length(theta_y)
		tmp = 0;

		% get the location of where we want the E-field to be computed

		theta = atan(sqrt(tan(theta_x(ii)).^2+tan(theta_y(kk)).^2));
		phi = atan2(tan(theta_y(ii)),tan(theta_x(kk)));
		a_r = [sin(theta).*cos(phi); sin(theta).*sin(phi);  cos(theta)];
		a = a_r - a_0;	
		% now loop through all the elements
		for jj=1:elements
			tmp = tmp + w(jj)*exp(j*k*dot(a,dn(:,jj)));
		end
		E(ii,kk) = tmp;
		
	end
end

E_db = 10*log10((E.*conj(E)).^2);
E_db = E_db - max(max(E_db));
surf(E_db);
title('2-D antenna pattern (25 elements, 5cm spacing)');
xlabel('x-dimension');
ylabel('y-dimension');
zlabel('antenna pattern (dB)');