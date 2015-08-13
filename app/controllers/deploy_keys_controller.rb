# coding: utf-8

class DeployKeysController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :ensure_admin, :only => [:new, :edit, :destroy, :create, :update]

  # GET /deploy_keys
  def index
    @deploy_keys = DeployKey.order('name ASC').all
    respond_with(@deply_keys)
  end

  # GET /deploy_keys/:id
  def show
  end

  # GET /deploy_keys/new
  def new
    @deploy_key = DeployKey.new
    respond_with(@deploy_key)
  end

  # POST /deploy_keys
  def create
    @deploy_key = DeployKey.unscoped.where(deploy_key_params).first_or_create

    if @deploy_key
      flash[:notice] = 'DeployKey was successfully created.'
      redirect_to deploy_keys_url
    else
      render 'new'
    end
  end

  private

  def deploy_key_params
    params.require(:control)
    params.require(:deploy_key).permit(:name, :description, :secret_key, :public_key, :auto_generate)
  end

end
