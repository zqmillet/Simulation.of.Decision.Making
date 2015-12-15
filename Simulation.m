clearvars;

a1 = Classes.Node('a1');
a2 = Classes.Node('a2');
a3 = Classes.Node('a3');

a1.AddAllParents(a2, a3, ...
    0.1, ...      F   F
    0.2, ...      F   T
    0.3, ...      T   F
    0.5);  %      T   T


a2.AddAllParents(a3, ...
    0.5, ...      F
    0.7);  %      T

a2.Type = Enumerations.NodeType.Attack;

a3.Type = Enumerations.NodeType.Function;

BayesianNetwork = Classes.BayesianNetwork();
BayesianNetwork.AddNodes(a1, a2, a3, a2, a1);
BayesianNetwork.AddNodes(a1, a2, a3);

return;