function OptimalSystemState = GetOptimalSystemState(obj, AttackStrategies)
    % Get maximum distance.
    MaxDistance = numel(obj.RiskModel.SystemState.Bases) - 1;
    
    % Initialize the optimal system state and minimum system risk.
    OptimalSystemState = obj.RiskModel.GetNearStates(0);
    MinimumRisk = obj.RiskModel.GetRisk();
    % Set the evidence list according to the attack strategies.
    obj.RiskModel.BayesianNetwork.AddEvidences(AttackStrategies{:});
    
    % Search the system state space, from inside to outside.
    for i = 1:MaxDistance
        % Find all system states with the distance i.
        SystemStates = obj.RiskModel.GetNearStates(i);
        
        % For each system state in above system states, ...
        for j = 1:numel(SystemStates)
            % Calculate the system risk that system in the jth state.
            obj.RiskModel.SetSystemState(SystemStates{j});
            SystemRisk = obj.RiskModel.GetRisk();
            % If the risk in the jth system state is lower, ...
            if (SystemRisk < MinimumRisk)
                % Let the jth system state be the optimal system state, ...
                OptimalSystemState = SystemStates{j};
                % and update the value of minimum system risk. 
                MinimumRisk = SystemRisk;
            end
        end
        
        % If the lowest system risk is under the acceptable risk, ...
        if (MinimumRisk < obj.RiskModel.AcceptableRisk)
            % end the searching process, and return the optimal system state.
            return;
        end
    end
end

