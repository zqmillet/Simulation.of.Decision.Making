function NewObject = Clone(Object)
    % Instantiate new object of the same class.
    NewObject = feval(class(Object));

    % Copy all non-hidden properties.
    Properties = properties(Object);
    for i = 1:numel(Properties)
        NewObject.(Properties{i}) = Object.(Properties{i});
    end
end