function Risk = GetRisk(obj)
% This function is used to calculate the risk of system.

    Risk = obj.BayesianNetwork.GetLoss() + obj.ProductionModel.GetLoss();
end

