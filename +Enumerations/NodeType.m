classdef (Sealed) NodeType   
    properties (Constant)
        Unknown  = 'Unknown';
        Attack   = 'Attack';
        Resource = 'Resource';
        Function = 'Function';
        Incident = 'Incident';
        Asset    = 'Asset';
    end

    methods (Access = private)
        function obj = NodeType
        end
    end    
end

