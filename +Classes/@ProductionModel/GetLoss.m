function Loss = GetLoss(obj)
% This function is used to calculate the loss of system.
    
    Loss = 0;
    for i = 1:numel(obj.Products)
        Loss = Loss + (1 - obj.Products{i}.Exist)*obj.Products{i}.Value;
    end
end

