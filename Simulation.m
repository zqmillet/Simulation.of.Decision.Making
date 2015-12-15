clearvars;

a01 = Classes.Node('a01');
a02 = Classes.Node('a02');
a03 = Classes.Node('a03');
a04 = Classes.Node('a03');

a01.AddAllParents(a02, a03, a04, ...
    0.1, ...       F    F    F
    0.2, ...       F    F    T
    0.3, ...       F    T    F
    0.4, ...       F    T    T
    0.5, ...       T    F    F
    0.6, ...       T    F    T
    0.7, ...       T    T    F
    0.8);  %       T    T    T

a02.AddAllParents(a03, ...
    0.5, ...       F
    0.7);  %       T

BayesianNetwork = Classes.BayesianNetwork();

BayesianNetwork.AddNodes(a02, a01, a03, a04);

BayesianNetwork.AddEvidences(a02, Enumerations.EvidenceState.Unhappened, ...
                             a03, ...
                             a02);

BayesianNetwork.Initialize();

a01.Index = 5;
a02.Index = 2;
a03.Index = 7;
a04.Index = 1;

disp(a01.GetConditionalProbabilities());

return;