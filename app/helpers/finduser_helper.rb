module FinduserHelper

  def find_user
    @user = User.find_by(id: params[:id])
  end

end 