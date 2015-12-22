function AddAllBases(obj, varargin)
    
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    BaseNumber = 0;
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            break;
        end
        
        if (varargin{i}.Type ~= Enumerations.NodeType.Function)
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistBase(varargin{i}))
            BaseNumber = BaseNumber + 1;
            obj.Bases{1, numel(obj.Bases) + 1} = varargin{i};
        end
    end
    
    LegalTableLength = numel(varargin) - BaseNumber;
    
    if (LegalTableLength ~= 2^BaseNumber)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.LegalTable = zeros(1, LegalTableLength);
    
    for i = 1:LegalTableLength
        if (~isa(varargin{BaseNumber + i}, Enumerations.ClassType.Double))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        obj.LegalTable(1, i) = varargin{BaseNumber + i};
    end

end

