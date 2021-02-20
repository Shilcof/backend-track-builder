Redis.current = Redis.new(url: 'redis://track-builder.herokuapp.com',
    port: 6379,
    db: 0)