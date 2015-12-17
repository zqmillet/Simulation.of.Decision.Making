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
                if (i ~= numel(varargin) && isa(varargin{i + 1}, Enumerations.ClassType.Double))
                    if (numel(varargin{i + 1}) == 0)
                        error(Enumerations.ErrorType.CannotAddAnUnknownStateNodeIntoEvidences);
                    end
                    
                    switch (varargin{i + 1})
                        case Enumerations.EvidenceState.Happened
                            varargin{i}.Probability = 1;
                        case Enumerations.EvidenceState.Unhappened
                            varargin{i}.Probability = 0;
                    end
                    
                    obj.Evidences{varargin{i}.Index} = varargin{i + 1};                    
                % If this node has no optional parameter.
                else
                    obj.Evidences{varargin{i}.Index} = Enumerations.EvidenceState.Happened;
                    varargin{i}.Probability = 1;
                end
            % otherwise throw an error.
            otherwise
                error(Enumerations.ErrorType.InputParameterTypeError)
        end
    end
end

