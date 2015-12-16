function Exist = ExistNode(obj, Node)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Node, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Nodes)
        if (obj.Nodes{i} == Node)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

