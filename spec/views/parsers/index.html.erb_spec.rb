require 'spec_helper'

describe "parsers/index", :type => :view do
  before(:each) do
    assign(:parsers, [
      Parser.create!(
        :name => "Name",
        :xpath => "Xpath"
      ),
      Parser.create!(
        :name => "Name",
        :xpath => "Xpath"
      )
    ])
  end

  it "renders a list of parsers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Xpath".to_s, :count => 2
  end
end
