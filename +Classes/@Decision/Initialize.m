function Initialize(obj)
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.RiskModel.Initialize();
    MaxSystemLoss = 0;
    for i = 1:numel(obj.RiskModel.BayesianNetwork.Nodes)
        if (~isa(obj.RiskModel.BayesianNetwork.Nodes, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (obj.RiskModel.BayesianNetwork.Nodes{i}.Type == Enumerations.NodeType.Asset)
            MaxSystemLoss = MaxSystemLoss + obj.RiskModel.BayesianNetwork.Nodes{i}.Value;
        end
    end
    
    obj.AcceptableRisk = obj.AcceptableRiskRatio * MaxSystemLoss;
end

