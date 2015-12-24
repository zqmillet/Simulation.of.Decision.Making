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
        RecoverStrategies = cell(size(StrategyProfile));
        SecurityStrategies = cell(size(StrategyProfile));
        AttackStrategies = cell(size(StrategyProfile));
        MaxFunctionNumber = 0;
        
        for i = 1:numel(StrategyProfile)
            if (isa(StrategyProfile{i}, Enumerations.ClassType.Node))
                if (StrategyProfile{i}.Type == Enumerations.NodeType.Attack)
                    AttackStrategies{1, numel(AttackStrategies) + 1} = StrategyProfile{i};
                    continue;
                end
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.RecoverStrategy))
                RecoverStrategies{1, numel(RecoverStrategies) + 1} = StrategyProfile{i};
                continue;
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.SecurityStrategy))
                MaxFunctionNumber = MaxFunctionNumber + numel(StrategyProfile{i}.Functions);
                SecurityStrategies{1, numel(SecurityStrategies) + 1} = StrategyProfile{i};
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
        
        
        
        % Handle the security strategies.
        ShutDownFunctions = cell(1, MaxFunctionNumber);
        SecurityStrategies = Functions.UniqueCell(SecurityStrategies);
        for i = 1:numel(SecurityStrategies)
            ShutDownFunctions{1, end + 1:end + 1 + numel(SecurityStrategies{i}.Functions)} = SecurityStrategies{i}.Functions;
        end            
        ShutDownFunctions = Functions.UniqueCell(ShutDownFunctions);
    end
end

