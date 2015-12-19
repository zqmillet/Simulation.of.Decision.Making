classdef ProductionModel < handle
    properties
        Processes = {};
        Products = {};
        IncidenceMatrix = [];
    end
    
    methods
        Exist = ExistProcess(obj, Process);
        Exist = ExistProduct(obj, Product);
        AddProcesses(obj, varargin);
        Initialize(obj);
        Inference(obj);
    end    
end

