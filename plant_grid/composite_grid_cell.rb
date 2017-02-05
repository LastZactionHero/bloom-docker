require 'pry'
class CompositeGridCell < GridCell
  def initialize(width_percent, height_percent, direction, cells)
    super(width_percent, height_percent)

    @direction = direction
    @cells = cells
  end

  def draw
    grid = []
    case @direction
    when :vertical
      @cells.each do |cell|
        grid += cell.draw
      end
    when :horizontal
      @cells.each do |cell|
        grid += cell.draw.transpose
      end
      grid = grid.transpose
    else
      raise ArgumentError
    end

    grid
  end

  def set_dimensions(width, height)
    super(width, height)

    case @direction
    when :vertical
      raise ArgumentError unless @cells.map(&:height_percent).reduce(:+) == 1.0 # Make sure the cells add up to 100%
      @cells.each do |cell|
        raise ArgumentError unless cell.width_percent == 1.0 # Make sure each cell covers the entire width
        cell.set_dimensions(@width, (@height * cell.height_percent).round)
      end
    when :horizontal
      raise ArgumentError unless @cells.map(&:width_percent).reduce(:+) == 1.0 # Make sure the cells add up to 100%
      @cells.each do |cell|
        raise ArgumentError unless cell.height_percent == 1.0 # Make sure each cell covers the entire width
        cell.set_dimensions((@width * cell.width_percent).round, @height)
      end
    else
      raise ArgumentError
    end
  end

end