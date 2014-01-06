require 'spec_helper'

describe ContactController do

  describe 'get index' do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  
end