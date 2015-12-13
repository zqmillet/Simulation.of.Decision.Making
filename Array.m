classdef Array
    %ARRAY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Data;
    end
    
    methods
        function obj = Add(Class)
            obj.Data = [obj.Data, Class];
        end
    end
    
end

