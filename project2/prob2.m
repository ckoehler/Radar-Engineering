clear;
load tep_iqdata.mat;
d_x = D(:,1);
d_y = D(:,2);
plot(d_x,d_y,'*');
title('Spatial Antenna Layout');
xlabel('distance (m)');
ylabel('distance (m)');