require "set"

class Direction
  attr_accessor :left, :right
  attr_reader :x_change, :y_change, :name

  def initialize(name, x_change, y_change)
    @name = name
    @x_change = x_change
    @y_change = y_change
  end

  def adjust_coordinates(coords)
    x, y = coords
    [x + x_change, y + y_change]
  end
end

class Robot
  attr_accessor :coordinates, :facing
  attr_reader :visited

  def initialize
    @facing = starting_direction
    @coordinates = [0, 0]
    @visited = Set.new([coordinates])
  end

  def move(command)
    if command == "L"
      self.facing = facing.left
    elsif command == "R"
      self.facing = facing.right
    elsif command == "G"
      @moved = true
      return move_forward
    end

    nil
  end

  def move_forward
    new_coordinates = facing.adjust_coordinates(coordinates)

    if visited.include? new_coordinates
      @in_circle = true
    else
      self.coordinates = new_coordinates
      log_coordinates
    end
  end

  def in_circle?
    @moved.nil? || @in_circle
  end

  private

  def log_coordinates
    visited << coordinates
  end

  def starting_direction
    north = Direction.new("North", 0, 1)
    west = Direction.new("West", -1, 0)
    east = Direction.new("East", 1, 0)
    south = Direction.new("South", 0, -1)

    north.left = west
    north.right = east

    west.left = south
    west.right = north

    south.left = east
    south.right = west

    east.right = south
    east.left = north

    north
  end
end

def detect_circle(commands)
  robot = Robot.new

  result = commands.chars.detect do |command|
    puts "Robot coords: #{robot.coordinates}"
    robot.move(command)
    robot.in_circle?
  end

  result ? "YES" : "NO"
end

test = "L"
puts "expect test one: #{test} to equal YES, got: #{detect_circle(test)}"

test = "GRGL"
puts "expect test two: #{test} to equal NO, got: #{detect_circle(test)}"

test = "GRGRGRGRGRGRGRGRGRGRGR"
puts "expect test three: #{test} to equal YES, got: #{detect_circle(test)}"

