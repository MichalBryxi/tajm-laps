require 'spec_helper'

describe "parsers/edit", :type => :view do
  before(:each) do
    @parser = assign(:parser, Parser.create!(
      :name => "MyString",
      :xpath => "MyString"
    ))
  end

  it "renders the edit parser form" do
    render

    assert_select "form[action=?][method=?]", parser_path(@parser), "post" do

      assert_select "input#parser_name[name=?]", "parser[name]"

      assert_select "input#parser_xpath[name=?]", "parser[xpath]"
    end
  end
end
