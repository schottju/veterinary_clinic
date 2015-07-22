class FilesController < ApplicationController
  expose(:user) { User.find(params[:user_id]) }
  expose(:file, attributes: :file_params)
  expose(:files) { File.where(id: params[:user_id]).order(:name).paginate(page: params[:page], per_page: 8) }

  def show
  end

  def index
  end

  def new
  end

  def create
    if file.save
      redirect_to user_files_path(user), notice: 'Zdjęcie zostało pomyślnie utworzone.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if file.update(file_params)
      redirect_to user_files_path(user), notice: 'Zdjęcie zostało pomyślnie edytowane.'
    else
      render :edit
    end
  end

  private

  def file_params
    params.require(:file).permit(:name, :description, :user_id, :image_data, :image)
  end
end
