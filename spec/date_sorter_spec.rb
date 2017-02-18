require 'date_sorter'

RSpec.describe DateSorter do
  it '#sort_by_date(data) returns an array of data sorted by date' do
    data = [
      ["05/12/2014 Sat", nil, "ELI'S", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "31.29"],
      ["05/22/2014 Sat", nil, "Kroger", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "100.01"],
      ["05/03/2014 Sat", nil, "TARGET, 'Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "130.27"],
      ["05/08/2014 Sat", nil, "Sleepy Bee", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "20.25"],
      ["05/18/2014 Sat", nil, "Fresh Thyme", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "88.98"]
    ]
    actual = Program.sort_by_date(data)
    expected = [
      ["05/03/2014 Sat", nil, "TARGET, 'Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "130.27"],
      ["05/08/2014 Sat", nil, "Sleepy Bee", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "20.25"],
      ["05/12/2014 Sat", nil, "ELI'S", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "31.29"],
      ["05/18/2014 Sat", nil, "Fresh Thyme", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "88.98"],
      ["05/22/2014 Sat", nil, "Kroger", "Michael J Vezzani", "XXXX-XXXX-61017", nil, nil, "100.01"]
    ]
    expect(actual).to eq expected
  end
end
