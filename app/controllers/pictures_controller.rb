class PicturesController < ApplicationController
  expose(:user) { User.find(params[:user_id]) }
  expose(:picture, attributes: :picture_params)
  expose(:pictures) { user.pictures.order(:name).paginate(page: params[:page], per_page: 8) }

  def show
  end

  def index
    if params[:search]
      self.pictures = Picture.search(params[:search], params[:user_id]).order(:created_at).paginate(page: params[:page], per_page: 8)
    end
  end

  def new
  end

  def create
    if picture.save
      redirect_to user_pictures_path(user), notice: 'Zdjęcie zostało pomyślnie utworzone.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if picture.save
      redirect_to user_pictures_path(user), notice: 'Zdjęcie zostało pomyślnie edytowane.'
    else
      render :edit
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :description, :user_id, :image_data, :image)
  end
end
