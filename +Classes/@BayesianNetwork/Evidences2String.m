function String = Evidences2String(obj)
% This function is used to convert the evidences into string.

    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    String = '| ';
    for i = 1:numel(obj.Evidences)
        if (numel(obj.Evidences{i}) == 0) % Enumerations.EvidenceState.Unknown
            continue;
        end
        
        if (obj.Evidences{i} == Enumerations.EvidenceState.Happened)
            String = strcat(String, '+');
        end
        
        if (obj.Evidences{i} == Enumerations.EvidenceState.Unhappened)
            String = strcat(String, '-');
        end
        
        String = strcat(String, [obj.FindNodeByIndex(i).Name, ',']);
    end
    
    String = strrep(String(1, 1:(numel(String) - 1)), ',', ', ');
end

