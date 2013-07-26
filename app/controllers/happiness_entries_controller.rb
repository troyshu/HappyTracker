class HappinessEntriesController < ApplicationController
  # GET /happiness_entries
  # GET /happiness_entries.json
  def index
    @happiness_entries = HappinessEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @happiness_entries }
    end
  end

  # GET /happiness_entries/1
  # GET /happiness_entries/1.json
  def show
    @happiness_entry = HappinessEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @happiness_entry }
    end
  end

  # GET /happiness_entries/new
  # GET /happiness_entries/new.json
  def new
    @happiness_entry = HappinessEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @happiness_entry }
    end
  end

  # GET /happiness_entries/1/edit
  def edit
    @happiness_entry = HappinessEntry.find(params[:id])
  end

  # POST /happiness_entries
  # POST /happiness_entries.json
  def create
    @happiness_entry = HappinessEntry.new(params[:happiness_entry])

    respond_to do |format|
      if @happiness_entry.save
        format.html { redirect_to @happiness_entry, notice: 'Happiness entry was successfully created.' }
        format.json { render json: @happiness_entry, status: :created, location: @happiness_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @happiness_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /happiness_entries/1
  # PUT /happiness_entries/1.json
  def update
    @happiness_entry = HappinessEntry.find(params[:id])

    respond_to do |format|
      if @happiness_entry.update_attributes(params[:happiness_entry])
        format.html { redirect_to @happiness_entry, notice: 'Happiness entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @happiness_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /happiness_entries/1
  # DELETE /happiness_entries/1.json
  def destroy
    @happiness_entry = HappinessEntry.find(params[:id])
    @happiness_entry.destroy

    respond_to do |format|
      format.html { redirect_to happiness_entries_url }
      format.json { head :no_content }
    end
  end
end
