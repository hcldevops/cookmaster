class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  # Script_dir = '/home/cookmaster/workspace/test/public/scripts'
  # Repo_dir = '/home/cookmaster/workspace/test/public/cookbooks'

  Script_dir = Rails.root.join('public' , 'scripts')
  Repo_dir = Rails.root.join('public' , 'cookbooks')

  def index
    #@recipes = Recipe.all
    @cookbook = Cookbook.find_by_id(params[:cookbook_id])
    @recipes = @cookbook.recipes.all
    
  end


  def show
    @packages = Packages.all
  end

 
  def new
    @cookbook = Cookbook.find_by_id(params[:cookbook_id])
    @recipe = @cookbook.recipes.build
  end

  def edit
  end

 
  def create
    @cookbook = Cookbook.find_by_id(params[:cookbook_id])
    @recipe = @cookbook.recipes.create(recipe_params)
    @cookbook.path = "#{Repo_dir}/#{@cookbook.name}"   

    respond_to do |format|
      if @recipe.save
        system "echo bibinmtech | sudo chef generate recipe #{@cookbook.path} #{@recipe.name.chomp('.rb') } "
        #system "echo bibinmtech | sudo sh #{Script_dir}/upload_cookbook.sh #{@cookbook.name}"
        flash[:success] = "Recipe created"
        format.html { redirect_to @cookbook, notice: 'Recipe was successfully created.' }
        # format.json { render :show, status: :created, location: @current_cookbook }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    # @recipe.destroy
    @cookbook = Cookbook.find_by_id(params[:cookbook_id])
    @recipe = @cookbook.recipes.find(params[:id])
    name = @recipe.name
    @recipe.destroy
    system "echo Admin098 | sudo sh #{Script_dir}/recipe_delete.sh #{@cookbook.path} #{@recipe.name} #{@cookbook.name} #{Repo_dir}"

    respond_to do |format|
      format.html { redirect_to @cookbook, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name,:id)
    end
end
