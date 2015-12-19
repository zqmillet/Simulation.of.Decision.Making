function AddProcesses(obj, varargin)
    
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (isa(varargin{i}, Enumerations.ClassType.Process))
            if (~obj.ExistProcess(varargin{i}))
                obj.Processes{1, numel(obj.Processes) + 1} = varargin{i};
                varargin{i}.Index = numel(obj.Processes);
            end
            continue;
        end
        
        error(Enumerations.ErrorType.InputParameterTypeError);
    end

end

