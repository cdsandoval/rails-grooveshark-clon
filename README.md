# Rails Grooveshark Clon

## Team

- Marieth
- Brayan
- Cesar
- Jefferson
- Jonathan

## Routes

### /api

    #### /songs

    | # | type | route | description |
    |:-:|:---- |:----------- |:------|
    | 1 | ```GET``` | ```/songs``` | list all songs |
    | 2 | ```GET``` | ```/songs/search?title``` | list all songs founded by :title |
    | 3 | ```GET``` | ```/songs/:id``` | list songs's details by :id |
    | 4 | ```GET``` | ```/songs/:id/albums``` | list all albums where a song with a specific id belongs |
    | 5 | ```GET``` | ```/songs/:id/artists``` | list all artists who sing a song with a specific id |
    | 6 | ```PUT``` | ```/songs/:id/progress``` | update the field progress of a song with a specific id|
    | 7 | ```PUT``` | ```/songs/:id/rating``` | update the field rating of a song with a specific id|

### /admin

    #### /songs

    | # | type | route | description |
    |:-:|:---- |:----------- |:------|
    | 1 | ```GET``` | ```/songs``` | list all songs as table in a web page |
    | 2 | ```GET``` | ```/songs/:id``` | list songs's details by :id in a web page |
    | 3 | ```GET``` | ```/songs/new``` | view to create a new song |
    | 3 | ```POST``` | ```/songs``` | adds song to database and redirect to the page /songs |
    | 4 | ```DELETE``` | ```/users/:id``` | deletes user by :id |
    | 5 | ```PUT``` | ```/users/:id``` | overwrites user's data by :id **(1)** |
    | 6 | ```GET``` | ```/users/:id/channels``` | list all channels created by user :id |
