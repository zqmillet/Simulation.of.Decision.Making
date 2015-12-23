function AddAttackStrategies(obj, varargin)
    if (mod(nargin, 2) == 0)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:2:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (varargin{i}.Type ~= Enumerations.NodeType.Attack)
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
            
        if (~isa(varargin{i + 1}, Enumerations.ClassType.Double))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (varargin{i + 1} < 0 || varargin{i + 1} > 1)
            error(Enumerations.ErrorType.InputParameterValueError);
        end
        
        obj.AttackStrategies.Set(varargin{i}, varargin{i + 1});
    end
end

