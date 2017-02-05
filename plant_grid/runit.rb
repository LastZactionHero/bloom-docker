require './bed_template'
require './position_patterns/position_pattern'
require './position_patterns/rect_position_pattern'
require './plant'
require './grid'
require './grid_cell'
require './composite_grid_cell'
require './plant_grid_cell'
require './printer'
require 'json'

# Modern/Linear A
# cell_a = PlantGridCell.new(1.0, 0.6, Plant.new('A', 3, 2, 2), RectPositionPattern)
# cell_b = PlantGridCell.new(1.0, 0.4, Plant.new('B', 2, 1, 1), RectPositionPattern)
# cell_composite = CompositeGridCell.new(1.0, 1.0, :vertical, [cell_a, cell_b])

# Modern/Linear B
# cell_a = PlantGridCell.new(0.3, 1.0, Plant.new('A', 2, 6, 2), RectPositionPattern)
# cell_b = PlantGridCell.new(0.4, 1.0, Plant.new('B', 3, 12, 3), RectPositionPattern)
# cell_c = PlantGridCell.new(0.3, 1.0, Plant.new('A', 2, 6, 2), RectPositionPattern)
# cell_composite = CompositeGridCell.new(1.0, 1.0, :horizontal, [cell_a, cell_b, cell_c])

definition = {
  name: 'Modern/Linear C',
  design_width: 360,
  design_height: 72,
  zones: ['5'],
  cell: {
    type: 'CompositeGridCell',
    width_percent: 1.0,
    height_percent: 1.0,
    orientation: :horizontal,
    children: [
      {
        type: 'CompositeGridCell',
        width_percent: 0.3,
        height_percent: 1.0,
        orientation: :vertical,
        children: [
          {
            type: 'PlantGridCell',
            width_percent: 1.0,
            height_percent: 0.6,
            plant: {
              label: 'A',
              width: 3,
              horizontal_spacing: 3,
              vertical_spacing: 3
            },
            pattern: 'RectPositionPattern',
            options: {}
          },
          {
            type: 'PlantGridCell',
            width_percent: 1.0,
            height_percent: 0.4,
            plant: {
              label: 'B',
              width: 2,
              horizontal_spacing: 2,
              vertical_spacing: 2
            },
            pattern: 'RectPositionPattern',
            options: {}
          }
        ],
        options: {}
      },
      {
        type: 'PlantGridCell',
        width_percent: 0.7,
        height_percent: 1.0,
        plant: {
          label: 'C',
          width: 4,
          horizontal_spacing: 4,
          vertical_spacing: 2
        },
        pattern: 'RectPositionPattern',
        options: {}
      }
    ],
    options: {}
  }
}
json = definition.to_json

template = BedTemplate.parse(JSON.parse(json))

# Modern/Linear C
# cell_a = PlantGridCell.new(1.0, 0.6, Plant.new('A', 3, 3, 3), RectPositionPattern)
# cell_b = PlantGridCell.new(1.0, 0.4, Plant.new('B', 2, 2, 2), RectPositionPattern)
# cell_composite_sub = CompositeGridCell.new(0.3, 1.0, :vertical, [cell_a, cell_b])
# cell_c = PlantGridCell.new(0.7, 1.0, Plant.new('C', 4, 4, 2), RectPositionPattern)
# cell_composite = CompositeGridCell.new(1.0, 1.0, :horizontal, [cell_composite_sub, cell_c])

# With a minimum height
# cell_a = PlantGridCell.new(1.0, 0.6, Plant.new('A', 3, 2, 2), RectPositionPattern)
# cell_b = PlantGridCell.new(1.0, 0.4, Plant.new('B', 2, 1, 1), RectPositionPattern, {min_height: 10})
# cell_composite = CompositeGridCell.new(1.0, 1.0, :vertical, [cell_a, cell_b])

# With a minimum width
# cell_a = PlantGridCell.new(0.3, 1.0, Plant.new('A', 2, 6, 2), RectPositionPattern, {min_width: 24})
# cell_b = PlantGridCell.new(0.4, 1.0, Plant.new('B', 3, 12, 3), RectPositionPattern)
# cell_c = PlantGridCell.new(0.3, 1.0, Plant.new('A', 2, 6, 2), RectPositionPattern)
# cell_composite = CompositeGridCell.new(1.0, 1.0, :horizontal, [cell_a, cell_b, cell_c])

grid = Grid.new(template.cell, 120, 10)
printer = Printer.new(grid)
printer.draw