classdef Node < handle
    properties
        Name = '';
        Index = -1;
        Type = Enumerations.NodeType.Unknown;
        Probability = 0;
        EvidenceState = Enumerations.EvidenceState.Unhappened;
        Parents = {};
        ConditionalProbabilities = [];
    end  
    
    methods
        function obj = Node(Name, Type)
            if (nargin > 2 || nargin == 0)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, Enumerations.ClassType.Char))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Name = Name;            
            if (nargin == 1) 
                obj.Type = Enumerations.NodeType.Unknown;
                return;
            end
            
            if (~isa(Type, Enumerations.ClassType.Char))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Type = Type;            
        end        
        AddParents(obj, varargin);
        AddAllParents(obj, varargin);
        Exist = ExistParent(obj, Parent); 
        ExchangeIndex(obj, Node);
        Probabilities = GetConditionalProbabilities(obj);
    end    
end

