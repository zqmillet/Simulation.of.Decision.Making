function Delete(obj, Key)

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(obj.Keys)
        if (isequal(obj.Keys{i}, Key))
            obj.Keys(i) = [];
            obj.Values(i) = [];
            return;
        end
    end
end

