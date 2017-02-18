require 'field_remover'

RSpec.describe FieldRemover do
  it '#remove_data_fields removes unnecessary data fields' do
    data = CSV.read('./files/amex_cc2.csv')
    expected = CSV.read('./files/amex_cc2_removed_fields.csv')
    actual = FieldRemover.remove_data_fields(data)
    expect(actual).to eq expected
  end
end
