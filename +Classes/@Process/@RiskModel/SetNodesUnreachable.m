function SetNodesUnreachable(obj, NodeList)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (numel(NodeList) == 0)
        return;
    end
    
    for i = 1:numel(obj.BayesianNetwork.Nodes)
        obj.BayesianNetwork.Graph.CPD{obj.BayesianNetwork.Nodes{i}.Index} = ...
            tabular_CPD(obj.BayesianNetwork.Graph, ...
            obj.BayesianNetwork.Nodes{i}.Index, ...
            [1 - obj.BayesianNetwork.Nodes{i}.ConditionalProbabilities, obj.BayesianNetwork.Nodes{i}.ConditionalProbabilities]);
    end
    
%     for i = 1:numel(obj.Nodes)
%         obj.Graph.CPD{obj.Nodes{i}.Index} = ...
%             tabular_CPD(obj.Graph, ...
%             obj.Nodes{i}.Index, ...
%             [1 - obj.Nodes{i}.GetConditionalProbabilities(), obj.Nodes{i}.GetConditionalProbabilities()]);
%     end
    
    for i = 1:numel(NodeList)
        if (~isa(NodeList{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        NodeList{i}.Probability = 0;
        
        obj.BayesianNetwork.Graph.CPD{NodeList{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, NodeList{i}.Index, [ones(1, 2^(numel(NodeList{i}.Parents))), zeros(1, 2^(numel(NodeList{i}.Parents)))]);
    end    
    
    obj.BayesianNetwork.InferenceEngine = jtree_inf_engine(obj.BayesianNetwork.Graph);
end

