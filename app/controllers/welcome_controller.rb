class WelcomeController < ApplicationController
  def home
    @systems = System.all
  end
end
