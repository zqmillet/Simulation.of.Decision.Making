function States = GetNearStates(obj, Distance)
% This function is used to obtained the system states with the specified distance.
% The definition of the distance of two states is shown as follows.
% 	Distance = sum(abs(State1.IsRunning - State2.IsRunning))
% 
% The output is an m*n matrix, where m is the number of states, n is the number of the functions of system state.
% It is noted that the system states in the output matrix are all legal.

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Distance, Enumerations.ClassType.Double))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (Distance < 0 || Distance > numel(obj.Bases))
        error(Enumerations.ErrorType.InputParameterValueError);
    end
    
    Indexes = 1:numel(obj.Bases);
    InversionIndexes = nchoosek(Indexes, Distance);
    
    obj.GetCurrentState();
    
    StateNumber = 0;
    States = cell(1, numel(InversionIndexes));
    for i = 1:size(InversionIndexes, 1)
        Running = zeros(size(obj.IsRunning));
        Running(InversionIndexes(i, :)) = 1;
        Running = abs(obj.IsRunning - Running);
        if (obj.LegalTable(1, Functions.BinaryArray2Number(Running) + 1) == 1)
            StateNumber = StateNumber + 1;
            States{1, StateNumber} = Classes.SystemState();
            States{1, StateNumber}.IsRunning = Running;
            States{1, StateNumber}.Bases = obj.Bases;
            States{1, StateNumber}.LegalTable = obj.LegalTable;
        end
    end
    
    States = States(:, 1:StateNumber);    
end

