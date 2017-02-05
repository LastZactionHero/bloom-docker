class Plant
  attr_reader :label, :width, :horizontal_spacing, :vertical_spacing

  def initialize(label, width, horizontal_spacing, vertical_spacing)
    @label = label
    @width = width.to_f

    @horizontal_spacing = horizontal_spacing.to_f
    @vertical_spacing = vertical_spacing.to_f
  end

  def width_with_horizontal_spacing
    @width + @horizontal_spacing
  end

  def width_with_vertical_spacing
    @width + @vertical_spacing
  end
end