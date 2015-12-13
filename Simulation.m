a1 = Node('a1');
a2 = Node('a2');
a3 = Node('a3');

a1.AddParents(a2, a3);

a2.Type = NodeType.Attack;

a3.Type = NodeType.Function;

return;