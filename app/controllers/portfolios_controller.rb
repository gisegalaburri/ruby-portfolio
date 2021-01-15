class PortfoliosController < ApplicationController
  # def are methods
  def index
    # MVC 
    # Porfolio.all is calling the model it's inside of the controller and make this available to the view
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
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

  def edit
    # it will find the portfolio by id in the db and render in the view
    @portfolio_item = Portfolio.find(params[:id])
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    # need to call the find
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  # destroy -> reserved word
  # doesn't need a view
    # DELETE /portfolio/1
  # DELETE /portfolio/1.json
  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The record was removed.' }
    end
  end
end
