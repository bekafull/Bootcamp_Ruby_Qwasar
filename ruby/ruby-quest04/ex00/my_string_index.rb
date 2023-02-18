def my_string_index(abd_1,abd_2)
    index = abd_1.index(abd_2)
    if index.to_i>0
          return index
    else
        return -1
    end
end