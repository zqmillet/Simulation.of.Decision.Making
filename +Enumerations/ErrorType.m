classdef (Sealed) ErrorType   
    properties (Constant)
        InputParameterNumberError = ...
            'The number of input parameter(s) is wrong!';
        InputParameterTypeError = ...
            'The type of input parameter(s) is wrong!';
        InputParameterValueError = ...
            'The value of input parameter(s) is wrong!';
        CannotAddItselfIntoItsPatents = ...
            'Can''t add itself into its Parents!';
        ThisNodeDoesNotExist = ...
            'This node doesn''t exist in the Bayesian network!';
        IsNotSquareMatrix = ...
            'This matrix is not a square matrix!';
        BayesianNetworkNodeIndexError = ...
            'The indexes of nodes in the Bayesian network are wrong!';
        NumbersOfParentsAndConditionalProbabilitiesError = ...
            '2 ^ (number of parents) is not equal to number conditional probabilities!'
        NumbersOfNodesAndEvidencesError = ...
            'The number of nodes is not equal to the number of evidences!';
    end

    methods (Access = private)
        function obj = ErrorType
        end
    end    
end