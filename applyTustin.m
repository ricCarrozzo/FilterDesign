function [ numOut denOut ] = applyTustin( numIn, denIn, frq )
%applyBilin : Tustin bilinear transform for 3rd order filter, with Laplace transfer function << a/( s^3 + b s^2 + c s + a  ) >>
% Laplace Transfer Function coefficients (normalised):
% - num     : a
% - den     : [ 1 b c a ]
% - frq     : sampling frequency of discrete-time transfer function 

% quick one, no input checks

k1 = numIn;
k2 = denIn(3);
k3 = denIn(2);
% frequency factor terms
A  = 2*frq;
A2 = A*A;
A3 = A2*A;

% output num : order [ 0 z^-1 z^-2 z^-3 ]
numOut = [ k1 3*k1 3*k1 k1 ];

% output den : same order
den0 = k1 + k2*A + k3*A2 + A3;
den1 = 3*k1 + k2*A - k3*A2 - 3*A3;
den2 = 3*k1 -k2*A - k3*A2 + 3*A3;
den3 = k1 - k2*A + k3*A2 - A3;

denOut = [ den0 den1 den2 den3 ];

% done

end

