require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        body: "MyText",
        instrument_id: 2,
        timestamps: "Timestamps"
      ),
      Note.create!(
        body: "MyText",
        instrument_id: 2,
        timestamps: "Timestamps"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Timestamps".to_s, count: 2
  end
end
