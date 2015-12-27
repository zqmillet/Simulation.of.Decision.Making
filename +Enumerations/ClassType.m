classdef (Sealed) ClassType 
    properties (Constant)
        % System Type
        Double           = 'double';
        Char             = 'char';
        % Custom Type
        Node             = 'Classes.Node';
        BayesianNetwork  = 'Classes.BayesianNetwork';
        Process          = 'Classes.Process';
        Product          = 'Classes.Product';
        SystemState      = 'Classes.SystemState';
        SecurityStrategy = 'Classes.Strategies.Security';
        RecoverStrategy  = 'Classes.Strategies.Recover';
        RiskModel        = 'Classes.RiskModel';
    end

    methods (Access = private)
        function obj = ClassType
        end
    end    
end