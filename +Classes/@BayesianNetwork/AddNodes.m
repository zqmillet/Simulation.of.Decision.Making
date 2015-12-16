function AddNodes(obj, varargin)
% This function is used to add nodes into the Bayesian network.

    % Check the class type of input parameters, if there exists a parameter that is not a Node, throw an error.
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
    end
    
    % Check the indexes of existing nodes, if there exist break point or duplicated point, throw an error.
    IndexList = zeros(1, numel(obj.Nodes));
    for i = 1:numel(obj.Nodes)
        IndexList(1, i) = obj.Nodes{i};
    end
    
    if (max(IndexList) ~= numel(obj.Nodes))
        error(Enumerations.ErrorType.BayesianNetworkNodeIndexError);
    end
    
    if (numel(unique(IndexList)) ~= numel(IndexList))
        error(Enumerations.ErrorType.BayesianNetworkNodeIndexError);
    end
    
    % If the function runs here, it means that the indexes of nodes are '1, 2, ... , numel(obj.Nodes)'.
    % Add the new nodes into the Bayesian network, and set the indexes for them.
    for i = 1:numel(varargin)
        if (~obj.ExistNode(varargin{i}))            
            obj.Nodes{1, numel(obj.Nodes) + 1} = varargin{i};
            varargin{i}.Index = numel(obj.Nodes);
        end
    end
end

