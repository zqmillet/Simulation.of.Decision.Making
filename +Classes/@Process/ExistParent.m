function Exist = ExistParent(obj, Parent)

	if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:1
        if (isa(Parent, Enumerations.ClassType.Node))
            if (Parent.Type == Enumerations.NodeType.Function)
                break;
            end            
        end
        
        if (isa(Parent, Enumerations.ClassType.Process))
            break;
        end
        
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Parents)
        if (Parent == obj.Parents{i})
            Exist = true;
            return;
        end
    end
    Exist = false;    
end

