function P = Pout(lambda, theta_x, theta_y,xall,d)

elements = size(d,1);
k = 2*pi./lambda;
P = zeros(length(theta_x), length(theta_y), length(size(xall,3)));

for jj=1:size(xall,3);
	x = xall(:,:,jj);
	for ii=1:length(theta_x)
		for kk=1:length(theta_y)
			tmp = 0;

			% get the location of where we want the E-field to be computed

			theta = atan(sqrt(tan(theta_x(ii)).^2+tan(theta_y(kk)).^2));
			phi = atan2(tan(theta_y(kk)), tan(theta_x(ii)));
			a_r = [sin(theta).*cos(phi) sin(theta).*sin(phi)  cos(theta)];
			% size(a_r)
			a = a_r;	


			a = repmat(a_r, elements, 1);

			w = exp(1i*k*dot(a,d,2));
			Rij = x*x'./260;
			P(ii,kk,jj) = w' * Rij * w;
		end
	end
end