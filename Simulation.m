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