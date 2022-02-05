#!/usr/bin/env python
# -*- coding: utf-8 -*-
# created at Dec 7, 2016 11:14

from __future__ import division
import numpy as np
import matplotlib.pyplot as plt

element = ['Y', 'Al', 'O']
Z = [39, 13, 8]
a1 = [4.129, 2.276, 0.455]
b1 = [27.548, 72.322, 23.78]
a2 = [3.012, 2.428, 0.917]
b2 = [5.088, 19.773, 7.622]
a3 = [1.179, 0.858, 0.472]
b3 = [0.591, 3.08, 2.144]
a4 = [0, 0.317, 0.138]
b4 = [0, 0.408, 0.296]
theta = np.linspace(0, np.pi, num=500)
s = np.sin(theta) / 1.5418

a = np.vstack((a1, a2, a3, a4))
b = np.vstack((b1, b2, b3, b4))


def f_o(s, j):
    return Z[j] + sum([- 42.78214 * s**2 * a[i][j] * np.exp(-b[i][j] * s**2) for i in range(len(a))])


def f(s, j):
    return f_o(s, j) * np.exp(-s**2)


# Calculate for certain theta
the_theta = np.array([27.9305, 69.5209]) / 180 * np.pi
the_s = np.sin(the_theta) / 1.5418
print [f(the_s, 0), f(the_s, 1), f(the_s, 2)]
# Plot
plt.plot(s, [f(ss, 0) for ss in s], label='Y atomic scattering factor')
plt.plot(s, [f(ss, 1) for ss in s], label='Al atomic scattering factor')
plt.plot(s, [f(ss, 2) for ss in s], label='O atomic scattering factor')
plt.xlim((0, 0.65))
plt.xlabel(r'$s=\sin(\theta)/\lambda$')
plt.ylabel(r'Atomic scattering factor $f(s)$')
plt.legend(loc="best")
plt.show()
