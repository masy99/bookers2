class HomeController < ApplicationController
  def index
  	@Books = Book.new
  end

  def about
  end

end
