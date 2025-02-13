Resque.redis = Redis.new(
  url: ENV['REDIS_URL'],
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE },
  reconnect_attempts: 5,
  reconnect_delay: 0.5,
  reconnect_delay_max: 5.0,
  connect_timeout: 5,
  read_timeout: 3,
  write_timeout: 3,
  tcp_keepalive: 60,
  timeout: 300
)

if ENV["RESQUE_NAMESPACE"].present?
  Resque.redis.namespace = ENV["RESQUE_NAMESPACE"].to_sym
end