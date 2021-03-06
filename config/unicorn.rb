worker_processes Integer(ENV["WEB_CONCURRENCY"] || 5)

preload_app true

before_fork do |server, worker|

   Signal.trap 'TERM' do
     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
     Process.kill 'QUIT', Process.pid
   end

   defined?(ActiveRecord::Base) and
     ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
   puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    config = Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = (ENV['DB_REAP_FREQ'] || 10).to_i # seconds
    config['pool']              = (ENV['UNICORN_DB_POOL'] || 1).to_i
    ActiveRecord::Base.establish_connection(config)
  end

end
