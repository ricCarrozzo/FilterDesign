%
% How to calculate 3rd order L-Optimum coefficients for DTF transfer function
%
%

%
% continuous-time Laplace transfer function : << a/( s^3 + b s^2 + c s + a  ) >>
% - normalised frequency
% - unitary DC gain
%

%
% use Tustin bilinear transform to calculate the corresponding discrete-time transfer function : 
% (the Nyquist frequency, = 1/2 sampling frequency, essentially defines the extreme of the pass-band)
%
%  [ numD, denD ] = applyTustin( 0.5773502691896, [1  1.3107030551925 1.3589712494455 0.5773502691896 ], 10.0 )
%  numD =
%       5.773502691896000e-01     1.732050807568800e+00     1.732050807568800e+00     5.773502691896000e-01
%  denD =
%       8.552037997335099e+03    -2.449536974628052e+04     2.345027140374166e+04    -7.502320852642721e+03

%
% now rescale to obtain the normalised coefficients, i.e. the IIR Direct Form II coefficients
%
% [ numDTF, denDTF ] = calcLopt3DTF( numD, denD, false )
%  numDTF =
%       6.751025537649717e-05     2.025307661294915e-04     2.025307661294915e-04     6.751025537649717e-05
%  denDTF =
%       1.000000000000000e+00    -2.864272791340909e+00     2.742068196031051e+00    -8.772553226471304e-01
%

%
% Normalisation Gain for Initialisation input : 1.0/sum( numDTF )  
%



