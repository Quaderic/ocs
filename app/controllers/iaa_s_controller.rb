class IaaSController < ApplicationController
  
  def index
  end

  def edit
  end

  def show
  end

  def new
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @hwprofiles = client.hardware_profiles
  end

  def create
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @lparams = params[:deals]  
    @img_name = params[:iname]  
    inst = client.create_instance @img_name, :hwp_id => @lparams[:hwp]
    flash[:success] = "VM " + @img_name + "created successfully"
  end

  def update
  end

  def manage
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @instance = client.instance(params[:id])
    flash[:success] = "Image id " + params[:id]
  end
  
  def stop
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @instance = client.instance(params[:id])
    @instance =  @instance.stop! unless @instance.state == 'STOPPED'
    flash[:success] =  @instance.image_id + " stoped successfuly"
    @instance = client.instance(params[:id])
    render iaa_s_manage_path
  end

  def reboot
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @instance = client.instance(params[:id])
    @instance = @instance.reboot! unless @instance.state == 'STOPPED'
    flash[:success] = "Image id " + @instance.image_id+ " restarted successfuly"
    @instance = client.instance(params[:id])
    render iaa_s_manage_path
  end

  def start
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    @instance = client.instance(params[:id])
    @instance = @instance.start! unless @instance.state == 'RUNNING'
    flash[:success] = @instance.image_id + " started successfuly"
    @instance = client.instance(params[:id])
    render iaa_s_manage_path
  end
  
  def run
    # @api_url = "http://localhost:3001/api"
    #client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    # instance = client.instance(params[:id])
    #instance.start!
    #flash[:success] = "Image id " + params[:id] + "started successfuly"
  end
  
  def create_image
  end
  
  def destroy
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    instance = client.instance(params[:id])
    instance.destroy! 
    flash[:success] =  instance.image_id + " destroyed successfuly"
    #render 'index'
  end
  
  def myfriend
    @api_url = "http://localhost:3001/api"
    client = Deltacloud::Client(@api_url, 'mockuser', 'mockpassword') 
    instance = client.instance(params[:id])
    instance.destroy! 
    flash[:success] =  instance.image_id + " destroyed successfuly"
    render 'index'
  end

end
