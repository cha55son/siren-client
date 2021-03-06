class TestServer < Sinatra::Base
  get '/?' do
    <<-EOF
      {
        "properties": {
          "page": 1,
          "name": "Test 1"
        },
        "links": [
          {
            "rel": ["self"],
            "href":"#{@@url}/"
          },
          {
            "rel": ["collection", "concepts"],
            "href":"#{@@url}/concepts",
            "title": "Concepts"
          },
          {
            "rel": ["collection", "concepts with spaces"],
            "href":"#{@@url}/concepts",
            "title": "Concepts"
          },
          { "rel": ["messages", "collection"],
            "href": "#{@@url}/messages",
            "title":"Messages"
          }
        ],
        "actions": [
          {
            "name":"filter-concepts-get",
            "method":"GET",
            "href":"#{@@url}/concepts",
            "title":"Get an optionally filtered list of Concepts",
            "type":"application/x-www-form-urlencoded",
            "fields":[
              {
                "name":"limit",
                "title":"Max number of results in each page",
                "type":"number"
              },
              {
                "name":"page",
                "title":"Page number, starting at 1",
                "type":"number"
              },
              {
                "name":"search",
                "title":"Keyword search on concept text",
                "type":"text"
              }
            ]
          },
          {
            "name": "delete-concept",
            "method": "DELETE",
            "href": "#{@@url}/concepts",
            "title": "Delete a concept",
            "type": "application/x-www-form-urlencoded",
            "fields": [{
              "name": "id",
              "title": "ID of the concept to delete.",
              "type": "text"
            }]
          },
          {
            "name":"filter-concepts-post",
            "method":"POST",
            "href":"#{@@url}/concepts",
            "title":"Get an optionally filtered list of Concepts",
            "type":"application/x-www-form-urlencoded",
            "fields":[
              {
                "name":"limit",
                "title":"Max number of results in each page",
                "type":"number"
              },
              {
                "name":"page",
                "title":"Page number, starting at 1",
                "type":"number"
              },
              {
                "name":"search",
                "title":"Keyword search on concept text",
                "type":"text"
              }
            ]
          },
          { "name": "filter concepts post with spaces" }
        ]
      }
    EOF
  end
end
