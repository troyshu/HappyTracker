class IncomingMailsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create

  	puts "received email, in the create controller"

    Rails.logger.log params[:envelope][:to] # print the to field to the logs
    Rails.logger.log params[:subject] # print the subject to the logs
    Rails.logger.log params[:plain] # print the decoded body plain to the logs if present
    Rails.logger.log params[:html] # print the html decoded body to the logs if present
    Rails.logger.log params[:attachments][0] if params[:attachments] # A tempfile attachment if attachments is populated

    entry_to_update = HappinessEntry.find(params[:disposable])
    
	entry_to_update.description = "#{params[:plain]}"

    # Do some other stuff with the mail message

    if entry_to_update.save
      render :text => 'Success', :status => 200
    else
      render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
    end
  end
end
