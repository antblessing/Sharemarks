class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      format.html { redirect_to @bookmark, notice: 'Like was successfull.' }
      format.json { render :show, status: :created, location: @bookmark }
    else
      format.html { redirect_to @bookmark }, notice: 'Like failed.'
      format.json { render json: @bookmark.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.destroy
      format.html { redirect_to @bookmark, notice: 'Unliked.' }
      format.json { render :show, status: :created, location: @bookmark }
    else
      format.html { redirect_to @bookmark }
      format.json { render json: @bookmark.errors, status: :unprocessable_entity }
    end
  end
end
