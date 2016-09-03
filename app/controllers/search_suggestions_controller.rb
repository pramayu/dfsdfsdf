class SearchSuggestionsController < ApplicationController
  before_action :set_search_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /search_suggestions
  # GET /search_suggestions.json
  def index
    # @search_suggestions = SearchSuggestion.all
    render json: SearchSuggestion.terms_for(params[:term])
  end

  # GET /search_suggestions/1
  # GET /search_suggestions/1.json
  def show
  end

  # GET /search_suggestions/new
  def new
    @search_suggestion = SearchSuggestion.new
  end

  # GET /search_suggestions/1/edit
  def edit
  end

  # POST /search_suggestions
  # POST /search_suggestions.json
  def create
    @search_suggestion = SearchSuggestion.new(search_suggestion_params)

    respond_to do |format|
      if @search_suggestion.save
        format.html { redirect_to @search_suggestion, notice: 'Search suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @search_suggestion }
      else
        format.html { render :new }
        format.json { render json: @search_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_suggestions/1
  # PATCH/PUT /search_suggestions/1.json
  def update
    respond_to do |format|
      if @search_suggestion.update(search_suggestion_params)
        format.html { redirect_to @search_suggestion, notice: 'Search suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_suggestion }
      else
        format.html { render :edit }
        format.json { render json: @search_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_suggestions/1
  # DELETE /search_suggestions/1.json
  def destroy
    @search_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to search_suggestions_url, notice: 'Search suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_suggestion
      @search_suggestion = SearchSuggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_suggestion_params
      params.require(:search_suggestion).permit(:term, :popularity)
    end
end
