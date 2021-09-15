function [ numCoeffs denCoeffs ] = calcDFIIform( num, den )
% calcDFIIform: calculate Direct Form II coeffs from discrete-time transfer function
%
% num   :   discrete-time transfer function numerator
% den   :   discrete-time transfer function denominator
%

% 19-05-2021        RC          File created.
%

% NOTE: 1st version - No parameter check
%

numCoeffs = [];
denCoeffs = [];
ordr = length( den );
if ( length( num ) ~= ordr )
    % can't have this
    errordlg('coefficient arrays must have same length', 'calcDFIIcoeff' );
    return;
end
%
% preallocation
numCoeffs = zeros( size( den ) );
denCoeffs = numCoeffs;
% scaling factor
sclFact = 1.0/den( 1 );
% calculation

numCoeffs = sclFact * num;
denCoeffs = sclFact * den;
% make sure
denCoeffs( 1 ) = 1.0;

%
% done

end

