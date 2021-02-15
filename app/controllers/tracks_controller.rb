class TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, include: [:segments]
    end

    def show
        track = Track.find(params[:id])
        render json: track, include: [:segments]
    end
end
