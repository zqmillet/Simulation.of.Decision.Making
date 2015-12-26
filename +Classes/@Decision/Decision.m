classdef Decision    
    properties
        RiskModel;
        SecurityStrategies;
        RecoverStrategies;
        AcceptableRisk;
        
    end
    
    methods
        function obj = Decision()
            obj.RiskModel = Classes.RiskModel();
            obj.SecurityStrategies = {};
            obj.RecoverStrategies = {};
        end
        AddRiskModel(obj, RiskModel);
        AddStrategies(obj, varargin);
        Initialize(obj);
        OptimalStrategy = GetOptimalStrategy(obj, AttackStrategies, CurrentSystemState);
    end
end

