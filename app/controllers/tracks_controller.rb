class TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, only: [:id, :name]
    end

    def show
        track = Track.find(params[:id])
        render json: track, only: [:id, :name], include: [
            segments: {only: [:position, :segment_type]}
        ]
    end
end
