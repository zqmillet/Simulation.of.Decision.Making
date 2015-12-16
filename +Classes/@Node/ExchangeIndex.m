function ExchangeIndex(obj, Node)
% This function is used to exchange the index of obj and Node.
    
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Node, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    TempIndex  = obj.Index;
    obj.Index  = Node.Index;
    Node.Index = TempIndex;
end

