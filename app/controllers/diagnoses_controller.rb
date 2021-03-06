class DiagnosesController < ApplicationController
  def index
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
  end

  def create
    if params[:diagnosis] == nil
      @diagnosis = Diagnosis.new
    else
      @diagnosis = Diagnosis.new(diagnosis_params)
      x = @diagnosis.x_axis + @diagnosis.x_axis1 + @diagnosis.x_axis2
      y = @diagnosis.y_axis + @diagnosis.y_axis1 + @diagnosis.y_axis2
      if x >= 1 && y >= 1
        @diagnosis.result = "友人サポート"
      elsif x >= 1 && y == 0
        @diagnosis.result = "行動チェーン"
      elsif x >= 1 && y <= -1
        @diagnosis.result = "20秒ルール"
      elsif x == 0 && y >= 1
        @diagnosis.result = "行動チェーン"
      elsif x == 0 && y == 0
        @diagnosis.result = "行動チェーン"
      elsif x == 0 && y <= -1
        @diagnosis.result = "行動チェーン"
      elsif x <= -1 && y >= 1
        @diagnosis.result ="未来イメージング"
      elsif x <= -1 && y == 0
        @diagnosis.result = "行動チェーン"
      elsif x <= -1 && y <= -1
        @diagnosis.result = "こつこつプランニング"
      end
    end
    if current_user == nil
    else
      if Diagnosis.all.where(id: current_user.diagnosis_id)
        @delete_diagnosis = Diagnosis.all.where(id: current_user.diagnosis_id)
        @delete_diagnosis.destroy_all
      end
    end
    if @diagnosis.save
      flash[:notice] = "診断が成功しました！"
      if current_user == nil
        redirect_to diagnosis_path(@diagnosis)
      else
        current_user.diagnosis_id = @diagnosis.id
        current_user.save
        redirect_to diagnosis_path(@diagnosis)
      end
    else
      flash[:alert] = "入力に誤りがあります。再度記入してください。"
      redirect_to diagnoses_path
    end
  end

  private
    def diagnosis_params
      params.require(:diagnosis).permit(:x_axis, :x_axis1, :x_axis2, :y_axis, :y_axis1, :y_axis2)
    end
end
