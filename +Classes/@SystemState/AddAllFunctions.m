function AddAllFunctions(obj, varargin)
    
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    FunctionNumber = 0;
    for i = numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            break;
        end
        
        if (varargin{i}.Type ~= Enumerations.NodeType.Function)
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistFunction(varargin{i}))
            FunctionNumber = FunctionNumber + 1;
            obj.Functions{1, numel(obj.Functions) + 1} = varargin{i};
        end
    end
    
    LegalTableLength = numel(varargin) - FunctionNumber;
    
    if (LegalTableLength ~= 2^FunctionNumber)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.LegalTable = zeros(1, LegalTableLength);
    
    for i = 1:LegalTableLength
        if (~isa(varargin{FunctionNumber + i}, Enumerations.ClassType.Double))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        obj.LegalTable(1, i) = varargin{FunctionNumber + i};
    end

end

