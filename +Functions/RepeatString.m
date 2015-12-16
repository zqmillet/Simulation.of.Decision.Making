function OutputString = RepeatString(String, Round)
% This function is used to generate a string many times.

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(String, Enumerations.ClassType.Char) || ~isa(Round, Enumerations.ClassType.Double))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    OutputString = repmat(String, 1, Round);
end

