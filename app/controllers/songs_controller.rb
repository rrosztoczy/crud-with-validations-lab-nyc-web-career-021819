class SongsController < ApplicationController

    def index
        @songs = Song.all
        render :index
    end

    def show
        @song = Song.find(params[:id])
        render :show
    end

    def new
        @song = Song.new
        render :new
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
        render :edit
    end

    def update
        #how to do update again? How do I see if the updated attributes are valid before the db gets it?
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
