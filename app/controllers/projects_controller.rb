class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def save
    image_data =  params['imagedata'].gsub('data:image/png;base64,','')
    p = Project.new(
         user: current_user,
         source_code: params['code']
    );
    p.picture =  image_data.tr('-_','+/').unpack('m')[0]
    if p.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end
