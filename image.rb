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

  def blur
    ones = image_manipulation
      @pixel.each_with_index do |row, row_number|
        row.each_with_index do |col, col_number|
          ones.each do |the_row_number, the_col_number|

          if row_number == the_row_number && col_number == the_col_number
            @pixel[row_number - 1][col_number] = 1 unless row_number == 0
            @pixel[row_number + 1][col_number] = 1 unless row_number >= 3
            @pixel[row_number][col_number - 1] = 1 unless col_number == 0
            @pixel[row_number][col_number + 1] = 1 unless col_number >= 3
          end
        end
      end
    end
  end



 def output_image
    @pixel.each do |line|
      puts line.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
puts 
image.blur

image.output_image


