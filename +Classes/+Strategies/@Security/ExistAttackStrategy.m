function Exist = ExistAttackStrategy(obj, AttackStrategy)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(AttackStrategy, Enumerations.ClassType.AttackStrategy))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    Exist = obj.AttackStrategies.Exsit(AttackStrategy);
end

