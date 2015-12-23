classdef Security < Classes.Strategies.Strategy
    properties
        % The set of system functions which will be invalidated by this security strategy.
        Functions = {};
        % The key of this dictionary is the attack strategy.
        % The value of this dictionary is the prevent probabability.
        AttackStrategies = Classes.Dictionary();
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
        Exist = ExistFunction(obj, Function);
        Exist = ExistAttackStrategy(obj, AttackStrategy);
    end    
end

