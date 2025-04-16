json.id book.id
json.title book.title

json.status book.status
json.email book.email
json.created_at book.created_at.iso8601
json.updated_at book.updated_at.iso8601

json.author do
  json.id book.author.id
  json.name book.author.name
  json.age book.author.age
end
