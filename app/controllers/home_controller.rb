class HomeController < ApplicationController
  skip_before_action :protected_pages

    def index
      
      render :index
    end
  end