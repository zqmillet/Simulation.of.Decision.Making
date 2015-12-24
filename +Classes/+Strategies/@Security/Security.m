classdef Security < handle
    properties
        Name = '';
        % The set of system functions which will be invalidated by this security strategy.
        Functions = {};
        % The key of this dictionary is the attack strategy.
        % The value of this dictionary is the prevent probabability.
        AttackStrategies;
    end
    
    methods
        function obj = Security(Name)
            switch (nargin)
                case 0
                    obj = Classes.Strategies.Security('');
                case 1
                    if (~isa(Name, Enumerations.ClassType.Char))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    obj.Name = Name;
                    obj.AttackStrategies = Classes.Dictionary();
                otherwise
                    error(Enumerations.ErrorType.InputParameterNumberError); 
            end
                        
            
        end
        
        AddFunctions(obj, varargin);
        AddAttackStrategies(obj, varargin);
        Exist = ExistFunction(obj, Function);
        Exist = ExistAttackStrategy(obj, AttackStrategy);
    end    
end

