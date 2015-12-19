function AddOutputs(obj, varargin)

    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Product))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistOutput(varargin{i}))
            obj.Outputs{1, numel(obj.Outputs) + 1} = varargin{i};
        end
    end

end

