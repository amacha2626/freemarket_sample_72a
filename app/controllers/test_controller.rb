class TestController < ApplicationController
  def index
    @test = Rails.env.production?
  end
end
