class RectPositionPattern < PositionPattern
  def position
    plants_wide = (@width.to_f / (@plant.width_with_horizontal_spacing)).floor
    plants_tall = (@height.to_f / (@plant.width_with_vertical_spacing)).floor

    start_x = ((@width - ((plants_wide - 1) * @plant.horizontal_spacing + plants_wide * @plant.width)) / 2).ceil
    start_y = ((@height - ((plants_tall - 1) * @plant.vertical_spacing + plants_tall * @plant.width)) / 2).ceil

    (0..(plants_wide - 1)).each do |plant_x|
      (0..(plants_tall - 1)).each do |plant_y|
        pos_x = plant_x * @plant.width_with_horizontal_spacing + start_x
        pos_y = plant_y * @plant.width_with_vertical_spacing + start_y
        @grid[pos_y][pos_x] = @plant.label

        ( (pos_x - @plant.width / 2).ceil..(pos_x + @plant.width / 2).floor).each do |width_pos_x|
          @grid[pos_y][width_pos_x] = @plant.label
        end
        ( (pos_y - @plant.width / 2).ceil..(pos_y + @plant.width / 2).floor).each do |width_pos_y|
          @grid[width_pos_y][pos_x] = @plant.label
        end
      end
    end
  end
end

