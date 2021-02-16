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

    def create
        byebug
        track = Track.new(track_params)
        if track.save
            render json: track, only: [:id, :name], include: [
                segments: {only: [:position, :segment_type]}
            ]
        else
        end
    end

    private

    def track_params
        params.require(:track).permit(:name, segments_attributes: {})
    end
end
