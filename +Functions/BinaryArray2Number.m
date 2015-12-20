function Number = BinaryArray2Number(BinaryArray)

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(BinaryArray, Enumerations.ClassType.Double))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (size(BinaryArray, 1) ~= 1)
        error(Enumerations.ErrorType.InnerMatrixDimensionsMustAgree);
    end
    
    for i = numel(BinaryArray)
        if (BinaryArray(i) ~= 1 && BinaryArray(i) ~= 0)
            error(Enumerations.ErrorType.InputParameterValueError);
        end
    end
    
    Number = BinaryArray * (2.^(numel(BinaryArray) - 1:-1:0))';

end

