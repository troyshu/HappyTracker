require 'mandrill'

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def self.send_happiness_emails
    puts "sending happiness emails..."
    #m = Mandrill::API.new('xOiHqFbCRGjYDk9I1D1p_g')
    m = Mandrill::API.new

    all_users = User.all()
    all_users.each do |user|
      

      #send email to user
      message = {
       :subject=> "[HappinessTracker] How happy were you today?",
       :from_name=> "HappinessTracker",
       :text=>"Hi there, First, on a scale of 1-10, with 10 being happiest, what was your happiness score today? Second, describe in a few sentences or a paragraph, what made you feel that way?",
       :to=>[
         {
           :email=> "#{user.email}"
         }
       ],
       :html=>"<html><h1>Hi there,</h1><p>First, on a scale of 1-10, with 10 being happiest, what was your happiness score today?</p><p>Second, describe in a few sentences or a paragraph, what made you feel that way?</p></html>",
       :from_email=>"happinesstrackerapp@gmail.com"
      }
      m.messages.send message
      puts "sent email to #{user.email}"
    end
  end
end
