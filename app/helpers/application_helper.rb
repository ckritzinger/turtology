module ApplicationHelper
  def edit_or_clone_path_for(project)
    if(project.user == current_user)
      edit_project_path(project.id)
    else
      clone_project_path(project.id)
    end
  end
end
