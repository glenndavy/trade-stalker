require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, instance_double("Note",
      body: "MyText",
      instrument_id: 2,
      timestamps: ["Timestamps"]
    ))
    allow(@note).to receive_messages(:timestamp => "Timestamps")
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Timestamps/)
  end
end
