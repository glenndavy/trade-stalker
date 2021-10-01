require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      body: "MyText",
      instrument_id: 1,
      timestamps: "MyString"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "textarea[name=?]", "note[body]"

      assert_select "input[name=?]", "note[instrument_id]"

      assert_select "input[name=?]", "note[timestamps]"
    end
  end
end
