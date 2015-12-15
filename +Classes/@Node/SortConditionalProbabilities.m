function SortConditionalProbabilities(obj)
% This function is used to sort the consditional probabilities by the index of nodes.

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    % If there are two nodes have same index, throw an error.
    IndexList = zeros(1, numel(obj.Parents));
    for i = 1:numel(obj.Parents)
        IndexList(i) = obj.Parents{i}.Index;
    end
    
    IndexList = [IndexList, obj.Index];
    if (numel(unique(IndexList)) ~= numel(IndexList))
        error(Enumerations.ErrorType.BayesianNetworkNodeIndexError);
    end
    
    % Order the parents by index.
    IndexList = IndexList(1, 1:(numel(IndexList) - 1));
    
    obj.Parents = obj.Parents{reshape(IndexList, size(obj.Parents))};
    
    % 
    for i = 0:bitshift(1, numel(obj.Parents))
        
    end

end

