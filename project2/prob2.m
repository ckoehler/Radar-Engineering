clear;
load tep_iqdata.mat;
d_x = D(:,1);
d_y = D(:,2);
d_z = D(:,3);
plot3(d_x,d_y,d_z,'*');