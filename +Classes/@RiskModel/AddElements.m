function AddElements(obj, varargin)
% This function is used to add elements into the risk model.
% The element can be attack/resource/function/incident/asset node or process.

    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    for i = 1:numel(varargin)
        if (isa(varargin{i}, Enumerations.ClassType.Node))
            obj.BayesianNetwork.AddNodes(varargin{i});
            continue;
        end
        
        if (isa(varargin{i}, Enumerations.ClassType.Process))
            obj.ProductionModel.AddProcesses(varargin{i});
            continue;
        end
        
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
end

