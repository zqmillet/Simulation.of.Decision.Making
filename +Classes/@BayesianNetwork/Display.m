function Display(obj, varargin)
% This function is used to display the nodes and their probabilities.
% If there is no parameter, this function will display all nodes and their probabilities.
% If there are parameters, this function will display the nodes which are in the parameter and their probabilities.

    if (nargin == 1)
        DisplayList = obj.Nodes;
    else        
        for i = 1:numel(varargin)
            if (~isa(varargin{i}, Enumerations.ClassType.Node))
                error(Enumerations.ErrorType.InputParameterTypeError);
            end            
        end
        DisplayList = varargin;
    end
    
    MaxNameLength = 0;
    for i = 1:numel(DisplayList)
        if (MaxNameLength < numel(DisplayList{i}.Name))
            MaxNameLength = numel(DisplayList{i}.Name);
        end        
    end
    
    for i = 1:numel(DisplayList)
        disp(['P(+' DisplayList{i}.Name Functions.RepeatString(' ', MaxNameLength - numel(DisplayList{i}.Name)) obj.Evidences2String() ') = ' num2str(DisplayList{i}.Probability)]);
    end
end

