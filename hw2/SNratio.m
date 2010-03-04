
P_d = [.3:0.01:.999];
P_fa = [10^-3 10^-4 10^-5 10^-6 10^-7 10^-8 10^-9 10^-10 10^-11 10^-12];

x = length(P_d);
y = length(P_fa);

for ii=1:y
	A = log(.62./P_fa(ii));
	B = log(P_d./(1-P_d));
	SN = A + .12 * A .* B + 1.7 * B;			
	semilogx(SN, P_d);
	xlabel('Signal to noise ratio');
	ylabel('Probability of detection');
	title('SNR in respect to P_d and P_{fa}')
	hold on;
end

