function AddEvidences(obj, varargin)
    

    for i = 1:numel(varargin)
        if (~isa(varargin{i}, 'Node'))
            error(ErrorType.InputParameterTypeError);
        end
    end
end

