json.array!(@slides) do |slide|
  json.extract! slide, :id, :image
  json.url slide_url(slide, format: :json)
end
