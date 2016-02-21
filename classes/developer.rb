class Developer
  MAX_TASKS = 10

  def initialize(name)
    @name = name
    @tasks = Array.new
  end

  def can_add_task?
    @tasks.count < self.class::MAX_TASKS
  end

  def can_work?
    @tasks.any?
  end

  def status
    if self.class::MAX_TASKS == @tasks.count
      "занят"
    elsif can_work?
      "работаю"
    else
      "свободен"
    end
  end

  def tasks
    @tasks.map.with_index {|task, index| "#{index+1}. #{task}"}
  end

  def add_task(task)
    if self.class::MAX_TASKS == @tasks.count
      raise "Слишком много работы!"
    end
    @tasks << task
    puts "%s: добавлена задача \"%s\". Всего в списке задач: %i" %
      [@name, task, @tasks.count]
  end

  def work_output(task)
    puts "%s: выполнена задача \"%s\". Осталось задач: %i" %
      [@name, task, @tasks.count-1]
  end

  def work!
    if @tasks.empty?
      raise "Нечего делать!"
    end
    work_output(@tasks.first)
    @tasks.shift
  end

end

class JuniorDeveloper < Developer
  MAX_TASKS = 5

  def add_task(task)
    if task.length > 20
      raise "Слишком сложно!"
    end
    super
  end

  def work_output(task)
    puts "%s: пытаюсь делать задачу \"%s\". Осталось задач: %i" %
      [@name, task, @tasks.count-1]
  end

end

class SeniorDeveloper < Developer
  MAX_TASKS = 15

  def work!
    if rand < 0.5
      2.times do
        super
      end
    else
      puts "Что-то лень"
    end
  end

end