require 'pry'
require_relative 'classes/developers.rb'
require_relative 'classes/team.rb'

#dev = Developer.new('John')
#junDev = JuniorDeveloper.new('Ori')
#senDev = SeniorDeveloper.new('Matt')

team = Team.new do
  # создаём команду, описываем её в этом блоке

  # описываем, какие в команде есть разработчики
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"

  # описываем в каком порядке выдавать задачи:
  # * сначала любому джуниору
  # * потом любому обычному разработчику
  # * потом любому старшему
  priority :juniors, :developers, :seniors

  # описываем дополнительные действия, когда задача выдана джуну
  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end

  # ...и так можно для любого типа разработчиков описать, например:
  on_task :senior do |dev, task|
    puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать"
  end
end

#binding.pry