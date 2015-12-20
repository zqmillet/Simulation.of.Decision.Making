function Inference(obj)
    
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.BayesianNetwork.Initialize();
    obj.ProductionModel.Initialize();
end

