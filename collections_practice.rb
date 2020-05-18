
require 'pry'
def begins_with_r(strings)
    strings.all? do |string|
        string.start_with?("r")
    end
end

def contain_a(strings)
    strings.select do |string|
        string.include?("a")
    end
end

def first_wa(strings_and_symbols)
    strings_and_symbols.find do |string_or_symbol|
        string_or_symbol.to_s.start_with?("wa")
    end
end

def remove_non_strings(varying_data_types)
    varying_data_types.select do |data_type|
        # data_type.class == String
        data_type.is_a?(String)
    end
end

def find_existing_hash(original_name, counts_array)
    counts_array.find do |counted_hash|
        counted_hash[:name] == original_name
    end
end

def count_elements(name_hashes)
    name_hashes.reduce( [] ) do |counts_array, name_hash|

        existing_count_hash = find_existing_hash(name_hash[:name], counts_array)

        if existing_count_hash
            existing_count_hash[:count] += 1
        else
            new_count_hash = {
                name: name_hash[:name],
                count: 1
            }

            counts_array << new_count_hash
        end

        counts_array
    end
end

# def merge_data(first_array, second_array)
    # first_array.each do |hash|
    #     new_hash = {}

    #     hash.each do |key, value|
    #         new_hash[key] = value
    #     end

    #     output << new_hash
    # end

    # second_array.each_with_index do |hash, index|
    #     existing_hash = output[index]
        
    #     second_array[index].each do |key, value|
    #         existing_hash[key] = value
    #     end
    # end
# end

def merge_data(first_array, second_array)
    output = []

    first_array.each_with_index do |element, index|
        new_hash = {}
    
        first_array[index].each do |key, value|
            new_hash[key] = value
        end
    
        second_array[index].each do |key, value|
            new_hash[key] = value
        end
    
        output << new_hash
    end

    output
end

def find_cool(hashes)
    hashes.select do |hash|
        hash[:temperature] == "cool"
    end
end

# def organize_campuses campuses
#     locations = campuses.map { |name, location_hash| location_hash[:location] }.uniq
    
#     my_hash = {}

#     locations.each do |loc|
#         matched_schools = campuses.map do |name, location_hash|
#             name if location_hash[:location] == loc
#         end.compact

#         my_hash[loc] = matched_schools
#     end

#     my_hash
# end

def organize_campuses(campuses)
    campuses.reduce( {} ) do |campuses_by_location, (name, location_hash)|
        location = location_hash[:location]

        if campuses_by_location[location]
            campuses_by_location[location] << name
        else
            campuses_by_location[location] = [ name ]
        end
        
        campuses_by_location
    end
end