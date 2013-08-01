class IncomingMailsController < ApplicationController
  def create


    #puts "received email from #{params[:envelope][:from]}"
    entry_to_update = HappinessEntry.find(params[:disposable])
    
	entry_to_update.description = "#{params[:plain]}"
	

    if entry_to_update.save
      render :text => 'Success', :status => 200
    else
      render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
    end

  end
end