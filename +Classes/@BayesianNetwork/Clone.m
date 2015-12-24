function BayesianNetwork = Clone(obj)
    BayesianNetwork = Classes.BayesianNetwork();
    
    for i = 1:numel(obj.Nodes)
        BayesianNetwork.AddNodes(Functions.Clone(obj.Nodes{i}));
    end
    BayesianNetwork.Evidences = obj.Evidences;
    BayesianNetwork.Graph = obj.Graph;
    BayesianNetwork.IncidenceMatrix = obj.IncidenceMatrix;
    BayesianNetwork.InferenceEngine = obj.InferenceEngine;
end

