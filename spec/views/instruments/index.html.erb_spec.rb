require 'rails_helper'

RSpec.describe "instruments/index", type: :view do
  before(:each) do
    assign(:instruments, [
      Instrument.create!(
        symbol: "Symbol"
      ),
      Instrument.create!(
        symbol: "Symbol"
      )
    ])
  end

  it "renders a list of instruments" do
    render
    assert_select "tr>td", text: "Symbol".to_s, count: 2
  end
end
