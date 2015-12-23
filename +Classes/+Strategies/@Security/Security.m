classdef Security < Classes.Strategies.Strategy
    properties
        % The set of system functions which will be invalidated by this security strategy.
        Functions = {};
        % The set of attack strategies which will be prevented by this security strategy.
        AttackStrategies = {};
        % This size of this double vector is same as the size of 'AttackStrategies', 
        % the ith element of this double vector is the possibility this security strategy can prevent the ith attack strategy successfully.
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
        Exist = ExistFunction(obj, Function);
        Exist = ExistAttackStrategy(obj, AttackStrategy);
    end    
end

