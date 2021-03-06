class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:sender])
    if @user
      @topic = Topic.find_by(title: params[:subject])
      @url = "http://#{params["body-plain"]}"



      if @topic == nil
        @topic = Topic.create(user: @user, title: params[:subject])
        @topic.save!
      end

      @bookmark = Bookmark.create(url: @url, topic: @topic)
      @bookmark.save!
      head 200
    else
      head 404
    end
      # Find the user by using params[:sender]
      # Find the topic by using params[:subject]
      # Assign the url to a variable after retreiving it from params["body-plain"]

      # Check if user is nil, if so, create and save a new user

      # Check if the topic is nil, if so, create and save a new topic

      # Now that you're sure you have a valid user and topic, build and save a new bookmark


    # Assuming all went well.
    #head 200
  end
end
