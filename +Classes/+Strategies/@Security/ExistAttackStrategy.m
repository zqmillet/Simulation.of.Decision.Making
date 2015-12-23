function Exist = ExistAttackStrategy(obj, AttackStrategy)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(AttackStrategy, Enumerations.ClassType.AttackStrategy))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.AttackStrategies)
        if (obj.AttackStrategies{i} == AttackStrategy)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

