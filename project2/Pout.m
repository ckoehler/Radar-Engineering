function [P,w,Rij] = Pout(a_r,x,d)
k = 2*pi / .1;
w = zeros(1,length(d));
for ii=1:length(d)
	w(ii) = exp(1i*k*dot(a_r, d(ii,:)));
end

Rij = x*ctranspose(x);
P =  w * Rij * ctranspose(w);