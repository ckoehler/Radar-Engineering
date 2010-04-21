function E = array_factor_2d(lambda, theta_x, theta_y, w, dn, a_0)
	elements = length(dn);
	theta = atan(sqrt(tan(theta_x).^2+tan(theta_y).^2));
	phi = atan2(tan(theta_y),tan(theta_x));
	k = 2*pi/lambda;
	a_r = [sin(theta).*cos(phi); sin(theta).*sin(phi);  cos(theta)];
	E = [];
	% loop through our angle
	for ii=1:length(theta_x)
		tmp = 0;

		% now loop through all the elements
		for jj=1:elements
			% get the location of where we want the E-field to be computed
			a = a_r(:, ii) - a_0;
			% a = repmat((a_r - a_0), N, 1);

			tmp = tmp + w(jj)*exp(j*k*dot(a',dn(jj,:)));
			% E = sum()
		end
		E = [E tmp];
	end

	E = 10*log10((E.*conj(E)));
	E = E - max(E);
