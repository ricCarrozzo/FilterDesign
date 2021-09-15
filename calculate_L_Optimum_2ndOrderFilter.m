%
% Using Wolfram Alpha to expand polynomials
%
% L-Optimum 4th order

% 4th order "L" polynomial: w^4

% swap -s^2 -> w^2

% polynomial : 1 + s^4 

% cLSQP4 = [1 0 0 1 ] polynomial coefficients

% roots
%
% roots( cLSQP4 )
% ans =
%      -1.000000000000000e+00 + 0.000000000000000e+00i
%       4.999999999999998e-01 + 8.660254037844383e-01i
%       4.999999999999998e-01 - 8.660254037844383e-01i
%
% get the roots with positive real part and form the Hurwitz polynomial
%
% from Wolfram Alpha:
%
% expand (s + 4.999999999999998e-01 + 8.660254037844383e-01i ) (  s + 4.999999999999998e-01 - 8.660254037844383e-01i )
%
% gives -> s^2 + 0.9999999999999996 s + 0.999999999999999 --- i.e. s^2 + s + 1.0


%
% verify roots:
% cPOLY4 = [ 1 1 1 ]
%
% roots( cPOLY4 )
% ans =
%      -5.000000000000000e-01 + 8.660254037844385e-01i
%      -5.000000000000000e-01 - 8.660254037844385e-01i
%

% transfer function for unit gain on DC :
% TF   ->   1 / ( s^2 + s + 1 )
% 

% h2 = tf( [0 1], [ 1  1 1 ])


