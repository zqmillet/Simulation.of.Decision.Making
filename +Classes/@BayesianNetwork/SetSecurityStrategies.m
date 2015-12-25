function SetSecurityStrategies(obj, varargin)
    % If the number of parameters is not equal to 2, throw an error.
    if (nargin < 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    % For each parameter (security strategy), ...
    for i = 1:numel(varargin)
        % if it is not a security strategy, throw an error.
        if (~isa(varargin{i}, Enumerations.ClassType.SecurityStrategy))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        % For each attack strategy which will be prevented by this security strategy, ...
        for j = 1:numel(varargin{i}.AttackStrategies.Keys)
            % Get all its child nodes, and form them into a set.
            ChildSet = obj.GetChildSet(varargin{i}.AttackStrategies.Keys{j});
            % For each its child node, ...
            for k = 1:numel(ChildSet)
                % Initialize a coefficient vector.
                CoefficientVector = ones(size(ChildSet{k}.ConditionalProbabilities));
                Index = 0;
                for l = 1:numel(ChildSet{k}.Parents)
                    Index = Index + 1;
                    if (isequal(ChildSet{k}.Parents{l}, varargin{i}.AttackStrategies.Keys{j}))
                        break;
                    end
                end
                
                % Calculate the coefficient vector.
                for l = 0:2^(numel(ChildSet{k}.Parents)) - 1
                    if (bitand(bitshift(l, numel(ChildSet{k}.Parents) - Index), 1) == 1)
                        CoefficientVector(l + 1) = varargin{i}.AttackStrategies.Values{j};
                    end
                end
                
                
                
               
                
                % Change its conditional probability table.
            end
        end
    end
end

