function Initialize(obj)

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end

    ProcessNumber = numel(obj.Processes);
    
    for i = 1:ProcessNumber
        Products = [obj.Processes{i}.Inputs, obj.Processes{i}.Outputs];
        for j = 1:numel(Products)
            if (~obj.ExistProduct(Products{j}))
                obj.Products{1, numel(obj.Products) + 1} = Products{j};
                Products{j}.Index = numel(obj.Products);
            end
        end
    end
    
    ProductNumber = numel(obj.Products);
    
    obj.IncidenceMatrix = zeros(ProductNumber, ProcessNumber);
    for i = 1:ProcessNumber
        for j = 1:numel(obj.Processes{i}.Outputs)
            obj.IncidenceMatrix(obj.Processes{i}.Outputs{j}.Index, obj.Processes{i}.Index) = 1;
        end
        
        for j = 1:numel(obj.Processes{i}.Inputs)
            obj.IncidenceMatrix(obj.Processes{i}.Inputs{j}.Index, obj.Processes{i}.Index) = -1;
        end
    end
end

