function Inference(obj)

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    ProcessVector = zeros(size(obj.Processes));
    for i = 1:numel(obj.Processes)
        ProcessVector(1, i) = obj.Processes{i}.GetState();
    end
    
    while(true)
        ProcessVectorPrime = Functions.CircleMultiply(obj.IncidenceMatrix, ProcessVector);
        if (ProcessVectorPrime == ProcessVector)            
            break;
        end
        ProcessVector = ProcessVectorPrime;         
    end
    
    IncidenceMatrixPrime = obj.IncidenceMatrix;
    IncidenceMatrixPrime(IncidenceMatrixPrime == -1) = 0;
    
    ProductVector = IncidenceMatrixPrime*ProcessVector';
    ProductVector(ProductVector ~= 0) = 1;
    
    for i = 1:numel(obj.Products)
        obj.Products{i}.Exist = ProductVector(obj.Products{i}.Index);
    end
end

