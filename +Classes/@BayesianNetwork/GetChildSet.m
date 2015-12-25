function ChildSet = GetChildSet(obj, Node)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Node, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    
    ChildSet = {};
    
    for i = 1:numel(obj.Nodes)
        for j = 1:numel(obj.Nodes{i}.Parents)
            if (isequal(obj.Nodes{i}.Parents{j}, Node))
                ChildSet = Functions.GetUnion(ChildSet, obj.Nodes(i));
            end
        end
    end
end

