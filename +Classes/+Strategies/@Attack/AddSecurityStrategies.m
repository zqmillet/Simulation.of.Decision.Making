function AddSecurityStrategies(obj, varargin)
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.SecurityStrategy))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistSecurityStrategy(varargin{i}))
            obj.SecurityStrategies{1, numel(obj.SecurityStrategies) + 1} = varargin{i};
            varargin{i}.AddAttackStrategies(obj);
        end
    end
end

