# -*- coding: utf-8 -*-
"""
Created on Thu Jun 10 08:07:51 2021

@author: ricca
"""
#
# Filter comparison - Bode plot
#
from scipy import signal
import numpy as np
import matplotlib.pyplot as plt
from numpy import polynomial as poly
#
# 3rd order L-Optimum polynomial is w^2 - 3w^4 + 3w^6
# hence 1 + (w^2 -> -s^2 polynomial) -->
# 1 -S^2 -3s^4 -3s^6 --> coeffs [ 1, 0, -1, 0, -3, 0, -3]
p = poly.Polynomial( [1, 0, -1, 0 , -3, 0, -3] )
#
# find the zeros:
poles = p.roots()
# print them out:
# poles
#
# pick roots with positive real part and form Hurwitz polynomial:
p1 = poly.Polynomial( [ 1, poles[3] ] )
p2 = poly.Polynomial( [ 1, poles[4] ] )
p3 = poly.Polynomial( [ 1, poles[5] ] )
#
pFilt  = (p1 * p2 * p3)
# coefficients
coeffs = pFilt.coef
# define the transfer function in S
# --> numerator is order 0 coefficient
tfLopt3 = signal.lti( [ coeffs.real[3] ], coeffs.real )
# apply Tustin bilinear transform and get the discrete-time equivalent 
lopt3tz = signal.bilinear( tfLopt3.num, tfLopt3.den, 10 )
#
# returning a tuple with [o] -> numerator and [1] denominator of transformed
# discrete-time transfer function
# NOTE: the case with Fs = 10 Hz
# --> coefficients compare with Matlab calculation
#
# Bode

filtz3 = signal.lti( *lopt3tz )
wz3, hz3 = signal.freqz( filtz3.num, filtz3.den )
plt.semilogx( wz3*10/(2 * np.pi), 20*np.log10(np.abs(hz3).clip(1e-15)) )

plt.grid()

tfBtw1 = signal.lti( 1, [1, 1] )
dtfBtw1 = signal.bilinear( tfBtw1.num, tfBtw1.den, 10 )
fltBtw1 = signal.lti( *dtfBtw1 )
wz1, hz1 = signal.freqz( fltBtw1.num, fltBtw1.den )

plt.semilogx( wz1*10/(2 * np.pi), 20*np.log10(np.abs(hz1).clip(1e-15)) )

