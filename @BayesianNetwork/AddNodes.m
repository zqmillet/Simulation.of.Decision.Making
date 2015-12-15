function AddNodes(obj, varargin)
    for i = 1:numel(varargin)
        if (~isa(varargin{i}, 'Node'))
            error(ErrorType.InputParameterTypeError);
        end
    end
    
    for i = 1:numel(varargin)
        if (~obj.ExistNode(varargin{i}))
            obj.Nodes{1, numel(obj.Nodes) + 1} = varargin{i};
        end
    end
end

