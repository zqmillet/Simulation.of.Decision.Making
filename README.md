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

* `PT`, Qiqi goes to the **party**.
* `HO`, Qiqi has a **Hangover**.
* `BT`, Qiqi has a **Brain Tumor**.
* `HA`, Qiqi has a **Headache**.
* `SA`, Qiqi has a **alcohol smell**.
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
If Qiqi has gone to the **party**, what's the probability that Qiqi has a **alcohol smell**?

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

	#include "Main.h"
	
	int main()
	{    
	    // Create the nodes of Bayesian network.
	    Node PT("Party");
	    Node HO("Hangover");
	    Node BT("Brain Tumor");
	    Node HA("Headache");
	    Node SA("Smell Alcohol");
	    Node PX("Pos Xray");
	
	    // Set the relationships of nodes.
	    HO.AddParent(PT);
	    HA.AddParent(HO, BT);
	    SA.AddParent(HO);
	    PX.AddParent(BT);
	
	    // Set the conditional probabilities of nodes
	    PT.Probabilities = {
	        0.2
	    };
	
	    BT.Probabilities = {
	        0.001
	    };
	
	    HO.Probabilities = {
	    /*
	    PT  F       T
	    */
	        0,      0.7
	    };
	
	    SA.Probabilities = {
	    /*
	    HO  F       T
	    */
	        0.1,    0.8  
	    };
	
	    PX.Probabilities = {
	    /*
	    BT  F       T
	    */
	        0.01,   0.98
	    };
	
	    // Please notice that the order of BT and HO, 
	    // and compare with the order that they are added in the parent list.
	    HA.Probabilities = {
	    /*
	    BT  F       F       T       T
	    HO  F       T       F       T
	    */
	        0.02,   0.7,    0.9,    0.99
	    };
	
	    // Create the Bayesian network.
	    BayesianNetwork BayesianNetwork;
	
	    // Add the nodes into the Bayesian network.
	    // This order can be in any orler.
	    BayesianNetwork.AddNode(PT, HO, BT, HA, SA, PX);
	
	    // Initialize the Bayesian network.
	    if (!BayesianNetwork.Initialize())
	        return EXIT_FAILURE;
	    
	    // Question 1
	    cout << "Solution of Question 1:" << endl;
	    BayesianNetwork.Inference();
	    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);
	
	    // Question 2
	    cout << endl;
	    cout << "Solution of Question 2:" << endl;
	    BayesianNetwork.AddEvidence(PT);
	    BayesianNetwork.Inference();
	    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);
	
	    // Question 3
	    cout << endl;
	    cout << "Solution of Question 3:" << endl;
	    BayesianNetwork.RemoveEvidence();
	    BayesianNetwork.AddEvidence(PX);
	    BayesianNetwork.Inference();
	    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);
	
	    // Question 4
	    cout << endl;
	    cout << "Solution of Question 4:" << endl;
	    BayesianNetwork.RemoveEvidence();
	    BayesianNetwork.AddEvidence(HA);
	    BayesianNetwork.Inference();
	    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);
	
	    system("pause");
	    return EXIT_SUCCESS;
	}

<h2 id="Output">Output</h2>

	Solution of Question 1:
	P(+Brain Tumor  ) = 0.001
	P(+Hangover     ) = 0.14
	P(+Headache     ) = 0.115997
	P(+Party        ) = 0.2
	P(+Pos Xray     ) = 0.01097
	P(+Smell Alcohol) = 0.198
	
	Solution of Question 2:
	P(+Brain Tumor  |+Party) = 0.001
	P(+Hangover     |+Party) = 0.7
	P(+Headache     |+Party) = 0.496467
	P(+Party        |+Party) = 1
	P(+Pos Xray     |+Party) = 0.01097
	P(+Smell Alcohol|+Party) = 0.59
	
	Solution of Question 3:
	P(+Brain Tumor  |+Pos Xray) = 0.0893345
	P(+Hangover     |+Pos Xray) = 0.14
	P(+Headache     |+Pos Xray) = 0.186435
	P(+Party        |+Pos Xray) = 0.2
	P(+Pos Xray     |+Pos Xray) = 1
	P(+Smell Alcohol|+Pos Xray) = 0.198
	
	Solution of Question 4:
	P(+Brain Tumor  |+Headache) = 0.00786742
	P(+Hangover     |+Headache) = 0.845197
	P(+Headache     |+Headache) = 1
	P(+Party        |+Headache) = 0.855997
	P(+Pos Xray     |+Headache) = 0.0176314
	P(+Smell Alcohol|+Headache) = 0.691638