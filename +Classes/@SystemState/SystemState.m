classdef SystemState < handle
    properties
        Functions = {};
        IsRunning = [];
        LegalTable = [];
    end
    
    methods
        AddAllFunctions(obj, varargin);
        Exist = ExistFunction(obj, Function);
        GetCurrentState(obj);
        States = GetNearStates(obj, Distance);
    end    
end