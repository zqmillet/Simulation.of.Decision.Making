# An Example of Bayesian Network
This example is used to introduce how to use the `class Node` and `class BayesianNetwork` to model and inference the Bayesian network.

## Contents
1. [The Introduction of the Example](#Introduction)
2. [Question 1](#Question1)
3. [Question 2](#Question2)

<h2 id="Introduction">The Introduction of the Example</h2>
The Bayesian network is shown as follows.  

&#8194;&#8194;<img src="/README/BayesianNetwork.png" width = "150" alt="Bayesian Network" />

The meanings of nodes are shown as follows.

* PT, Qiqi goes to the **party**.
* HO, Qiqi has a **Hangover**.
* BT, Qiqi has a **Brain Tumor**.
* HA, Qiqi has a **Headache**.
* SA, Qiqi has a **alcohol smell**.
* PX, Qiqi has a **Pos Xray**.

The conditional probabilities are shown as follows.  

	P(+PT)          = 0.200

	P(+BT)          = 0.001
 
	P(+HO|-PT)      = 0.000 
	P(+HO|+PT)      = 0.700 

	P(+HA|-BT, -HO) = 0.020
	P(+HA|-BT, +HO) = 0.700
	P(+HA|+BT, -HO) = 0.900
	P(+HA|+BT, +HO) = 0.990

	P(+SA|-HO)      = 0.100
	P(+SA|+HO)      = 0.800

	P(+PX|-BT)      = 0.010
	P(+PX|+BT)      = 0.980

Where `+PT` means that Qiqi has gone to the party, and `-PT` means that Qiqi has not gone to the party. `+BT` means bla bla bla ...

<h2 id="Question1">Question 1</h2>
What's the probability that Qiqi has a **Headache**?  

Solution:

	P(HO) = P(+HO|-PT)P(-PT)
		  + P(+HO|+PT)P(+PT)
		  = 0.000*0.8 + 0.700*0.2
		  = 0.140

	P(HA) = P(+HA|-BT, -HO)P(-BT)P(-HO)
	      + P(+HA|-BT, +HO)P(-BT)P(+HO)
    	  + P(+HA|+BT, -HO)P(+BT)P(-HO)
		  + P(+HA|+BT, +HO)P(+BT)P(+HO)
		  = 0.020*0.999*0.86 + 0.700*0.999*0.14 + 0.900*0.001*0.86 + 0.990*0.001*0.14
		  = 0.116

<h2 id="Question2">Question 2</h2>
