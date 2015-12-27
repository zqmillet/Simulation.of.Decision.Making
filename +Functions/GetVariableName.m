function Name = GetVariableName(varargin)
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    Name = inputname(1);
end

