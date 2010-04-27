% clear;
% load tep_iqdata.mat;
% N = 201;
% prf = 35e3;
% delta_t = 1/140;
% theta_x = linspace(-pi/12, pi/12, N);
% theta_y = linspace(-pi/12, pi/12, N);
% f = 915e6;
% c = 3e8;
% lambda = c/f;
% P = Pout(lambda, theta_x, theta_y, iqdata, D);
% save computed.mat;

frames = size(iqdata,3);
mov(1:frames) = struct('cdata', [], 'colormap', []);
P_db = 10.*log(P);
for ii=1:frames
	pcolor(theta_x/pi*180, theta_y/pi*180, real(P_db(:,:,ii)));
	mov(ii) = getframe(gcf);
end

movie2avi(mov, 'video.avi', 'compression', 'None');