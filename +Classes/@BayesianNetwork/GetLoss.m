function Loss = GetLoss(obj)
% This function is used to calculate the loss of system.

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    Loss = 0;
    for i = 1:numel(obj.Nodes)
        if (obj.Nodes{i}.Type == Enumerations.NodeType.Asset);
            Loss = Loss + obj.Nodes{i}.Probability * obj.Nodes{i}.Value;
        end
    end
end

