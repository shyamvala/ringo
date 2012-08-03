module Ringo
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'ringo/tasks.rb'
    end
  end
end
