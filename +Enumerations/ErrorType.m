classdef (Sealed) ErrorType   
    properties (Constant)
        InputParameterNumberError = ...
            'The number of input parameter(s) is wrong!';
        InputParameterTypeError = ...
            'The type of input parameter(s) is wrong!';
        CannotAddItselfIntoItsPatents = ...
            'Can''t add itself into its Parents!'
        
    end

    methods (Access = private)
        function obj = ErrorType
        end
    end
    
end