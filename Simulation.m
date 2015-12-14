clearvars;

a1 = Node('a1');
a2 = Node('a2');
a3 = Node('a3');

a1.AddAllParents(a2, a3, ...
    0.1, ...      F   F
    0.2, ...      F   T
    0.3, ...      T   F
    0.5);  %      T   T


a2.AddAllParents(a3, ...
    0.5, ...      F
    0.7);  %      T

a2.Type = NodeType.Attack;

a3.Type = NodeType.Function;

return;