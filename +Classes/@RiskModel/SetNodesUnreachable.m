function SetNodesUnreachable(obj, NodeList)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (numel(NodeList) == 0)
        return;
    end
    
    for i = 1:numel(NodeList)
        if (~isa(NodeList{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        NodeList{i}.Probability = 0;
        
        obj.BayesianNetwork.Graph.CPD{NodeList{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, NodeList{i}.Index, [ones(1, 2^(numel(NodeList{i}.Parents))), zeros(1, 2^(numel(NodeList{i}.Parents)))]);
    end
end

