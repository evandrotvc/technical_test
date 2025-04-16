json.array! @books do |book|
  json.partial! 'books/show', book:
end
