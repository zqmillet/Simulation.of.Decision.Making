classdef Decision    
    properties
        RiskModel;
        SecurityStrategies;
        RecoverStrategies;
        AcceptableRiskRatio;
        % AcceptableRisk = AcceptableRiskRatio * MaxSystemLoss.
        AcceptableRisk;
    end
    
    methods
        function obj = Decision(AcceptableRiskRatio)
            if (nargin ~= 1)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(AcceptableRiskRatio, Enumerations.ClassType.Double))
                error(Enumerations.ErrorType.InputParameterTypeError)
            end
            
            obj.RiskModel = Classes.RiskModel();
            obj.SecurityStrategies = {};
            obj.RecoverStrategies = {};
            obj.AcceptableRiskRatio = AcceptableRiskRatio;
        end
        AddRiskModel(obj, RiskModel);
        AddStrategies(obj, varargin);
        Initialize(obj);
        OptimalStrategy = GetOptimalStrategy(obj, AttackStrategies, CurrentSystemState);
        OptimalSystemState = GetOptimalSystemState(obj, AttackStrategies, CurrentSystemState);
    end
end

