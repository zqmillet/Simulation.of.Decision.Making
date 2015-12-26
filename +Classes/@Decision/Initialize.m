function Initialize(obj)
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.RiskModel.Initialize();
end

