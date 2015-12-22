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
    
    obj.SystemState = SystemState;
    
    % Get the set of functions which will be shut down.
    ShutDownFunctions = SystemState.Functions(SystemState.IsRunning == 0);
    
    % In multi-level Bayesian network, set the this function node unreachable.
    obj.SetNodesUnreachable(ShutDownFunctions);
end