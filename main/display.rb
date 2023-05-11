module Display
  def show_code(arr)
    result = arr.map { |num| code_color(num) }.join(' ')
  end
end
