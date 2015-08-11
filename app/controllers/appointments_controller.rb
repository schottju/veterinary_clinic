class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :show ]
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def veterinarians_appointments
  end
end
