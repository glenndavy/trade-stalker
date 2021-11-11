class NotesController < ApplicationController
  before_action :instrument, only: %i[ show edit update destroy ]
  before_action :note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = instrument.notes.all
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Instrument.find(params[:instrument_id]).notes.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = instrument.notes.new(note_params)
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to instrument, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @instrument, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def instrument
      @instrument = Instrument.find(note_params[:instrument_id])
    end 

    def note
      @note = instrument.notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      if params[:note] 
        params.require(:note).permit(:id, :body, :instrument_id, :timestamp, :timestamps)
      else
        params.permit(:id, :body, :instrument_id, :timestamp, :timestamps)
      end
    end

   
end
