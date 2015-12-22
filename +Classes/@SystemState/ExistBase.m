function Exist = ExistBase(obj, Base)

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError); 
    end
    
    if (~isa(Base, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (Base.Type ~= Enumerations.NodeType.Function)
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Bases)
        if (obj.Bases{i} == Base)
            Exist = true;
            return;
        end
    end

    Exist = false;

end

