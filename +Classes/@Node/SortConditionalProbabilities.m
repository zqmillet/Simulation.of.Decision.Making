function SortConditionalProbabilities(obj)
% This function is used to sort the consditional probabilities by the index of nodes.

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    IndexList = zeros(1, numel(obj.Parents));
    for i = 0:numel(obj.Parents)
        IndexList(i) = obj.Parents{i}.Index;
    end
    
    IndexList = [IndexList, obj.Index];
    if (unique(IndexList) ~= IndexList)


end

