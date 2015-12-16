function AddEvidences(obj, varargin)
% This function is used to add evidences into the Bayesian network.
% 
% There are two kinds of evidences:
% 1. Happened;
% 2. Unhappened.
%
% The default type of input evidence is 'Happened', it means that the following two codes are equivalent.
% 1. obj.AddEvidences(a1, ...
%                     a2, ...
%                     a3, Enumerations.EvidenceState.Unhappened);
% 2. obj.AddEvidences(a1, Enumerations.EvidenceState.Happened, ...
%                     a2, Enumerations.EvidenceState.Happened, ...
%                     a3, Enumerations.EvidenceState.Unhappened);

    % If the number of input parameters is less than 2, throw an error.
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError)
    end
    
    % For each input parameter.
    for i = 1:numel(varargin)
        switch (class(varargin{i}))
            % If the class of ith parameter is double.
            case Enumerations.ClassType.Double
                if (1 == i)
                    error(Enumerations.ErrorType.InputParameterTypeError);
                end
                
                if (~isa(varargin{i - 1}, Enumerations.ClassType.Node))
                    error(Enumerations.ErrorType.InputParameterTypeError);
                end
            % If the class of ith parameter is Node.
            case Enumerations.ClassType.Node
                % If this node is not in the Bayesian network,
                % throw an error.
                if (~obj.ExistNode(varargin{i}))
                    error(Enumerations.ErrorType.ThisNodeDoesNotExist);
                end                
                
                % If this node has an optional parameter.
                if (i ~= numel(varargin) && isa(varargin{i + 1}, Enumerations.ClassType.Char)) 
                    varargin{i}.EvidenceState = varargin{i + 1};
                % If this node has no optional parameter.
                else
                    varargin{i}.EvidenceState = Enumerations.EvidenceState.Happened;
                end              
                
                % If this node is not in the evidence list, add it into the evidence list.
                if (~obj.ExistEvidence(varargin{i}))
                    obj.Evidences{1, numel(obj.Evidences) + 1} = varargin{i};
                end
            % otherwise throw an error.
            otherwise
                error(Enumerations.ErrorType.InputParameterTypeError)
        end
    end
end

