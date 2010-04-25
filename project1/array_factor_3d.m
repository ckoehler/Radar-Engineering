function E = array_factor_3d(lambda, theta_x, theta_y, w, dn, a_0)
	elements = length(dn);
	k = 2*pi/lambda;
	E = zeros(length(theta_x), length(theta_y));
	for ii=1:length(theta_x)
		for kk=1:length(theta_y)
			tmp = 0;

			% get the location of where we want the E-field to be computed

			theta = atan(sqrt(tan(theta_x(ii)).^2+tan(theta_y(kk)).^2));
			phi = atan2(tan(theta_y(ii)), tan(theta_x(kk)));
			a_r = [sin(theta).*cos(phi); sin(theta).*sin(phi);  cos(theta)];
			a = a_r - a_0;	
			% now loop through all the elements
			for jj=1:elements
				tmp = tmp + w(jj)*exp(1i*k*dot(a,dn(jj,:)));
			end
			E(ii,kk) = tmp;

		end
	end

	E_db = 10*log10((E.*conj(E)));
	E_db1 = E_db - max(E_db);