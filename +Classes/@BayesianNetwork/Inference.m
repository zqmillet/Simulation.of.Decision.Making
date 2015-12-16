function Inference(obj, varargin)
% This function is used to inference the Bayesian network, then assign the probabilities of all nodes in the input parameters.
% If there does not exist paramter, this function will assign the probabilities of all nodes in the Bayesian network.
    
    % Update the inference engine.
    [obj.InferenceEngine,~]=enter_evidence(obj.InferenceEngine,obj.Evidences);
    
    % If there is no parameter, assign the probabilities of all nodes in the Bayesian network.
    if (nargin == 1)
        for i = 1:numel(obj.Nodes)
            Probability = marginal_nodes(obj.InferenceEngine, obj.Nodes{i}.Index);
            % Check i is Evidence
            obj.Nodes{i}.Probability = Probability.T(2);
        end
        return;
    end
    
    % If there are parameters, assigin the probabilities of all nodes in the input parameters.
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, Enumerations.ClassType.Node))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        Probability = marginal_nodes(obj.InferenceEngine, varargin{i}.Index);
        varargin{i}.Probability = Probability.T(2);
    end    
end

