function Exist = ExistFunction(obj, Function)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Function, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (Function.Type ~= Enumerations.NodeType.Function)
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Functions)
        if (obj.Functions{i} == Function)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

