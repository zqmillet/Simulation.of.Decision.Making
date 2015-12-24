function UnionArray = GetUnion(varargin)
    if (nargin == 0)
        error(Enumerations.ErrorType.InputParameterNumberError);            
    end
    UnionArray = Functions.UniqueCell([varargin{:}]);
end

