class ProjectsController < ApplicationController
  respond_to :html, :xml, :json

  before_filter :load_templates, :only => [:new, :create, :edit, :update]
  before_filter :ensure_admin, :only => [:new, :edit, :destroy, :create, :update]

  # GET /projects/dashboard
  def dashboard
    @deployments = Deployment.order('created_at DESC').limit(10).all
    respond_with(@deployments)
  end

  # GET /projects
  def index
    @projects = Project.order('name ASC').all
    respond_with(@projects)
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
    respond_with(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
    respond_with(@project) do |format|
      format.html do
        if load_clone_original
          @project.prepare_cloning(@original)
          render :action => 'clone'
        end
      end
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    respond_with @project
  end

  # POST /projects
  def create
    @project = Project.unscoped.where(params[:project]).first_or_create
    @project.clone(@original) if load_clone_original
    @project.save

    flash[:notice] = 'Project was successfully created.'
    respond_with(@project, :location => @project)
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.update project_params
      flash[:notice] = 'Project was successfully updated.'
      respond_with(@project, :location => @project)
    else
      respond_with(@project)
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, :notice => 'Project was successfully deleted.'
  end

private

  def project_params
    params.require(:project).permit(:name, :template)
  end

  def load_templates
    @templates = ProjectConfiguration.templates.sort.collect do |key, val|
      [key.to_s.titleize, key.to_s]
    end

    @template_infos = ProjectConfiguration.templates.collect do |key, val|
      [key.to_s, val::DESC]
    end
  end

  def load_clone_original
    if params[:clone]
      @original = Project.unscoped.find(params[:clone])
    else
      false
    end
  end
end
