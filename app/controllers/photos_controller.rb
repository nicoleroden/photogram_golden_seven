class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @id = params[:id].to_i
    @p=Photo.find_by({:id => @id})
  end

  def new_form

  end

  def create_row
     @p=Photo.new
     @p.id =Photo.count+1
     @p.source = params[:the_source]
     @p.caption = params[:the_caption]
     @p.created_at=Date.today.to_s
     @p.updated_at=Date.today.to_s
     @p.save

    redirect_to("http://localhost:3000/photos")

  end

  def destroy

    @p=Photo.find_by({:id => params[:id]})
    @p.destroy

    redirect_to("http://localhost:3000/photos")

  end

  def edit_form
      @p=Photo.find_by({:id => params[:id]})
  end

  def update_row

    @p=Photo.find_by({:id => params[:id]})
    @p.source = params[:the_source]
    @p.caption = params[:the_caption]
    @p.updated_at=Date.today.to_s
    @p.save

  redirect_to("http://localhost:3000/photos")

  end
end
