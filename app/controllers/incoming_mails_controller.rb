class IncomingMailsController < ApplicationController
  def create


    puts "received email from #{params[:envelope][:from]}"
    puts "disposable part #{params[:disposable]}"
    
	puts "body: #{params[:plain]}"

    render :text => 'Success', :status => 200


  end
end