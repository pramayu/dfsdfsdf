namespace :search_suggestions do
  desc "Generate search suggestions from location"
  task index: :environment do
    SearchSuggestion.index_books
  end
end