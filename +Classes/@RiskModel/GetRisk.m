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
        BayesianNetwork = Functions.Clone(obj.BayesianNetwork);
        
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
        
        % Handle the potential attack strategies, add all potential attack strategies into the evidences list.
        AttackStrategies = Functions.UniqueCell(AttackStrategies);
        BayesianNetwork.AddEvidences(AttackStrategies{:});

        % Handle the security strategies, change the conditional probabilities of the corresponding attack node.
        SecurityStrategies = Functions.UniqueCell(SecurityStrategies);
        for i = 1:numel(SecurityStrategies)
            for j = 1:numel(SecurityStrategies{i}.AttackStrategies.Keys)
                 ChildSet = BayesianNetwork.GetChildSet(SecurityStrategies{i}.AttackStrategies.Keys{j});
                for k = 1:numel(ChildSet)
                end
            end
        end
        
        % Handle the recover strategies, get the set of function which should be recovered by recover strategies.
        RecoverFunctions = {};
        RecoverStrategies = Functions.UniqueCell(RecoverStrategies);
        for i = 1:numel(RecoverStrategies)
            RecoverFunctions = Functions.GetUnion(RecoverFunctions, RecoverStrategies{i}.Functions);
        end
        
        % Handle the security strategies, get the set of functions which should be shut down by security strategies.
        ShutDownFunctions = {};
        
        for i = 1:numel(SecurityStrategies)
            ShutDownFunctions = Functions.GetUnion(ShutDownFunctions, SecurityStrategies{i}.Functions);
        end
        
        
        
    end
end

