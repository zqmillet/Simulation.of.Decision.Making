function AddFunctions(obj, varargin)
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end

    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (varargin{i}.Type ~= Enumerations.NodeType.Function)
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistFunction(varargin{i}))
            obj.Functions{1, numel(obj.Functions) + 1} = varargin{i};
        end
    end
end

