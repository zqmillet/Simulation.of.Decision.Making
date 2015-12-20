function PPrime = Circle(IncidenceMatrix, P)
% This function is used to calculate a special multiplication which is definited as follows.
%
%         / 0, P(j) = 0,
% P'(j) = | 0, IncidenceMatrix(i, j) = -1, IncidenceMatrix(i, k) = 1, P(k) = 0,
%         \ 1, otherwise.

    if (nargin ~= 2)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (size(P, 1) ~= 1)
        error(Enumerations.ErrorType.InnerMatrixDimensionsMustAgree);
    end
    
    if (size(IncidenceMatrix, 2) ~= numel(P))
        error(Enumerations.ErrorType.InnerMatrixDimensionsMustAgree);
    end

    PPrime = ones(size(P));
    for j = 1:numel(PPrime)
        if (P(1, j) == 0)
            PPrime(1, j) = 0;
            continue;
        end
        
        RowIndexes = find(IncidenceMatrix(:, j) == -1);
        for i = 1:numel(RowIndexes)
            ColumnIndexes = find(IncidenceMatrix(RowIndexes(i), :) == 1);
            for k = 1:numel(ColumnIndexes)
                if (P(ColumnIndexes(k)) == 0)
                    PPrime(j) = 0;
                end
            end
        end
    end
end

