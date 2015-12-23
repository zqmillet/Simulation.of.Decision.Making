function Set(obj, Key, Value)
    if (nargin ~= 3)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (numel(obj.Keys) ~= numel(obj.Values))
        error(Enumerations.ErrorType.NumbersOfKeysAndValuesAreNotEqual);
    end
    
    for i = 1:numel(obj.Keys)
        if (isequal(obj.Keys{i}, Key))
            obj.Values{i} = Value;
            return;
        end
    end
    
    obj.Keys{1, numel(obj.Keys) + 1} = Key;
    obj.Values{1, numel(obj.Values) + 1} = Value;
end

