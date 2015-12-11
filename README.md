# An Example of Bayesian Network

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

	P(PT)          = 0.200

	P(BT)          = 0.001
 
	P(HO|!PT)      = 0.000 
	P(HO| PT)      = 0.700 

	P(HA|!BT, !HO) = 0.020
	P(HA|!BT,  HO) = 0.700
	P(HA| BT, !HO) = 0.900
	P(HA| BT,  HO) = 0.990

	P(SA|!HO)      = 0.100
	P(SA| HO)      = 0.800

	P(PX|!BT)      = 0.010
	P(PX| BT)      = 0.980