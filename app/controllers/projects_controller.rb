class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :clone]
  before_action :set_project, only: [:save]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new();
    render 'edit'
  end

  def clone
    @project = Project.find(params[:project_id]).clone
    render 'edit'
  end

  def edit
    @project = current_user.projects.find(params[:project_id])
  end

  def save
    @project.source_code = params['code'].strip
    @project.name = params['name']

    image_data = params['imagedata'].gsub('data:image/png;base64,', '')
    @project.picture = image_data.tr('-_', '+/').unpack('m')[0]

    if @project.save
      render json: {success: true, project_id: @project.id}
    else
      render json: {success: false}
    end
  end

  private
  def set_project
    if (params[:project_id].present?)
      @project = current_user.projects.find(params[:project_id])
    else
      @project = Project.new(
          user: current_user,
      );
    end
  end
end
