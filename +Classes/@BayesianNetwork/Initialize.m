function Initialize(obj)
% This function is used to initialize the Bayesian network.   

    NodeNumber = numel(obj.Nodes);

    % Set the indexes of all node which in the Bayesian network.
    for i = 1:NodeNumber
        obj.Nodes{i}.Index = i;
    end
    
    while(true)
        % Initialize the incidence matrix of the Bayesian network.
        obj.IncidenceMatrix = zeros(NodeNumber, NodeNumber);
        for NodeIndex = 1:NodeNumber
            for ParentIndex = 1:numel(obj.Nodes{NodeIndex}.Parents)
                obj.IncidenceMatrix(obj.Nodes{NodeIndex}.Parents{ParentIndex}.Index, obj.Nodes{NodeIndex}.Index) = 1;
            end
        end
        
        LowerTriangularElements = Functions.FindLowerTriangularElements(obj.IncidenceMatrix);
        if (isempty(LowerTriangularElements))
            break;
        end
        
        NodeIndex = LowerTriangularElements(1, 2);
        ParentIndex = LowerTriangularElements(1, 1);
        
        obj.FindNodeByIndex(NodeIndex).ExchangeIndex(obj.FindNodeByIndex(ParentIndex));
    end
    
    % Create the directed acyclic graph of Bayesian network.
    NameList = cell(1, numel(obj.Nodes));
    NodeIndexList = zeros(1, numel(obj.Nodes));    
    for i = 1:numel(obj.Nodes)
        NameList{i} = obj.Nodes{i}.Name;
        NodeIndexList(i) = obj.Nodes{i}.Index;
    end    
    obj.Graph = mk_bnet(obj.IncidenceMatrix, 2*ones(1, numel(obj.Nodes)), 'names', NameList, 'discrete', NodeIndexList);
    
    % Assignment of conditional probabilities.
    for i = 1:numel(obj.Nodes)
        obj.Graph.CPD{obj.Nodes{i}.Index} = tabular_CPD(obj.Graph, obj.Nodes{i}.Index, [1 - obj.Nodes{i}.GetConditionalProbabilities(), obj.Nodes{i}.GetConditionalProbabilities()]);
    end
    
    obj.InferenceEngine = jtree_inf_engine(obj.Graph);
end

