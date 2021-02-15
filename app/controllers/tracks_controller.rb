class TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, only: [:name], include: [
            segments: {only: [:position, :segment_type]}
        ]
    end

    def show
        track = Track.find(params[:id])
        render json: track, only: [:name], include: [
            segments: {only: [:position, :segment_type]}
        ]
    end
end
