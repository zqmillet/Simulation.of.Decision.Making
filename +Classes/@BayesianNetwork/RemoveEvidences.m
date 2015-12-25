function RemoveEvidences(obj, varargin)
% This function is used to remove the evidences from the Bayesian network.
% If there is no parameter, this function will remove all the evidences.
% If there are parameters, this function will remove the evidences which are in the parameter.

    if (nargin == 1)
        RemoveList = obj.Nodes;
    else
        for i = 1:numel(varargin)
            if (~isa(varargin{i}, Enumerations.ClassType.Node))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
        end
        RemoveList = varargin;
    end

    for i = 1:numel(RemoveList)
        obj.Evidences{RemoveList{i}.Index} = Enumerations.EvidenceState.Unknown;
        RemoveList{i}.Probability = 0;
    end
end

