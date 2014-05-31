require 'spec_helper'

describe "parsers/show", :type => :view do
  before(:each) do
    @parser = assign(:parser, Parser.create!(
      :name => "Name",
      :xpath => "Xpath"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Xpath/)
  end
end
