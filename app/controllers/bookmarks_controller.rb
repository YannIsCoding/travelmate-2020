class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @activity = Activity.find(params[:activity_id])
    @bookmark.activity = @activity
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to activity_path(@bookmark.activity)
  end
end
