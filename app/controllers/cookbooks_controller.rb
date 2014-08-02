

class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]
  Script_dir = '/home/cookmaster/sites/cookmaster/public/scripts'
  Repo_dir = '/home/cookmaster/sites/cookmaster/public/cookbooks'
  # Cookbook_path = 'RAILS.ROOT'
  

  def index
    @cookbooks = Cookbook.all
  end

  def new
    @cookbook = Cookbook.new
  end

  def list
    
    @cookbooks = Cookbook.all
    if !signed_in?
      redirect_to root_url
    end
  end

  def show

	# @cookbook = Cookbook.new
  @cookbook = Cookbook.find(params[:id])
  @recipes = @cookbook.recipes.all
  # @cookbooks = Cookbook.all
  
  

  	if !signed_in?
  		redirect_to root_url
  	end
  end

def create

    @cookbook = Cookbook.new(cookbook_params)
    system "echo Admin098 | sudo sh #{Script_dir}/create_cookbook.sh #{@cookbook.name} #{Repo_dir}"
    @cookbook.path = "#{Repo_dir}/#{@cookbook.name}"
    
    respond_to do |format|
      if @cookbook.save
        # system "echo Admin098 | sudo x-terminal-emulator -e /home/tyagi/scripts/upload_cookbook.sh #{@cookbook.name}"
        
        format.html { redirect_to @cookbook, notice: 'Cookbook was successfully created.' }
        format.json { render :show, status: :created, location: @cookbook }
      else
        format.html { redirect_to cookbooks_url, notice: 'Cookbook with same name already exists.' }
        format.json { head :no_content }
        # format.html { render :new }
        # format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
    

  end

  def destroy
    @cookbook.destroy
    system "echo Admin098 | sudo rm -rf #{Repo_dir}/#{@cookbook.name}"
    system "echo Admin098 | sudo sh #{Script_dir}/delete_cookbook.sh #{@cookbook.name}"
    respond_to do |format|
      format.html { redirect_to cookbooks_url, notice: 'Cookbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def search
  @scookbook = Cookbook.search params[:search]
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookbook_params
      params.require(:cookbook).permit(:name)
      # params.require(:recipe).permit(:id)
    end

end
