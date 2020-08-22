class PicturesController < ApplicationController
  before_action :set_picture,only: [:show,:edit,:update,:destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path,notice: 'Successfully posted'
      else
        render :new
      end
    end
  end

  def show
    @picture = current_user.pictures.build(picture_params)
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
    @picture = Picture.new
    render :new if @picture.invalid?
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def set_picture
    params.require(:picture).permit(:title,:content,:picture,:picture_cashe)
  end
end
