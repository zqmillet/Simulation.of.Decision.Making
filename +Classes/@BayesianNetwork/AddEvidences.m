function AddEvidences(obj, varargin)
    

    for i = 1:numel(varargin)
        if (~isa(varargin{i}, 'Classes.Node'))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
    end
end

