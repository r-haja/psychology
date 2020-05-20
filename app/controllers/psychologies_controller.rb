class PsychologiesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_psychology, only: [:edit, :update, :destroy]


  def index
    @psychologies = Psychology.all.order(created_at: :asc)
    @passport =Passport.new
  end

  def new
    @psychology = Psychology.new
  end

  def create
    @psychology = Psychology.new(psychology_params)
    if @psychology.save
      redirect_to psychologies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @psychology.update(psychology_params)
      redirect_to psychologies_path
    else
      render :edit
    end
  end

  def destroy
    @psychology.destroy
    redirect_to psychologies_path
  end

  private
    def set_psychology
      @psychology = Psychology.find_by(id: params[:id])
    end

    def psychology_params
      params.require(:psychology).permit(:title, :discription_image, :psychology_image)
    end
  end
