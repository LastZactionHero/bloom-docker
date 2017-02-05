class GridCell
  attr_reader :width_percent, :height_percent

  def initialize(width_percent, height_percent)
    @width_percent = width_percent
    @height_percent = height_percent

    @width = nil
    @height = nil
  end

  def draw
    raise RuntimeError
  end

  def set_dimensions(width, height)
    @width = width
    @height = height
  end
end