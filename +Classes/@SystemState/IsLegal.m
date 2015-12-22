function Legal = IsLegal(obj)
    if (numel(obj.Functions) == 0)
        error(Enumerations.ErrorType.SystemStateContainsNoFunction);
    end
    
    if (numel(obj.Functions) ~= numel(obj.IsRunning))
        error(Enumerations.ErrorType.TheDimensionOfIsRunningIsWrong);
    end
    
    if (2^numel(obj.Functions) ~= numel(obj.LegalTable))
        error(Enumerations.ErrorType.TheDimensionOfLegalTableIsWrong);
    end
    
    Legal = obj.LegalTable(Functions.BinaryArray2Number(obj.IsRunning) + 1);
end

