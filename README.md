# An Example of Bayesian Network
This example is used to introduce how to use the `class Node` and `class BayesianNetwork` to model and inference the Bayesian network.

## Contents
* [The Introduction of the Example](#Introduction)
* [Questions](#Questions)
  * [Question 1](#Question1)
  * [Question 2](#Question2)
  * [Question 3](#Question3)
  * [Question 4](#Question4)
* [Code](#Code)
* [Output](#Output)

<h2 id="Introduction">The Introduction of the Example</h2>
The Bayesian network is shown as follows.  

&#8194;&#8194;<img src="/README/BayesianNetwork.png" width = "150" alt="Bayesian Network" />

The meanings of nodes are shown as follows.

* `PT`, Qiqi goes to the **Party**.
* `HO`, Qiqi has a **Hangover**.
* `BT`, Qiqi has a **Brain Tumor**.
* `HA`, Qiqi has a **Headache**.
* `SA`, Qiqi has an **Alcohol Smell**.
* `PX`, Qiqi has a **Pos Xray**.

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

<h2 id="Questions">Questions</h2>
<h3 id="Question1">Question 1</h3>
What's the probability that Qiqi has a **Headache**?  

Solution:

	P(+HO) = P(+HO|-PT)P(-PT)
		   + P(+HO|+PT)P(+PT)
		   = 0.000*0.8 + 0.700*0.2
		   = 0.140

	P(+HA) = P(+HA|-BT, -HO)P(-BT)P(-HO)
	       + P(+HA|-BT, +HO)P(-BT)P(+HO)
    	   + P(+HA|+BT, -HO)P(+BT)P(-HO)
		   + P(+HA|+BT, +HO)P(+BT)P(+HO)
		   = 0.020*0.999*0.860 + 0.700*0.999*0.140 + 0.900*0.001*0.860 + 0.990*0.001*0.140
		   = 0.116

<h3 id="Question2">Question 2</h3>
If Qiqi has gone to the **Party**, what's the probability that Qiqi has a **Alcohol Smell**?

Solution:

	P(+PT) = 1.000

	P(+HO) = P(+HO|-PT)P(-PT)
		   + P(+HO|+PT)P(+PT)
		   = 0.000*0.000 + 0.700*1.000
		   = 0.700

	P(+SA) = P(+SA|-HO)P(-HO)
		   + P(+SA|+HO)P(+HO)
		   = 0.100*0.300 + 0.800*0.700
		   = 0.590

<h3 id="Question3">Question 3</h3>
If Qiqi has a **Pos Xray**, what's the probability that Qiqi has a **Brain Tumor**?

Solution:

	P(+PX)     = P(+PX|-BT)P(-BT)
			   + P(+PX|+BT)P(+BT)
			   = 0.010*0.999 + 0.980*0.001
			   = 0.011

	P(+BT|+PX) = P(+PX|+BT)P(BT)/P(+PX)
			   = 0.980*0.001/0.011
			   = 8.91e-2

<h3 id="Question4">Question 4</h3>
If Qiqi has a **Headache**, what's the probability that Qiqi has a **Brain Tumor**?

Solution:

	P(+HA)	   = P(+HA|-BT, -HO)P(-BT)P(-HO)
			   + P(+HA|-BT, +HO)P(-BT)P(+HO)
			   + P(+HA|+BT, -HO)P(+BT)P(-HO)
			   + P(+HA|+BT, +HO)P(+BT)P(+HO)
			   = 0.020*0.999*0.860 + 0.700*0.999*0.140 + 0.900*0.001*0.860 + 0.990*0.001*0.140
			   = 0.116

	P(+HA|+BT) = P(+HA|+BT, -HO)P(-HO)
			   + P(+HA|+BT, +HO)P(+HO)
			   = 0.900*0.860 + 0.990*0.140
			   = 9.126e-1

	P(+BT|+HA) = P(+HA|+BT)P(+BT)/P(+HA)
			   = 9.126e-1*0.001/0.116
			   = 7.9e-3

<h2 id="Code">Code</h2>

	clearvars;

    % Create the nodes of Bayesian network.
    PT = Classes.Node('Party');
    HO = Classes.Node('Hangover');
    BT = Classes.Node('Brain Tumor');
    HA = Classes.Node('Headache');
    SA = Classes.Node('Smell Alcohol');
    PX = Classes.Node('Pos Xray');

    % Set the conditional probabilities of nodes
    PT.AddAllParents(... Has no parent node
        0.200);

    BT.AddAllParents(... Has no parent node
        0.001);

    HO.AddAllParents(PT, ...
        0.000, ...    F
        0.700);  %    T

    SA.AddAllParents(HO, ...
        0.100, ...    F
        0.800);  %    T

    PX.AddAllParents(BT, ...
        0.010, ...    F
        0.980);  %    T

    HA.AddAllParents(HO, BT, ...
        0.020, ...    F   F
        0.900, ...    F   T
        0.700, ...    T   F
        0.990);  %    T   T

    % Create the Bayesian network.
    BayesianNetwork = Classes.BayesianNetwork();

    % Add the nodes into the Bayesian network.
    % This order can be in any order.
    BayesianNetwork.AddNodes(PT, BT, HO, SA, PX, HA);

    % Initialize the Bayesian network.
    BayesianNetwork.Initialize();

    % Question 1
    fprintf('Solution of Question 1:\n');
    BayesianNetwork.Inference();
    BayesianNetwork.Display(HA);

    % Question 2
    fprintf('\nSolution of Question 2:\n');
    BayesianNetwork.AddEvidences(PT);
    BayesianNetwork.Inference();
    BayesianNetwork.Display(SA);

    % Question 3
    fprintf('\nSolution of Question 3:\n');
    BayesianNetwork.RemoveEvidences();
    BayesianNetwork.AddEvidences(PX);
    BayesianNetwork.Inference();
    BayesianNetwork.Display(BT);

    % Question 4
    fprintf('\nSolution of Question 4:\n');
    BayesianNetwork.RemoveEvidences();
    BayesianNetwork.AddEvidences(HA);
    BayesianNetwork.Inference();
    BayesianNetwork.Display(BT);

<h2 id="Output">Output</h2>

	>> Simulation
    Solution of Question 1:
    P(+Headache) = 0.116

    Solution of Question 2:
    P(+Smell Alcohol|+Party) = 0.59

    Solution of Question 3:
    P(+Brain Tumor|+Pos Xray) = 0.089335

    Solution of Question 4:
    P(+Brain Tumor|+Headache) = 0.0078674