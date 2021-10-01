require 'rails_helper'

RSpec.describe "instruments/new", type: :view do
  before(:each) do
    assign(:instrument, Instrument.new(
      symbol: "MyString"
    ))
  end

  it "renders new instrument form" do
    render

    assert_select "form[action=?][method=?]", instruments_path, "post" do

      assert_select "input[name=?]", "instrument[symbol]"
    end
  end
end
