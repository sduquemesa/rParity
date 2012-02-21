#!/bin/bash python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rc

def main():
    s = np.loadtxt("s.data")
    met = np.loadtxt("met.data")
    sdata, sbins = np.histogram(s, bins=40,range=(0,2000))
    metdata, metbins = np.histogram(met, bins=40,range=(0,2000))
    plt.plot(sbins[1:],sdata,'r.')
    plt.title("$S_T$")
    plt.figure()
    plt.plot(metbins[1:],metdata,'k.')
    plt.title("$E_T$ Miss")
    plt.show()

if __name__ == "__main__":
    rc('text', usetex=True)
    main()
