module TextOutput
  def stylize_output(text, style, color = nil)
    {
      'underline' => "\e[4m#{text}\e[0m",
      'bright' => "\e[1m#{text}\e[0m",
      'color' => "\e[#{color}m#{text}\e[0m"
    }[style]
  end

  def code_color(num)
    {
      '1' => stylize_output('  1  ', 'color', '41;97'), # red bg with bright white text
      '2' => stylize_output('  2  ', 'color', '42;97'), # green bg with bright white text
      '3' => stylize_output('  3  ', 'color', '43;97'), # yellow bg with bright white text
      '4' => stylize_output('  4  ', 'color', '44;97'), # blue bg with bright white text
      '5' => stylize_output('  5  ', 'color', '45;97'), # magenta bg with bright white text
      '6' => stylize_output('  6  ', 'color', '46;97'), # cyan bg with bright white text
    }[num]
  end

  def clue_color(clue)
    {
      '*' => stylize_output("\u25CF", 'color'), # ●
      '?' => stylize_output("\u25CB", 'color'), # ○
      }[clue]
  end
end
