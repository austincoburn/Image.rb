class Image
  attr_accessor :pixel

  def initialize(pixel)
    @pixel = pixel
  end

  def image_manipulation
    ones = []
    @pixel.each_with_index do |row, row_number|
    row.each_with_index do |col, col_number|
      if col == 1
        ones << [row_number, col_number]
    end
  end
end
ones
end

  def blur!(blur_distance)
    ones = image_manipulation
      @pixel.each_with_index do |row, row_number|
        row.each_with_index do |col, col_number|
          ones.each do |the_row_number, the_col_number|
            if manhattan_distance(col_number, row_number, the_col_number, the_row_number) <= blur_distance
              @pixel[row_number][col_number] = 1
          end
        end
      end
    end
  end

  def manhattan_distance(x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end


 def output_image
    @pixel.each do |line|
      puts line.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 1, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

image.output_image
puts 
image.blur!(2)

image.output_image


