function AddInputs(obj, varargin)

    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Product))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        if (~obj.ExistInput(varargin{i}))
            obj.Inputs{1, numel(obj.Inputs) + 1} = varargin{i};
        end
    end
end

