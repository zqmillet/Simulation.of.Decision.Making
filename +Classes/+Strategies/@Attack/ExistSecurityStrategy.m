function Exist = ExistSecurityStrategy(obj, SecurityStrategy)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(SecurityStrategy, Enumerations.ClassType.SecurityStrategy))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.SecurityStrategies)
        if (SecurityStrategy == obj.SecurityStrategies{i})
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

