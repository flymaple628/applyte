require 'rails_helper'

describe "GET #index" do
  xit "assigns all courses as @courses" do
    get :index, {}, valid_session
    expect(assigns(:courses)).to eq([course])
  end
end