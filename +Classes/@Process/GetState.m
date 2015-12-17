function State = GetState(obj)
    if (numel(obj.Parents) == 0)
        error(Enumerations.ErrorType.ProcessNodeHasNoSupportNode);
    end
    
    Index = zeros(size(obj.Parents));
    for i = 1:numel(obj.Parents)
        ParentState = 0;
        
        if (isa(obj.Parents{i}, Enumerations.ClassType.Node))
            if (obj.Parents{i}.Probability == 1)
                ParentState = 0;
            else
                ParentState = 1;
            end
        end
        
        if (isa(obj.Parents{i}, Enumerations.ClassType.Process))
            ParentState = obj.Parents{i}.GetState();
        end
        
        Index(i) = ParentState;
    end
    
    State = obj.TruthTable(Index * (2.^((numel(Index) - 1):-1:0))' + 1);
end

