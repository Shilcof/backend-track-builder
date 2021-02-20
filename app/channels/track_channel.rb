class TrackChannel < ApplicationCable::Channel
    def subscribed
        # stop_all_streams
        stream_from(params[:id])
    end

    def receive(data)
        ActionCable.server.broadcast(params[:id], {content: data})
    end

    def unsubscribed
        stop_all_streams
    end
end