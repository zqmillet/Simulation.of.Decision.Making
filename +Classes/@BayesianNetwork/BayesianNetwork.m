classdef BayesianNetwork < handle
    properties
        Nodes = {};
        Evidences = {};
    end
    
    methods
        AddNodes(obj, varargin);
        Exist = ExistNode(obj, Node);
        AddEvidences(obj, varargin);
        Exist = ExistEvidences(obj, Node);
    end
end