function [ numCoeffs denCoeffs ] = calcLopt3DTF( num, den, flgF32 )
% calcLopt3DTF: calculate 3rd order L-optim Papoulis-Legendre Filter - Direct Form II coeffs - selectable precision
%
% num   :   discrete-time transfer function numerator
% den   :   discrete-time transfer function denominator
% flgF32:   floating-point precision flag - TRUE -> single precision
%

% 17-05-2021        RC          File created.
%

% NOTE: 1st version - No parameter check 
%
fpDouble = true;
if ( flgF32 )
    % switch it
    fpDouble = false;
end
n0 = num(1);
n1 = num(2);
n2 = num(3);
n3 = num(4);
%
d0 = den(1);
d1 = den(2);
d2 = den(3);
d3 = den(4);
% Numerator Output
x_0C = ( n0/d0 );
x_1C = ( n1/d0 );
x_2C = ( n2/d0 );
x_3C = ( n3/d0 );
% Denominator Output
y_1C = ( d1/d0 );
y_2C = ( d2/d0 );
y_3C = ( d3/d0 );
%
% output with required precision
if ( fpDouble )
    % standard Matlab
    numCoeffs = [ x_0C x_1C x_2C x_3C ];
    denCoeffs = [ 1.0  y_1C y_2C y_3C ];
else
    % single precision
    numCoeffs = single( [ x_0C x_1C x_2C x_3C ] );
    denCoeffs = single( [ 1.0  y_1C y_2C y_3C ] );    
end

% done
    
end




