classdef (Sealed) NodeType   
    properties (Constant)
        Unknown  = 0;
        Attack   = 1;
        Resource = 2;
        Function = 3;
        Incident = 4;
        Asset    = 5;
    end

    methods (Access = private)
        function obj = NodeType
        end
    end    
end

