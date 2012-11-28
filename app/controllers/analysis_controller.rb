# statistics_controller.rb

class AnalysisController < ApplicationController
  before_filter :connect_db #, :except =>[:index]

  def index

  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end