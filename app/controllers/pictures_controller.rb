class PicturesController < ApplicationController
  before_action :set_picture,only: [:show,:edit,:update,:destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        redirect_to pictures_path,notice: 'Successfully posted'
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.save
      redirect_to pictures_path,notice: 'Edited post'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path,notice: 'Deleted post'
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title,:content,:picture,:picture_cache)
  end
end
