function Probabilities = GetConditionalProbabilities(obj)
% This function is used to get the conditional probability table (CPT) in correct order.
%
% The default order of CPT is the order that the parents are added, but the correct order of the CPT is according to the indexes of its parents.
%
% For example, there are 4 nodes:
%  1. a01.Index = 5,
%  2. a02.Index = 2,
%  3. a03.Index = 7,
%  4. a04.Index = 1.
% and the parents of the node a01 is a02, a03, and a04. The order that nodes a01, a02, and a03 are added is 'a01, a02, a03'. The default CPT is:
% P(a01 | a02, a03, a04)
%    p1     F    F    F
%    p2     F    F    T
%    p3     F    T    F
%    p4     F    T    T
%    p5     T    F    F
%    p6     T    F    T
%    p7     T    T    F
%    p8     T    T    T
%
% The correct order of CPT is:
% P(a01 | a03, a02, a04)
%    q1     F    F    F   <=>   p1
%    q2     F    F    T   <=>   p2
%    q3     F    T    F   <=>   p5
%    q4     F    T    T   <=>   p6
%    q5     T    F    F   <=>   p3
%    q6     T    F    T   <=>   p4
%    q7     T    T    F   <=>   p7
%    q8     T    T    T   <=>   p8
    
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    if (~isa(obj, Enumerations.ClassType.Node))
        error(Enumerations.ErrorType.InputParameterTypeError);
    end

    if (2^numel(obj.Parents) ~= numel(obj.ConditionalProbabilities))
        error(Enumerations.ErrorType.NumbersOfParentsAndConditionalProbabilitiesError);
    end

    DefaultOrder = zeros(1, numel(obj.Parents));
    for i = 1:numel(obj.Parents)
        DefaultOrder(1, i) = obj.Parents{i}.Index;
    end
    
    DescendOrder = sort(DefaultOrder, 2, Enumerations.SortDirection.Descend);
    
    CorrentOrder = DefaultOrder;
    for i = 1:numel(obj.Parents)
        CorrentOrder(i) = find(DescendOrder == DefaultOrder(i));
    end
    
    Probabilities = zeros(size(obj.ConditionalProbabilities));
    for i = 1:numel(obj.ConditionalProbabilities)
        Binary = dec2bin(i - 1, numel(obj.Parents));
        Binary = Binary(reshape(CorrentOrder, size(Binary)));
        Probabilities(bin2dec(Binary) + 1) = obj.ConditionalProbabilities(i);
    end    
end

