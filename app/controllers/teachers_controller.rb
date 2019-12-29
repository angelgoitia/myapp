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

  def delete
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    current_params
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(name: params[:teacher][:name],
                      career: params[:teacher][:career],
                      subject: params[:teacher][:subject])
      
      current_params
    else
      redirect_to '/admin/profesor/'+params[:id]+'/edit'
    end
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
