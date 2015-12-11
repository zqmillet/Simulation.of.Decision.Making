# An Example of Bayesian Network

The Bayesian network is shown as follows.  

* <img src="/README/BayesianNetwork.png" width = "150" alt="Bayesian Network" />

The meanings of nodes are shown as follows.

* PT, Qiqi goes to the **party**.
* HO, Qiqi has a **Hangover**.
* BT, Qiqi has a **Brain Tumor**.
* HA, Qiqi has a **Headache**.
* SA, Qiqi has a **alcohol smell**.
* PX, Qiqi has a **Pos Xray**.

The conditional probabilities are shown as follows.  

	P(PT) =   

	P(BT) =  
 
	P(HO| PT) =   
	P(HO|!PT) =  

	P(HA| HO,  BT) = 
	P(HA| HO, !BT) =
	P(HA|!HO,  BT) =
	P(HA|!HO, !BT) =

	P(SA| HO) =
	P(SA|!HO) =

	P(PX| BT) =
	P(PX|!BT) =