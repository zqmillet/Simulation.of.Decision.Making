function Exist = ExistParent(obj, Parent)
    if (2 ~= nargin)
        error(ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Parent, 'Node'))
        error(ErrorType.InputParameterTypeError)
    end
    
    for i = 1:numel(obj.Parents)
        if (obj.Parents{i} == Parent)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

