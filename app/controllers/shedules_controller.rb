class ShedulesController < ApplicationController
    def index
        @shedules = Shedule.all
    end

    def select
        @shedule = Shedule.new(user_id: current_user.id, teacher_id: params[:id])
        if @shedule.save
            redirect_to '/users/horario/show'
        else
            render :index
        end
    end
end
