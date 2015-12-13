classdef Node   
    properties
        Name = '';
        Index = -1;
        Type = NodeType.Unknown;
        Probability = 0;
        % Parents;
        ConditionalProbabilities = [];
    end  
    
    methods
        function obj = Node(Name, Type)
            if (nargin > 2 || nargin == 0)
                error('The number of parameter(s) is error!');
            end
            
            if (~isa(Name, 'char'))
                error('The type of node name is not ''char''!');
            end
            
            obj.Name = Name;            
            if (nargin == 1) 
                obj.Type = NodeType.Unknown;
                return;
            end
            
            if (~isa(Type, 'NodeType'))
                error('The type of node type is not ''double''!');
            end
            
            obj.Type = Type;            
        end
        
        function disp(obj)
            disp(['P(+', obj.Name, ') = ', num2str(obj.Probability)]);
        end        
    end    
end

