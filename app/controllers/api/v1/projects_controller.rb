class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user_from_token!

  def index
    projects = Project.all
    render json: projects
  end
  

  def create
    project = current_user.projects.new(project_params)
    project.save
    render json: project
  end

  def show
    project = Project.last
    render json: project
  end

  private
  def project_params
    params.require(:project).permit(:title)
  end
end
