classdef Node < handle
    properties
        Name = '';
        Index = -1;
        Type = Enumerations.NodeType.Unknown;
        Probability = 0;
        Parents = {};
        ConditionalProbabilities = [];
    end  
    
    methods
        function obj = Node(Name, Type)
            if (nargin > 2 || nargin == 0)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, 'char'))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Name = Name;            
            if (nargin == 1) 
                obj.Type = Enumerations.NodeType.Unknown;
                return;
            end
            
            if (~isa(Type, 'char'))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Type = Type;            
        end        
        AddParents(obj, varargin);
        AddAllParents(obj, varargin);
        Exist = ExistParent(obj, Parent);     
    end    
end

