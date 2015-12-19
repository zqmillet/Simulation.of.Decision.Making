function AddElements(obj, varargin)
    
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (isa(varargin{i}, Enumerations.ClassType.Process))
            if (~obj.ExistProcess(varargin{i}))
                obj.Processes{1, numel(obj.Processes) + 1} = varargin{i};
                varargin{i}.Index = numel(obj.Processes) + 1;
            end
            continue;
        end
        
        if (isa(varargin{i}, Enumerations.ClassType.Product))
            if (~obj.ExistProduct(varargin{i}))
                obj.Products{1, numel(obj.Products) + 1} = varargin{i};
                varargin{i}.Index = numel(obj.Products) + 1;
            end
            continue;
        end
        
        error(Enumerations.ErrorType.InputParameterTypeError);
    end

end

