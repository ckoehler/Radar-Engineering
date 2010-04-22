prf = 35e3;
delta_t = 1/140;
a_r = [0; 0; 1];
x = iqdata(:,:,1);
[P, w, Rij] = Pout(a_r, x, D);