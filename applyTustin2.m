function [ numOut denOut ] = applyTustin2( numIn, denIn, frq )
%applyBilin : Tustin bilinear transform for 2nd order filter, with Laplace transfer function << a/( s^2 + b s + a  ) >>
% Laplace Transfer Function coefficients (normalised):
% - num     : a
% - den     : [ 1 b a ]
% - frq     : sampling frequency of discrete-time transfer function 

% quick one, no input checks

k1 = numIn;
k2 = denIn(2);
% frequency factor terms
A  = 2*frq;
A2 = A*A;

% output num : order [ 0 z^-1 z^-2 ]
numOut = [ k1 2*k1 k1 ];

% output den : same order
den0 = k1 + k2*A + A2;
den1 = 2*k1 - 2*A2;
den2 = k1 - k2*A + A2;

denOut = [ den0 den1 den2 ];

% done

end

