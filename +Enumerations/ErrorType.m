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
        OnlyAssetNodeHasValueProperty = ...
            'Only asset node has value property!';
        CannotAddAnUnknownStateNodeIntoEvidences = ...
            'Can''t add a node whose state is unknows into the evidences!';
        ProcessNodeHasNoSupportNode = ...
            'The process node has no support node!';
        TheValueOfTheTruthTableIsNotZeroOrOne = ...
            'The value of the truth table is not 0 or 1!';
        InnerMatrixDimensionsMustAgree = ...
            'Inner matrix dimensions must agree!';
        SystemStateContainsNoFunction = ...
            'System state contains no function!';
        TheDimensionOfIsRunningIsWrong = ...
            'The dimension of IsRunning is wrong!';
        TheDimensionOfLegalTableIsWrong = ...
            'The dimension of LegalTable is wrong!';
        SystemStateIsIllegal = ...
            'System state is illegal!';
        NumbersOfKeysAndValuesAreNotEqual = ...
            'Numbers of keys and values of map are not equal!';
        ThereDoesNotExistThisKey = ...
            'There does not exist this key!';
    end

    methods (Access = private)
        function obj = ErrorType
        end
    end    
end