classdef Process < handle
% The modol of process is shown as follows.
%   
%             +--------+
%    Input--->+  Name  +---> Output
%             +--+--+--+
%                |  |
%               /    \
%              /      \
%          Parent1  Parent2 

    properties
        Name = '';
        Index = 0;
        % The parents of process can be system functions, and other processes.
        Parents = {};
        % The state of its parent is true, means that the corresponding system function or process works well.
        % The state of its patent is false, means that the corresponding system function or process doesn't work well.
        TruthTable = [];
        
        Inputs = {};
        Outputs = {};
    end  
    
    methods
        function obj = Process(Name)
            if (nargin ~= 1)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(Name, Enumerations.ClassType.Char))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end
            
            obj.Name = Name;
        end        
        AddParents(obj, varargin);
        AddAllParents(obj, varargin);
        AddInputs(obj, varargin);
        AddOutputs(obj, varargin);
        Exist = ExistParent(obj, Parent);
        Exist = ExistInput(obj, Product);
        Exist = ExistOutput(obj, Product);
        State = GetState(obj);
    end
end


