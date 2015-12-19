function Inference(obj)

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    ProcessVector = zeros(size(obj.Processes));
    for i = 1:numel(obj.Processes)
        ProcessVector(1, i) = obj.Processes{i}.GetState();
    end
    
    disp(ProcessVector);
end

