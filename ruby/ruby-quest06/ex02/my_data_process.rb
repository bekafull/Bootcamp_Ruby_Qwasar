def add_key_value_pairs (result, key, values)
    if (result[key][values] == nil)
        result[key][values] = 1
    else result[key][values] += 1
    end
    return result
end
  
  def my_data_process(array)
    result = {"Gender"=> {}, "Email"=>  {}, "Age"=>  {}, "City"=>  {}, "Device"=>  {}, "Order At"=> {}}
    for line in array.drop(1)
        values = line.split(",")
        add_key_value_pairs(result, "Gender", values[0])
        add_key_value_pairs(result, "Email", values[4])
        add_key_value_pairs(result, "Age", values[5])
        add_key_value_pairs(result, "City", values[6])
        add_key_value_pairs(result, "Device", values[7])
        add_key_value_pairs(result, "Order At", values[9])
    end
    return result.to_json
  
end