json.array!(@my_girlfriends) do |my_girlfriend|
  json.extract! my_girlfriend, :id, :name, :hometown, :favorite_food, :where_we_met, :what_turns_me_on
  json.url my_girlfriend_url(my_girlfriend, format: :json)
end
