require 'spec_helper'

describe "parsers/new", :type => :view do
  before(:each) do
    assign(:parser, Parser.new(
      :name => "MyString",
      :xpath => "MyString"
    ))
  end

  it "renders new parser form" do
    render

    assert_select "form[action=?][method=?]", parsers_path, "post" do

      assert_select "input#parser_name[name=?]", "parser[name]"

      assert_select "input#parser_xpath[name=?]", "parser[xpath]"
    end
  end
end
