require './lib/ringo'

desc 'Returns a list of the stories currently in development'
task :stories do
  Ringo::Emitter.emit Ringo::Mingle.stories.select { |story| story.status == 'In Dev' }
end

desc 'Gets the story wall from Ready for Dev to In QA'
task :wall do
  STATUSES = ['Ready for Dev', 'In Dev', 'UX Review', 'Ready for QA', 'In QA']
  collect = {}
  stories = Ringo::Mingle.stories

  stories.each do |story|
    next unless STATUSES.include? story.status
    collect[story.status] ||= []
    collect[story.status] << story
  end


  longest = collect.map { |key, value| value.size }.max
  table = []
  (0...longest).each do |index|
    row = {}
    collect.keys.each do |key|
      val = collect[key][index]
      row[key] = val.to_emit(20) if val
    end
    table << row
  end

  Ringo::Emitter.emit_table table, STATUSES
end
