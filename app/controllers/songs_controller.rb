class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all 
        erb :"songs/index"
    end

    get '/songs/new' do
        erb :"songs/new"
    end

    get '/songs/:name' do
        @song = Song.find_by_slug(params[:name])
        erb :"songs/show"
    end

    post '/songs' do
        Song.create(params[:song])
        redirect '/songs'
    end

    get '/songs/:name/edit' do
        @song = Song.find_by_slug(params[:name])
        erb :"songs/edit"
    end

    patch '/songs/:name' do
        @song = Song.find_by_slug(params[:name])
        @song.update(params[:song])
        redirect "/songs/#{@song.slug}"
    end

    delete '/songs/:name' do 
        @song = Song.find_by_slug(params[:name])
        @song.destroy
        
        redirect "/songs"
    end
end
