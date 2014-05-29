require 'spec_helper'

describe "posts/new", :type => :view do
  before(:each) do
    assign(:post, Post.new(
      :body => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_body[name=?]", "post[body]"

      assert_select "input#post_image[name=?]", "post[image]"
    end
  end
end
