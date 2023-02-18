def my_is_sort(param_1)
    i = 0;
    j=1;
    if param_1 == []
        return true;
    end

    while i < param_1.length
        while j<param_1.length
            if param_1[i]>=param_1[j]
                return true;
            else
                return false;
            end
        end
    end
end