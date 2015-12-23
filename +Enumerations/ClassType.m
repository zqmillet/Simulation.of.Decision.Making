classdef (Sealed) ClassType 
    properties (Constant)
        Double           = 'double';
        Char             = 'char';
        Node             = 'Classes.Node';
        BayesianNetwork  = 'Classes.BayesianNetwork';
        Process          = 'Classes.Process';
        Product          = 'Classes.Product';
        SystemState      = 'Classes.SystemState';
        SecurityStrategy = 'Classes.Strategies.Security';
        RecoverStrategy  = 'Classes.Strategies.Recover';
    end

    methods (Access = private)
        function obj = ClassType
        end
    end    
end