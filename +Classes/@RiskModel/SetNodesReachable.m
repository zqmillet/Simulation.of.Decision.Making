function SetNodesReachable(obj, NodeList)
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
        
        obj.BayesianNetwork.Graph.CPD{NodeList{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, NodeList{i}.Index, [1 - NodeList{i}.ConditionalProbabilities, NodeList{i}.ConditionalProbabilities]);
    end  
end

