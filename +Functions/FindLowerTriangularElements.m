function [Positions] = FindLowerTriangularElements(Matrix)
% This function is used to find the elements which is in the lower triangular of the matrix.
% For example the matrix is:
% 0 1 1 0
% 1 0 1 0
% 0 1 0 0
% 0 1 1 0
% 
% The output of this function is:
% Positions = [2, 1; 3, 2; 4, 2; 4, 3]
    
    if (~isa(Matrix, Enumerations.ClassType.Double))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end
    
    if (size(Matrix, 1) ~= size(Matrix, 2))
        error(Enumerations.ErrorType.IsNotSquareMatrix);
    end
    
    Position = zeros(numel(Matrix), 2);
    for i = 2:size(Matrix, 1)
        for j = 2:(i - 1)
            if (Matrix(i, j) ~= 0)
                Position(size(Position, 1) + 1, :) = [i, j];
            end
        end
    end

end

