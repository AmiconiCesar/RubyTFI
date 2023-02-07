class SessionsController < ApplicationController
    skip_before_action :protected_pages
    
    def new
    end
  
    def create
        @user = User.find_by(username: params[:username])

        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to home_path, notice: "Ha ingresado correctamente ✅"
        else
            redirect_to new_session_path, alert: "Datos invalidos 🚫" 
        end
    end    

    def destroy
        session.delete(:user_id)
        p Current.user
        redirect_to new_session_path, notice: "Ha cerrado la sesión correctamente ✅"
    end

end    