function AddStrategies(obj, varargin)
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (isa(varargin{i}, Enumerations.ClassType.SecurityStrategy))
            obj.SecurityStrategies = Functions.GetUnion(obj.SecurityStrategies, varargin(i));
            continue;
        end
        
        if (isa(varargin{i}, Enumerations.ClassType.RecoverStrategy))
            obj.RecoverStrategies = Functions.GetUnion(obj.RecoverStrategies, varargin(i));
            continue;
        end
        
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
end

