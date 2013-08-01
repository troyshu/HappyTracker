class IncomingMailsController < ApplicationController
  def create


    #puts "received email from #{params[:envelope][:from]}"
    entry_to_update = HappinessEntry.find(params[:disposable])
    
	entry_to_update.description = "#{params[:plain]}"
	entry_to_update.save

    render :text => 'Success', :status => 200


  end
end