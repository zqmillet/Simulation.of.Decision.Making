classdef RiskModel
    properties
        BayesianNetwork;
        ProductionModel;
    end
    
    methods
        function obj = RiskModel()
            obj.BayesianNetwork = Classes.BayesianNetwork();
            obj.ProductionModel = Classes.ProductionModel();
        end
        AddElements(obj, varargin);
        Initialize(obj);
        Inference(obj);
        Risk = GetRisk(obj);
    end
    
end

