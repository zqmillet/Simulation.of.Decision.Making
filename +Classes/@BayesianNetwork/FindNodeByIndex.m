function Node = FindNodeByIndex(obj, Index)
% This function is used to find the node by its index.

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Index, Enumerations.ClassType.Double))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (Index > numel(obj.Nodes))
        error(Enumerations.ErrorType.InputParameterValueError);
    end
    
    for i = 1:numel(obj.Nodes)
        if (obj.Nodes{i}.Index == Index)
            Node = obj.Nodes{i};
            return;
        end
    end
    
    error(Enumerations.ErrorType.BayesianNetworkNodeIndexError);
end

