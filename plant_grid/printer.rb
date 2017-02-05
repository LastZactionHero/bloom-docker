class Printer
  def initialize(grid)
    @grid = grid
  end

  def draw
    output = ''
    @grid.draw.each do |row|
      output += row.join('')
      output += "\n"
    end
    puts output
  end
end