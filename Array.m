classdef Array
    %ARRAY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Data;
    end
    
    methods
        function obj = Array()
            obj.Data = [];
        end
        
        function Add(obj, Number)
            obj.Data = [obj.Data, Number];
        end
    end
    
end

