classdef SystemState
    properties
        Functions = {};
        IsRunning = [];
        LegalTable = [];
    end
    
    methods
        AddAllFunctions(obj, varargin);
        Exist = ExistFunction(obj, Function);
    end    
end

