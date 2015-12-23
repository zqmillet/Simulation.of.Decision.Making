classdef Dictionary < handle
    properties
        Keys = {};
        Values = {};
    end
    
    methods
        Exist = Exist(obj, Key);
        Delete(obj, Key);
        function obj = Clear(obj)
            obj.Keys = {};
            obj.Values = {};
        end
        
        function Value = subsref(obj, Key)
            if (numel(obj.Keys) ~= numel(obj.Values))
                error(Enumerations.ErrorType.NumbersOfKeysAndValuesAreNotEqual);
            end
            
            switch (Key.type)
                case '()'
                    for i = 1:numel(obj.Keys)
                        if (isequal(obj.Keys{i}, Key))
                            Value = obj.Values{i};
                            return;
                        end
                    end
                case '.'
                    Value = builtin('subsref', obj, Key);
            end
            
        end
        
        function obj = subsasgn(obj, Key, Value)
            for i = 1:numel(obj.Keys)
                if (isequal(obj.Keys{i}, Key))
                    obj.Values{i} = Value;
                    return;
                end
            end
            
            obj.Keys{1, numel(obj.Keys) + 1} = Key;
            obj.Values{1, numel(obj.Values) + 1} = Value;
        end
    end    
end

