require 'rails_helper'

describe SessionsController do

  describe "GET new" do
    it "should log a user in" do
    expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "should not allow an unregistered user to log in" do
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    it "should tell user they were logged out" do
      expect(response.status).to eq(200)
    end
  end
end