function SetSecurityStrategies(obj, varargin)
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.SecurityStrategy))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        for j = 1:numel(varargin{i}.AttackStrategies.Keys)
            ChildSet = obj.GetChildSet(varargin{i}.AttackStrategies.Keys{j});
            for k = 1:numel(ChildSet)
                
            end
        end
    end
end

