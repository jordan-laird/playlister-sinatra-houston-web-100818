class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all 
        erb :"artists/index"
    end

    get '/artists/:id' do
        @artist = Artist.find(params[:id])

        genre_array = []
        @artist.songs.each do |song|
            song.genres.each do |genre|
                genre_array << genre
            end
        end
        @array = genre_array.uniq

        erb :"artists/show"
    end
end
