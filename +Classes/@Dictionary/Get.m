function Value = Get(obj, Key)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (numel(obj.Keys) ~= numel(obj.Values))
        error(Enumerations.ErrorType.NumbersOfKeysAndValuesAreNotEqual);
    end
    
    for i = 1:numel(obj.Keys)
        if(isequal(obj.Keys{i}, Key))
            Value = obj.Values{i};
            return;
        end
    end
    
    error(Enumerations.ErrorType.ThereDoesNotExistThisKey);
end

