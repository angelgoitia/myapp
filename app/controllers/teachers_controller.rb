class TeachersController < ApplicationController
  before_action :authenticate_user?, only: [:index]
  before_action :authenticate_admin?, only: [:index]
  
  def index
    @teachers = Teacher.all
  end

  # GET Teacher
  def new
    @teacher = Teacher.new
  end
   
  # POST Teacher
  def create
    @teacher = Teacher.new(name: params[:teacher][:name],
                          career: params[:teacher][:career],
                          subject: params[:teacher][:subject])
    
    if @teacher.save 
      current_params
    else
      render :new
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    current_params
  end

  private
  def current_params
    if current_user.role == "admin"
      redirect_to '/admin/profesor/show'
    else
      redirect_to '/users/profesor/show'
    end
  end
end
