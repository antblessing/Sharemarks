class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    respond_to do |format|
      if like.save
        format.html { redirect_to :back, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { redirect_to :back, notice: 'Like failed.' }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark: @bookmark)
    respond_to do |format|
      if like.destroy
        format.html { redirect_to :back, notice: 'Unliked.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { redirect_to :back }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end
end
