class PortfoliosController < ApplicationController
  # def are methods
  def index
    # MVC 
    # Porfolio.all is calling the model it's inside of the controller and make this available to the view
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

   # Creates portfolios
  # POST /portfolios
  # POST /portfolios.json
  def create
    #Takes the form parameters
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    # permit -> this are strong parameters

    respond_to do |format|
      #Si es valido
      if @portfolio_item.save
        #Formatea el html y redirreciona al usuario (show page)
        #notice -> muestra el mensaje en la vista
        # portfolios_path redirect to the full list 
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
        #json no se usa, se puede borrar
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end
end
