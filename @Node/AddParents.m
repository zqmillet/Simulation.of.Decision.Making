function AddParents(obj, varargin)
    if (nargin < 2)
        error(ErrorType.InputParameterNumberError);
    end

    for i = 1:numel(varargin)
      	if (~isa(varargin{i}, 'Node'))
            error(ErrorType.InputParameterTypeError);
        end
        
        if (obj == varargin{i})
            error(ErrorType.CannotAddItselfIntoItsPatents);
        end
        
        if (obj.ExistParent(varargin{i}))
            continue;
        end
        
        obj.Parents{1, numel(obj.Parents) + 1} = varargin{i};
    end
end

