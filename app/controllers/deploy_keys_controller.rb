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
    @deploy_key = DeployKey.find_or_create_by(deploy_key_params) do |deploy_key|
      deploy_key.insert_keys(insert_keys_params)
    end

    if @deploy_key.errors.blank?
      flash[:notice] = 'DeployKey was successfully created.'
      redirect_to deploy_keys_url
    else
      render 'new'
    end
  end

  private

  def deploy_key_params
    if params.require(:control).permit(:auto_generate)[:auto_generate] == "0"
      params.require(:deploy_key).permit(:name,:description,:private_key)
    else
      params.require(:deploy_key).permit(:name,:description)
    end
  end

  def insert_keys_params
    unless params.require(:control).permit(:auto_generate)[:auto_generate] != "0"
      params.require(:deploy_key).permit(:private_key)
    end
  end
end
