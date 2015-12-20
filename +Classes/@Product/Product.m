classdef Product < handle
    
    properties
        Name = '';
        Value = 0;
        Index = 0;
        Exist = false;
    end
    
    methods
        function obj = Product(Name, Value)
            switch (nargin)
                case 1
                   if (~isa(Name, Enumerations.ClassType.Char))
                       error(Enumerations.ErrorType.InputParameterTypeError);
                   end
                   
                   obj.Name = Name;
                case 2
                    if (~isa(Value, Enumerations.ClassType.Double))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    
                    obj = Classes.Product(Name);
                    obj.Value = Value;
                otherwise
                    error(Enumerations.ErrorType.InputParameterNumberError);
            end
        end
    end
    
end

