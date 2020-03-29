class PassportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @passport = Passport.find_by(id: params[:id])
  end

  def new
    #毎回パスポートデータが消される。
    @user = User.find(params[:user_id])
    @passport = @user.build_passport
  end

  def create
    passport = current_user.build_passport(passport_params)
    if passport.save
      flash[:notice] = "習慣化パスポートを保存しました！"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

private
  def passport_params
    params.require(:passport).permit(:purpose ,:goal, :passport_image)
  end
end
