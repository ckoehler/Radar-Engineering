open NWRT_ARRAY.mat;
d_x = d(:,1);
d_y = d(:,2);
plot(d_x, d_y, '*');
title('PAR antenna elements');
xlabel('horizontal');
ylabel('vertical');


