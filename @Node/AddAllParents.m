function AddAllParents(obj, varargin)
    if (nargin < 2)
        error(ErrorType.InputParameterNumberError);
    end
    
    obj.Parents = {};
    
    ParentNumber = 0;
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, 'Node'))
            break;
        end
        ParentNumber = ParentNumber + 1;
    end
    
    for i = (ParentNumber + 1):numel(varargin)
        if (~isa(varargin{i}, 'double'))
            error(ErrorType.InputParameterTypeError);
        end
    end
    
    ProbabilityNumber = numel(varargin) - ParentNumber;
    
    if (2^ParentNumber ~= ProbabilityNumber)
        error(ErrorType.InputParameterNumberError);
    end
    
    for i = 1:ParentNumber
        obj.AddParents(varargin{i});
    end
    
    obj.ConditionalProbabilities = zeros(1, ProbabilityNumber);
    for i = 1:ProbabilityNumber
        obj.ConditionalProbabilities(1, i) = varargin{i + ParentNumber};
    end
end