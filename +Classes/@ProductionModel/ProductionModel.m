classdef ProductionModel
    properties
        Processes = {};
        Products = {};
    end
    
    methods
        Exist = ExistProcess(obj, Process);
        Exist = ExistProduct(obj, Product);
        AddElements(obj, varargin);
        Initialize(obj);
    end    
end

