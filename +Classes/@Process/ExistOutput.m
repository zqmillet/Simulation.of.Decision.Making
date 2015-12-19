function Exist = ExistOutput(obj, Product)
    
    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(Product, Enumerations.ClassType.Product))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    for i = 1:numel(obj.Outputs)
        if (Product == obj.Outputs{i})
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

