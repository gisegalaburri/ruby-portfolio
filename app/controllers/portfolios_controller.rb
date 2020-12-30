class PortfoliosController < ApplicationController
  def index
    # MVC 
    # Porfolio.all is calling the model it's inside of the controller and make this available to the view
    @portfolio_items = Portfolio.all
  end
end
