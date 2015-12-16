classdef (Sealed) SortDirection
    properties (Constant)
        Descend  = 'descend';
        Ascend   = 'ascend';
    end
    
    methods (Access = private)
        function obj = SortDirection
        end
    end    
end

