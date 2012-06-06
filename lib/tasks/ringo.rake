desc 'Returns a list of the stories currently in development'
require './lib/ringo'
task :stories do
  Ringo::Emitter.emit Ringo::Mingle.stories
end
