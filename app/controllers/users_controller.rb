class UsersController < ApplicationController
  def show
    @user = current_user
    #@bookmarks = @user.bookmarks
    @topics = @user.topics
    #@likes = @user.likes
  end
end
