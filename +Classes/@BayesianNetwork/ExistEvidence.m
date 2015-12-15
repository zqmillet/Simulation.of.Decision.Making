function Exist = ExistEvidence(obj, Node)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Node, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Evidences)
        if (obj.Evidences{i} == Node)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

