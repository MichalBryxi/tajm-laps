require 'spec_helper'

describe "Parsers", :type => :request do
  describe "GET /parsers" do
    it "works! (now write some real specs)" do
      get parsers_path
      expect(response.status).to be(200)
    end
  end
end
