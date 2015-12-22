function Risk = GetRisk(obj)
% This function is used to calculate the risk of system.

    obj.ProductionModel.Inference();
    DegradationRisk = obj.ProductionModel.GetLoss();

    obj.BayesianNetwork.Inference();
    AttackRisk = obj.BayesianNetwork.GetLoss();    
    
    Risk = AttackRisk + DegradationRisk;
    disp(['Attack Risk = ' num2str(AttackRisk) ', Degradation Risk = ' num2str(DegradationRisk)]);
end

