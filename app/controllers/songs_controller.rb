class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all 
        erb :"songs/index"
    end

    get '/songs/new' do
        @genres = Genre.all
        # @artists = Artist.all
        erb :"songs/new"
    end

    get '/songs/:name' do
        @song = Song.find_by_slug(params[:name])
        erb :"songs/show"
    end

    post '/songs' do
        art= Artist.find_or_create_by(name: params[:artist_name])
        art_id = art.id
        Song.create(name: params[:song_name], artist_id: art_id, genre_ids: params[:genres] )
        redirect '/songs'
    end

    get '/songs/:name/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:name])
        erb :"songs/edit"
    end

    patch '/songs/:name' do
        @song = Song.find_by_slug(params[:song_name])
        art= Artist.find_or_create_by(name: params[:artist_name])
        art_id = art.id
        @song.update(name: params[:song_name], artist_id: art_id, genre_ids: params[:genres] )
        redirect "/songs/#{@song.slug}"
    end

    delete '/songs/:name' do 
        @song = Song.find_by_slug(params[:name])
        @song.destroy
        
        redirect "/songs"
    end
end
