class IncomingMailsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create

  	puts "received email, in the create controller"
  	puts "reply_plain: \n #{params[:reply_plain]}"

  	#extract happiness entry id
  	entry_id = /.*\+([0-9]+)@/.match(params[:envelope][:to])[1]

    entry_to_update = HappinessEntry.find(entry_id)
    
	entry_to_update.description = "#{params[:reply_plain]}"

    # Do some other stuff with the mail message

    if entry_to_update.save
      render :text => 'Success', :status => 200
    else
      render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
    end
  end
end
