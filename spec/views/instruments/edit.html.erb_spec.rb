require 'rails_helper'

RSpec.describe "instruments/edit", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      symbol: "MyString"
    ))
  end

  it "renders the edit instrument form" do
    render

    assert_select "form[action=?][method=?]", instrument_path(@instrument), "post" do

      assert_select "input[name=?]", "instrument[symbol]"
    end
  end
end
