class ShedulesController < ApplicationController
    def index
        @shedules = Shedule.all
    end

    def select
        @shedule = Shedule.new(user_id: current_user.id, teacher_id: params[:id])
        @shedule.save
        redirect_to '/users/horario/show'
    end
end
