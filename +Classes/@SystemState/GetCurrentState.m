function GetCurrentState(obj)

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.IsRunning = zeros(size(obj.Bases));
    for i = 1:numel(obj.Bases)
        if (obj.Bases{i}.Probability ~= 1)
            obj.IsRunning(i) = 1;
        end
    end
end

