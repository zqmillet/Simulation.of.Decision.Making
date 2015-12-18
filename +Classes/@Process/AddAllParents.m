function AddAllParents(obj, varargin)
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.Parents = {};
    

    for i = 1:numel(varargin)
        if (isa(varargin{i}, Enumerations.ClassType.Node) || isa(varargin{i}, Enumerations.ClassType.Process))
            obj.AddParents(varargin{i});
        else
            break;
        end
    end
    
    TruthTableLength = numel(varargin) - numel(obj.Parents);
    
    if (2^numel(obj.Parents) ~= TruthTableLength)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.TruthTable = zeros(1, TruthTableLength);
    for i = 1:TruthTableLength
        if (~isa(varargin{i + numel(obj.Parents)}, Enumerations.ClassType.Double))
            error(Enumerations.ErrorType.InputParameterNumberError);
        end
        
        if (varargin{i + numel(obj.Parents)} ~= 0 && varargin{i + numel(obj.Parents)} ~= 1)
            error(Enumerations.ErrorType.TheValueOfTheTruthTableIsNotZeroOrOne);
        end
        
        obj.TruthTable(1, i) = varargin{i + numel(obj.Parents)};
    end   
end

