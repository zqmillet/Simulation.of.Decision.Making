function SetNodesUnreachable(obj, NodeList)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(NodeList)
        if (~isa(NodeList{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        NodeList{i}.Probability = 0;
        
        obj.BayesianNetwork.Graph.CPD{NodeList{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, NodeList{i}.Index, zeros(1, 2^(numel(varargin{i}.Parents) + 1)));
    end
    
    obj.BayesianNetwork.InferenceEngine = jtree_inf_engine(obj.BayesianNetwork.Graph);
end

