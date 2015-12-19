function Exist = ExistProduct(obj, Product)

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Product, Enumerations.ClassType.Product))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Products)
        if (Product == obj.Products{i})
            Exist = true;
            return;
        end
    end

    Exist = false;
end

