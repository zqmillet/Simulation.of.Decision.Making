function  AddParents(obj, varargin)
% This function is used to add parents into the process.
    
    for i = 1:numel(varargin)
        if (~obj.ExistParent(varargin{i}))
            obj.Parents{1, numel(obj.Parents) + 1} = varargin{i};
        end
    end
end

