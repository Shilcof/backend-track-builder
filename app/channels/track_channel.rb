class TrackChannel < ApplicationCable::Channel
    def subscribed
        stream_from("tracks")
    end
    def receive(data)
        ActionCable.server.broadcast("tracks", content: data)
    end
    def unsubscribed
        stop_all_streams
    end
end