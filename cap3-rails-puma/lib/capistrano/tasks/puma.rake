namespace :puma do
  desc 'Restart your Passenger application'
  task :restart do
    on roles(fetch(:puma_roles)), in: fetch(:puma_restart_runner), wait: fetch(:puma_restart_wait), limit: fetch(:puma_restart_limit) do
      with fetch(:puma_environment_variables) do

        execute fetch(:puma_control_command), 'stop', fetch(:puma_control_options)
        execute fetch(:puma_control_command), 'start', fetch(:puma_control_options)
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :puma_roles, :app
    set :puma_restart_runner, :sequence
    set :puma_restart_wait, 5
    set :puma_restart_limit, 2
    set :puma_restart_with_sudo, false
    set :puma_environment_variables, {}
    set :puma_control_command, '/etc/init.d/puma'
    set :puma_control_options, -> { fetch(:application) }
  end
end

namespace :deploy do
  desc 'Restart your Puma application'
  task :restart do
    invoke('puma:restart')
  end
  after :publishing, :'deploy:restart'
end
