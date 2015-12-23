function Exist = ExistAttackStrategy(obj, AttackStrategy)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(AttackStrategy, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (AttackStrategy.Type ~= Enumerations.NodeType.Attack)
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    Exist = obj.AttackStrategies.Exsit(AttackStrategy);
end

