require 'rails_helper'

RSpec.describe "instruments/show", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      symbol: "Symbol"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Symbol/)
  end
end
