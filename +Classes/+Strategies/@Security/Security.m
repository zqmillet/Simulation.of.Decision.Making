classdef Security < Classes.Strategies.Strategy
    properties
        % The set of system functions which will be invalidated by this security strategy.
        Functions = {};
        % The set of attack strategies which will be prevented by this security strategy.
        AttackStrategies = {};
        % Probabilities
        PreventProbabilities = [];
    end
    
    methods
        function obj = Security(Name)
            if (nargin ~= 1)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, Enumerations.ClassType.Char))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            obj.Name = Name;
        end
        
        AddFunctions(obj, varargin);
        AddAttackStrategies(obj, varargin);
    end    
end

