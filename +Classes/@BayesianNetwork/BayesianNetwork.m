classdef BayesianNetwork < handle
    properties
        Nodes = {};
        Evidences = {};
        Graph;
        IncidenceMatrix;
    end
    
    methods
        AddNodes(obj, varargin);
        Exist = ExistNode(obj, Node);
        AddEvidences(obj, varargin);
        Exist = ExistEvidences(obj, Node);
        Initialize(obj);
    end
end