function Exist = ExistProcess(obj, Process)
    
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Process, Enumerations.ClassType.Process))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Processes)
        if (Process == obj.Processes{i})
            Exist = true;
            return;
        end
    end

    Exist = false;
end

