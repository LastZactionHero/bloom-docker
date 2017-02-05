class BedTemplate
  attr_reader :name, :design_width, :design_height, :zones, :cell

  def initialize(name, design_width, design_height, zones, cell)
    @name = name
    @design_width = design_width
    @design_height = design_height
    @zones = zones
    @cell = cell
  end

  def self.parse_cell(cell_data)
    case cell_data['type']
    when 'CompositeGridCell'
      CompositeGridCell.new(
        cell_data['width_percent'],
        cell_data['height_percent'],
        cell_data['orientation'].to_sym,
        cell_data['children'].map{|c| parse_cell(c)},
        (cell_data['options'] || {})
      )
    when 'PlantGridCell'
      PlantGridCell.new(
        cell_data['width_percent'],
        cell_data['height_percent'],
        Plant.new(
          cell_data['plant']['label'],
          cell_data['plant']['width'],
          cell_data['plant']['horizontal_spacing'],
          cell_data['plant']['vertical_spacing']
        ),
        {'RectPositionPattern' => RectPositionPattern}[cell_data['pattern']],
        (cell_data['options'] || {})
      )
    else
      ArgumentError
    end
  end

  def self.parse(definition)
    cell_data = definition['cell']
    cell = parse_cell(cell_data)

    BedTemplate.new(
      definition['name'],
      definition['design_width'],
      definition['design_height'],
      definition['zones'],
      cell
    )
  end
end