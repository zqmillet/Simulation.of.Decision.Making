function Risk = GetRisk(obj, StrategyProfile)
% This function is used to calculate the risk of system.
    if (nargin == 1)
        obj.ProductionModel.Inference();
        DegradationRisk = obj.ProductionModel.GetLoss();

        obj.BayesianNetwork.Inference();
        AttackRisk = obj.BayesianNetwork.GetLoss();    

        Risk = AttackRisk + DegradationRisk;
        disp(['Attack Risk = ' num2str(AttackRisk) ', Degradation Risk = ' num2str(DegradationRisk)]);
    elseif (nargin == 2)
        RecoverStrategies = {};
        SecurityStrategies = {};
        AttackStrategies = {};
        
        for i = 1:numel(StrategyProfile)
            if (isa(StrategyProfile{i}, Enumerations.ClassType.Node))
                if (StrategyProfile{i}.Type == Enumerations.NodeType.Attack)
                    AttackStrategies = Functions.GetUnion(AttackStrategies, StrategyProfile(i));
                    continue;
                end
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.RecoverStrategy))
                RecoverStrategies = Functions.GetUnion(RecoverStrategies, StrategyProfile(i));
                continue;
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.SecurityStrategy))
                SecurityStrategies = Functions.GetUnion(SecurityStrategies, StrategyProfile(i));
                continue;
            end
            
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        
        
        % Handle the attack strategies.
        AttackStrategies = Functions.UniqueCell(AttackStrategies);
        for i = 1:numel(AttackStrategies)
        end
        
        % Handle the recover strategies.
        RecoverStrategies = Functions.UniqueCell(RecoverStrategies);
        for i = 1:numel(RecoverStrategies)
        end
        
        % Handle the security strategies, get the set of functions which should be shut down by security strategies.
        ShutDownFunctions = {};
        SecurityStrategies = Functions.UniqueCell(SecurityStrategies);
        for i = 1:numel(SecurityStrategies)
            ShutDownFunctions = Functions.GetUnion(ShutDownFunctions, SecurityStrategies{i}.Functions);
        end            
        ShutDownFunctions = Functions.UniqueCell(ShutDownFunctions);
        
        
    end
end

