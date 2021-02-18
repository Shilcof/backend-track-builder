class TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, only: [:id, :name, :creator]
    end

    def show
        track = Track.find(params[:id])
        render json: track, only: [:id, :name, :creator], include: [
            segments: {only: [:position, :segment_type]}
        ]
    end

    def create
        track = Track.new(track_params)
        if track.save
            render json: track, only: [:id, :name, :creator], include: [
                segments: {only: [:position, :segment_type]}
            ]
        else
            render json: {status: "error", code: 4000, message: track.errors.full_messages}
        end
    end

    def update
        track = Track.find(params[:id])
        if track.update(track_params)
            track.reload
            render json: track, only: [:id, :name, :creator], include: [
                segments: {only: [:position, :segment_type]}
            ]
        else
            render json: {status: "error", message: track.errors.full_messages}
        end
    end

    def destroy
        track = Track.find(params[:id])
        render json: track, only: [:id, :name, :creator], include: [
            segments: {only: [:position, :segment_type]}
        ]
    end

    private

    def track_params
        params.require(:track).permit(:name, :creator, segments_attributes: {})
    end
end
