function UnionArray = GetUnion(varargin)
    switch (nargin)
        case 0
            error(Enumerations.ErrorType.InputParameterNumberError);
        case 1
            UnionArray = varargin{1};
        case 2
            UnionArray = Functions.UniqueCell([varargin{1}, varargin{2}]);
        otherwise
            UnionArray = Functions.GetUnion(varargin{1}, Functions.GetUnion(varargin{2:end}));
    end
end

