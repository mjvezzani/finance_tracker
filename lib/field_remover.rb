class FieldRemover
  def self.remove_data_fields(data)
    data.map{|x| [x[0], x[7], nil, x[2]]}
  end
end
