classdef EvidenceState
    properties (Constant)
        Happened   = 2;
        Unhappened = 1;
        Unknown    = [];
    end
    
    methods (Access = private)
        function obj = EvidenceState
        end
    end
end

