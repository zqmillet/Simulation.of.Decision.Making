classdef RiskModel
    properties
        BayesianNetwork;
        ProductionModel;
        SystemState;
    end
    
    methods
        function obj = RiskModel()
            obj.BayesianNetwork = Classes.BayesianNetwork();
            obj.ProductionModel = Classes.ProductionModel();
            obj.SystemState = Classes.SystemState();
        end
        AddElements(obj, varargin);
        Initialize(obj);
        Inference(obj);
        Risk = GetRisk(obj, StrategyProfile);
        SetSystemState(obj, SystemState);
        AddEvidences(obj, varargin);
        RemoveEvidences(obj, varargin);
        AddAllBases(obj, varargin);
        States = GetNearStates(obj, Distance);
    end    
end

