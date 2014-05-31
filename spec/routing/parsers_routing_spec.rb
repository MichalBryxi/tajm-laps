require "spec_helper"

describe ParsersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/parsers").to route_to("parsers#index")
    end

    it "routes to #new" do
      expect(:get => "/parsers/new").to route_to("parsers#new")
    end

    it "routes to #show" do
      expect(:get => "/parsers/1").to route_to("parsers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parsers/1/edit").to route_to("parsers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/parsers").to route_to("parsers#create")
    end

    it "routes to #update" do
      expect(:put => "/parsers/1").to route_to("parsers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parsers/1").to route_to("parsers#destroy", :id => "1")
    end

  end
end
