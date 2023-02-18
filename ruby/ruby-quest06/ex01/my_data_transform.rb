require 'date'

def get_email(str1)
    i = 0
    while i < str1.length
        if str1[i] == "@"
            return i
        end
        i += 1
    end
end

def my_data_transform(csv_content)
    i = 0
    lines = csv_content.split("\n")
    values = []
    while i < lines.length
        values[i] = lines[i].split(",") # spilt csv in str
        i += 1
    end

    i = 1
    while i < values.length
        email = values[i][4]
        index = get_email(values[i][4]) + 1 # to find the index of @ and then slice the str email
        values[i][4] = email[index..]
        i += 1
    end
    
    i = 1

    while i < values.length   # classify ages in groups
        if(values[i][5].to_i >= 1 and values[i][5].to_i <= 20)
            values[i][5] = "1->20"
        end
        if(values[i][5].to_i >= 21 and values[i][5].to_i <= 40)
            values[i][5] = "21->40"
        end
        if(values[i][5].to_i >= 41 and values[i][5].to_i <= 65)
            values[i][5] = "41->65";
        end
        if(values[i][5].to_i >= 66 and values[i][5].to_i <= 99)
            values[i][5] = "66->99";
        end
        i += 1
    end

    i = 1          #starting from 1, because the first string doesn't have a valid date
    while i < values.length
        time = DateTime.parse(values[i][9], '%Y-%m-%d %H:%M:%S')
        hour = time.hour          #we only need to evaluate the hours

        if(hour >= 6 and hour <= 11)
            values[i][9] = "morning"
        end
        if(hour >= 12 and hour <= 17)
            values[i][9] = "afternoon"
        end
        if(hour >= 18 and hour <= 24)
            values[i][9] = "evening"
        end
        i += 1
    end

    i = 0
    result = []
    while i < values.length
        result[i] = values[i].join(",")  #join again to have the correct output: one str per user
        i += 1
    end
    return result
end