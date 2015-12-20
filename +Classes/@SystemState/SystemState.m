classdef SystemState < handle
    properties
        Functions = {};
        IsRunning = [];
        LegalTable = [];
    end
    
    methods
        function obj = SystemState(Running)
            switch (nargin)
                case 0
                    % Do nothing.
                case 1
                    for i = 1:numel(Running)
                        if (~isa(Running(i), Enumerations.ClassType.Double))
                            error(Enumerations.ErrorType.InputParameterTypeError);
                        end

                        if (Running(i) ~= 1 && Running(i) ~= 0)
                            error(Enumerations.ErrorType.InputParameterValueError);
                        end                
                    end
                    obj.IsRunning = Running;
                otherwise
                    error(Enumerations.ErrorType.InputParameterNumberError);
            end
        end
        function disp(obj)
            disp(obj.IsRunning);
        end
        AddAllFunctions(obj, varargin);
        Exist = ExistFunction(obj, Function);
        GetCurrentState(obj);
        States = GetNearStates(obj, Distance);
    end    
end