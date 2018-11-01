class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all 
        
        erb :"artists/index"
    end

    get '/artists/:name' do
        @artist = Artist.find_by_slug(params[:name])

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
