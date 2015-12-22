classdef SystemState < handle
    properties
        Bases = {};
        IsRunning = [];
        LegalTable = [];
    end
    
    methods
        function disp(obj)
            disp(obj.IsRunning);
        end
        AddAllBases(obj, varargin);
        Exist = ExistBase(obj, Base);
        GetCurrentState(obj);
        States = GetNearStates(obj, Distance);
        Legal = IsLegal(obj);
    end    
end