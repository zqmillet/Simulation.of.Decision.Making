classdef Attack < Classes.Strategies.Strategy
    properties
        % The set of system functions which will be failed by this attack strategy.
        Functions = {};
        % The set of security strategies which can prevent this attack strategy.
        SecurityStrategies = {};
    end
    
    methods
        function obj = Attack(Name)
            if (nargin ~= 1)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, Enumerations.ClassType.Char))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Name = Name;
        end
        
        AddFunctions(obj, varargin);
        AddSecurityStrategies(obj, varargin);
    end    
end

