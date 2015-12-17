classdef Node < handle
    properties
        Name = '';
        Index = -1;
        Type = Enumerations.NodeType.Unknown;
        Probability = 0;
        Parents = {};
        ConditionalProbabilities = [];
        Value = 0;
    end  
    
    methods
        function obj = Node(Name, Type, Value)
            switch (nargin)
                case 1
                    if (~isa(Name, Enumerations.ClassType.Char))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    obj.Name = Name;
                case 2
                    if (~isa(Type, Enumerations.ClassType.Double))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    obj = Classes.Node(Name);
                    obj.Type = Type;
                case 3
                    if (~isa(Value, Enumerations.ClassType.Double))
                        error(Enumerations.ErrorType.InputParameterTypeError);
                    end
                    
                    if (Type ~= Enumerations.NodeType.Asset)
                        error(Enumerations.ErrorType.OnlyAssetNodeHasValueProperty);
                    end
                    
                    obj = Classes.Node(Name, Type);
                    obj.Value = Value;
                otherwise
                    error(Enumerations.ErrorType.InputParameterNumberError);
            end
        end        
        AddParents(obj, varargin);
        AddAllParents(obj, varargin);
        Exist = ExistParent(obj, Parent); 
        ExchangeIndex(obj, Node);
        Probabilities = GetConditionalProbabilities(obj);
    end    
end

