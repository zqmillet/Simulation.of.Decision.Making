classdef Recover < Classes.Strategies.Strategy
    properties
        % The set of system functions which can be recovered by this recover strategy.
        Functions = {};
        % The cost of the enforcement of this recover strategy.
        Cost = 0;
    end
    
    methods
        function obj = Recover(Name, Cost)
            switch (nargin)
                case 1
                    if (~isa(Name, Enumerations.ClassType.Char))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    obj.Name = Name;
                case 2
                    if (~isa(~isa(Name, Enumerations.ClassType.Double)))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    obj = Classes.Strategies.Recover(Name);
                    obj.Cost = Cost;
                otherwise
                     error(Enumerations.ErrorType.InputParameterNumberError);   
            end
        end
        
        AddFunctions(obj, varargin);
    end    
end

