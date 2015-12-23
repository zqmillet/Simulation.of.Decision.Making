function Exist = Exist(obj, Key)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(obj.Keys)
        if (isequal(obj.Keys{i}, Key))
            Exist = true;
            return;
        end
    end

    Exist = false;
end

