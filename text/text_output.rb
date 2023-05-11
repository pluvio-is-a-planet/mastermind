module TextOutput
  def stylize_output(text, style, color = nil)
    {
      'underline' => "\e[4m#{text}\e[m",
      'bright' => "\e[1m#{text}\e[m",
      'color' => "\e[#{color};1m#{text}\e[m"
    }[style]
  end

  def code_color(num)
    {
      '1' => stylize_output('  1  ', 'color', '41;37'),
      '2' => stylize_output('  2  ', 'color', '42;37'),
      '3' => stylize_output('  3  ', 'color', '43;30'),
      '4' => stylize_output('  4  ', 'color', '44;37'),
      '5' => stylize_output('  5  ', 'color', '45;30'),
      '6' => stylize_output('  6  ', 'color', '46;30'),
    }[num]
  end
end
