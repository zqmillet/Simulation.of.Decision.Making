classdef BayesianNetwork < handle
    properties
        Nodes = {};
        Evidences = {};
        Graph;
        IncidenceMatrix;
        InferenceEngine;
    end
    
    methods
        AddNodes(obj, varargin);
        Exist = ExistNode(obj, Node);
        AddEvidences(obj, varargin);
        Exist = ExistEvidences(obj, Node);
        Initialize(obj);
        Node = FindNodeByIndex(obj, Index);
        Inference(obj, varargin);
    end
end
