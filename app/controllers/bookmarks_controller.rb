class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    #bookmark params
    @bookmark = Bookmark.new(bookmark_params)
    # we need the id of the list
    @list = List.find(params[:list_id])
    #associating the @list with the @bookmark
    @bookmark.list = @list
    # save if valid
    if @bookmark.save
    # redirect
     redirect_to list_path(@list)
    # otherwise render the form
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end
  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
