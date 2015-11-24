function [Location] = GetSaddlePoint(Matrix)
% This function is used to find the saddle point of Matrix.
% If there are saddles in Matrix, return the Location, which contains the
% (i, j) of the points.
% If there no saddle point, return an empty matrix.

    Location = zeros(size(Matrix, 1)*size(Matrix, 2), 2);
    Count = 1;
    for i = 1:size(Matrix, 1)
        for j = 1:size(Matrix, 2)
            if (Matrix(i, j) == max(Matrix(:, j)) && Matrix(i, j) == min(Matrix(i, :)))
                Location(Count, :) = [i, j];
                Count = Count + 1;
            end
        end
    end
    
    Location = Location(1:Count - 1, :);
end

