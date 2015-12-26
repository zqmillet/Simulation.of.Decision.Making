function AddRiskModel(obj, RiskModel)
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(RiskModel, Enumerations.ClassType.RiskModel))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    obj.RiskModel = RiskModel;
end

