require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    note =  assign(:note, instance_double(Note,
      body: "MyText",
      instrument_id: 1,
      timestamps: ["MyString"]
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "textarea[name=?]", "note[body]"

      assert_select "input[name=?]", "note[instrument_id]"

    end
  end
end
