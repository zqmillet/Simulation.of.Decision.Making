classdef Dictionary < handle
    properties
        Keys = {};
        Values = {};
    end
    
    methods
        Exist = Exist(obj, Key);
        Delete(obj, Key);
        Clear(obj);
        GetValue(obj, Key);
        Set(obj, Key, Value);
        Value = Get(obj, Key);
    end    
end

