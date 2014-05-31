json.array!(@parsers) do |parser|
  json.extract! parser, :id, :name, :xpath
  json.url parser_url(parser, format: :json)
end
