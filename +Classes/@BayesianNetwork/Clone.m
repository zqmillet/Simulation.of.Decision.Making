function BayesianNetwork = Clone(obj)
    BayesianNetwork = Classes.BayesianNetwork();
    
    BayesianNetwork.Nodes = cell(size(obj.Nodes));
    for i = 1:numel(obj.Nodes)
        BayesianNetwork.Nodes{1, i} = Functions.Clone(obj.Nodes{i});
    end
    BayesianNetwork.Evidences = obj.Evidences;
    BayesianNetwork.Graph = obj.Graph;
    BayesianNetwork.IncidenceMatrix = obj.IncidenceMatrix;
    BayesianNetwork.InferenceEngine = obj.InferenceEngine;
end

