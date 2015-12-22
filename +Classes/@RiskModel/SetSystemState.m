function SetSystemState(obj, SystemState)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(SystemState, Enumerations.ClassType.SystemState))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (~SystemState.IsLegal())
        error(Enumerations.ErrorType.SystemStateIsIllegal);
    end
    
    % Get the set of functions which will be shut down and the set of fucntions which will be turned on.
    ShutDownFunctions = SystemState.Functions(obj.SystemState.IsRunning - SystemState.IsRunning == 1);
    TurnOnFunctons = SystemState.Functions(obj.SystemState.IsRunning - SystemState.IsRunning == -1);
    obj.SystemState.IsRunning = SystemState.IsRunning;
    
    % In multi-level Bayesian network, set the this function node unreachable.
    obj.SetNodesReachable(TurnOnFunctons);
    obj.SetNodesUnreachable(ShutDownFunctions);
    obj.BayesianNetwork.InferenceEngine = jtree_inf_engine(obj.BayesianNetwork.Graph);
    % 
    for i = 1:numel(TurnOnFunctons)
        TurnOnFunctons{i}.Probability = 0;
    end
    
    for i = 1:numel(ShutDownFunctions)
        ShutDownFunctions{i}.Probability = 1;
    end
end