#Made with scaffold
class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #before_action evita la repeticion de codigo, o sea, repite el codigo del metodo set_blog en show, edit, update, destroy -> entre [] se indica en qué metodos se usa el metodo set_blog y only 

  # index, show, new, create, update & destroy are reserved word inside Rails Controller


  # Controller for the blogs page
  # GET /blogs
  # GET /blogs.json
  # I can change how many blog posts to show using Blog.limit(n)
  def index
    @blogs = Blog.all
  end

  #Shows the especific blog post
  # It doesn't have any data, lets see line 2 -> the "before_action" -> it call the methods listed -> see now set_blog method
  #Conectd to set_blog
  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  #Instancia un nuevo blog
  #Muestra el formulario para crear uno, new conecta con create
  #Connected with create post method
  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # Connected to update, post method
  # GET /blogs/1/edit
  def edit
  end

  # Creates blogs
  # POST /blogs
  # POST /blogs.json
  def create
    #Takes the form parameters
    @blog = Blog.new(blog_params)

    respond_to do |format|
      #Si es valido
      if @blog.save
        #Formatea el html y redirreciona al usuario (show page)
        #notice -> muestra el mensaje en la vista
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
        #json no se usa, se puede borrar
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      # I can change the showed content that is between '' 
      format.html { redirect_to blogs_url, notice: 'The post was removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      # this is shows the blogs, is like this code where written in show method
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # it has the blog params, it make the submited info in the form available for the others methods
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
