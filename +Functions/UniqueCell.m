function Output = UniqueCell(Input)
    Output = cell(size(Input));
    Number = 0;
    for i = 1:numel(Input)
        if (isequal(Input{i}, []))
            continue;
        end
        
        Exist = false;
        for j = 1:numel(Output)
            if (isequal(Input{i}, Output{j}))
                Exist = true;
                break;
            end
        end
        
        if (~Exist)
            Number = Number + 1;
            Output{1, Number} = Input{i};            
        end
    end
    
    Output = Output(:, 1:Number);
end

