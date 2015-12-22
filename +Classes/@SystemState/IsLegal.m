function Legal = IsLegal(obj)
    if (numel(obj.Bases) == 0)
        error(Enumerations.ErrorType.SystemStateContainsNoFunction);
    end
    
    if (numel(obj.Bases) ~= numel(obj.IsRunning))
        error(Enumerations.ErrorType.TheDimensionOfIsRunningIsWrong);
    end
    
    if (2^numel(obj.Bases) ~= numel(obj.LegalTable))
        error(Enumerations.ErrorType.TheDimensionOfLegalTableIsWrong);
    end
    
    Legal = obj.LegalTable(Functions.BinaryArray2Number(obj.IsRunning) + 1);
end

