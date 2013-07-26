class IncomingMailsController < ApplicationController
  def create


    puts "received email from #{params[:envelope][:from]}"
    render :text => 'Success', :status => 200


  end
end