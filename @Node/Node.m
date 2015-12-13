classdef Node < handle
    properties
        Name = '';
        Index = -1;
        Type = NodeType.Unknown;
        Probability = 0;
        Parents = {};
        ConditionalProbabilities = [];
    end  
    
    methods
        function obj = Node(Name, Type)
            if (nargin > 2 || nargin == 0)
                error(ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, 'char'))
                error(ErrorType.InputParameterTypeError);
            end
            
            obj.Name = Name;            
            if (nargin == 1) 
                obj.Type = NodeType.Unknown;
                return;
            end
            
            if (~isa(Type, 'char'))
                error(ErrorType.InputParameterTypeError);
            end
            
            obj.Type = Type;            
        end
        
        AddParents(obj, varargin);
        ExistParent(obj, Parent);
%         function disp(obj)
%             disp(['P(+', obj.Name, ') = ', num2str(obj.Probability)]);
%         end        
    end    
end

