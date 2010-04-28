clear;
load tep_iqdata.mat;

% read maxima from first and last frame
coord1 = [5.7 -3.9];
coord2 = [-3.9 1.95];

% calculate distance in between them (in degrees)
deg_dist = sqrt((coord1(2) - coord2(2)).^2 + (coord1(1) - coord2(1)).^2);

% looking at the dates, the first and last scan are 50 seconds apart
time_diff = 50;

vel_deg = deg_dist/time_diff;

% to get the actual distance in meters, we can use trig: sin(theta) = distance / range
m_dist = sin(deg2rad(deg_dist)) * r;

% then the actual velocity is m_dist / time_diff
vel = m_dist / time_diff;

% max unambigous range
c = 3e8;
Ts = 1/35e3;
r_a = c * Ts / 2;

% if the signal was a second trip echo, the real distance would be:
r_real = r_a + r;
m_dist_real = sin(deg2rad(deg_dist)) * r_real;
vel_real = m_dist_real / time_diff;

% direction
dir_vec = coord2 - coord1;
angle = rad2deg(atan2(dir_vec(2),dir_vec(1)));
