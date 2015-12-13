class UsersController < ApplicationController
  def show
    @topic = Topic.new
  end
end
