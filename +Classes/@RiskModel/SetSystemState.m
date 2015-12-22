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
    
    % In multi-level Bayesian network, set the this function node unreachable or recover it reachable.
    for i = 1:numel(TurnOnFunctons)             
        obj.BayesianNetwork.Graph.CPD{TurnOnFunctons{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, TurnOnFunctons{i}.Index, [1 - TurnOnFunctons{i}.ConditionalProbabilities, TurnOnFunctons{i}.ConditionalProbabilities]);
    end
    
    for i = 1:numel(ShutDownFunctions)     
        obj.BayesianNetwork.Graph.CPD{ShutDownFunctions{i}.Index} = tabular_CPD(obj.BayesianNetwork.Graph, ShutDownFunctions{i}.Index, [ones(1, 2^(numel(ShutDownFunctions{i}.Parents))), zeros(1, 2^(numel(ShutDownFunctions{i}.Parents)))]);
    end
    obj.BayesianNetwork.InferenceEngine = jtree_inf_engine(obj.BayesianNetwork.Graph);
end