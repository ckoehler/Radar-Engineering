
% data points
N = 100;
elements = 25;
lambda = .1
spacing = lambda/2
theta_x = [-50, 50]
theta_y = [-50, 50]


theta_z = 0
a_0 = 0;
w = hanning(N);


dn = [0:elements-1];
dn = spacing*dn
k = 2*pi/lambda;
a_r = ax * theta_x + ay*theta_y + az* theta_z

E = sum(w*exp(j*k*dot(a_r-a_0, dn)))