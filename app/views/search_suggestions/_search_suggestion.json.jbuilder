json.extract! search_suggestion, :id, :term, :popularity, :created_at, :updated_at
json.url search_suggestion_url(search_suggestion, format: :json)