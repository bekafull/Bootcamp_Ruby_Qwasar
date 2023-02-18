def my_csv_parser(abd_1, abd_2)
    result = []
    a = abd_1.split("\n") # a,b,c,e\n1,2,3,4\n => [a,b,c,e] [1,2,3,4]
    for i in a
        result.append(i.split(","))
    end
    return result
end