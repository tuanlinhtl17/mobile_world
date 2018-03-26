Sidekiq.configure_server do |config|
  config.redis = { namespace: "mobile_world_sidekiq", url: "redis://localhost:6379/2"}
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "mobile_world_sidekiq", url: "redis://localhost:6379/2"}
end
