require 'pry'
require_relative 'classes/developer.rb'

dev = Developer.new('John')
junDev = JuniorDeveloper.new('Ori')
senDev = SeniorDeveloper.new('Matt')

binding.pry