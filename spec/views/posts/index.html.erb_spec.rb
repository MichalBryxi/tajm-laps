require 'spec_helper'

describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :body => "Body",
        :image => "Image"
      ),
      Post.create!(
        :body => "Body",
        :image => "Image"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
