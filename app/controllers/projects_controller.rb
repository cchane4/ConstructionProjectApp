class ProjectsController < ApplicationController
  before_action :auth_user

  def index
    @projects = if current_user.admin?
                  current_user.company.projects
                else
                  current_user.projects
              end
  end

  def new
    if current_user.admin?
      @project = current_user.projects.new
    else
      redirect to projects_path
    end
  end

  def show
    @project = if current_user.admin?
                 current_user.company.projects.find(params[:id])
                 @unassigned_users = current_user.company.users.where.not(id: @project.users.pluck(:id))
               else
                 @project = current_user.projects.find(params[:id])
               end
    @weather ||= Weather.get_weather(@project.address.zip)
            end

  def create
    @project = current_user.company.projecs.new(projects_params)
    @project.image_url = 'placeholder_projects.photo.jpg'
    if @project.save
      flash[:success] = 'The project was added'
      redirect_to projects_path
    else
      flash[:notice] = 'Check the error messages and try again'
      render :new
    end
  end

  def edit
    @project = current_user.company.projects.find(params[:id])
  end

  def update
    @project = current_user.company.projects.find(params[:id])
    if @project.update(project_params)
      flash[:success] = 'The project was updated'
      redirect_to project_path(@project.id)
    else
      flash[:notice] = 'Check the error messages and try again'
      render :edit
    end
  end

  def destroy
    current_user.company.proejcts.find(params[:id]).destroy
    redirect_to projects_path, notice: 'The project was deleted!'
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      address_attributes: %i[street city state zip]
    )
       end
  end
