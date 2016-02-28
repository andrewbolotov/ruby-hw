require_relative 'developers.rb'

class Team

  attr_reader :juniors, :developers, :seniors

  def initialize(&block)
    @devs ||= []
    instance_eval &block
    @seniors ||= get_devs_by_type(:senior)
    @developers ||= get_devs_by_type(:developer)
    @juniors ||= get_devs_by_type(:junior)
  end

  def have_seniors(*seniors)
    seniors.map { |sen| @devs << SeniorDeveloper.new(sen) }
  end

  def have_developers(*developers)
    developers.map { |dev| @devs << Developer.new(dev) }
  end

  def have_juniors(*juniors)
    juniors.map { |jun| @devs << JuniorDeveloper.new(jun) }
  end

  def all
    @devs
  end

  def add_task(task, **options)
    task_adder = proc do |task, developer|
        developer.add_task(task)
        if @on_task[developer.type]
          @on_task[developer.type].call(developer, task)
      end
    end

    case 
    when options.has_key?(:to)
      task_adder.call(task, @devs.find{ |dev| dev.name ==  options[:to]})
    when options.has_key?(:complexity)
      task_adder.call(task, @devs.find{ |dev| dev.type == options[:complexity] })
    else
      task_adder.call(task, devs_by_priority.first)
    end
  end

  def report
    devs_by_priority.map {|dev| 
      puts "#{dev.name} (#{dev.type}): #{dev.tasks*", "}"
    }
  end

  private

  def get_devs_by_type(type)
    @devs.select{ |dev| dev.type == type }
  end

  def devs_by_priority
    @devs.sort_by { |dev| 
      [dev.tasks.size, @priority.index(dev.type)] 
    }
  end

  def priority(*priority)
    @priority ||= priority
    @priority.map! { |p| p.to_s.chop.to_sym }
  end

  def on_task(dev_type, &block)
    @on_task ||= {}
    @on_task[dev_type] = block
  end
  
end