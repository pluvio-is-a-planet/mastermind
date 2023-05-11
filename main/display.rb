module Display
  def stylize_output(text, style, color = nil, url = nil)
    {
      'underline' => "\e[4m#{text}\e[0m",
      'bright' => "\e[1m#{text}\e[0m",
      'color' => "\e[#{color}m#{text}\e[0m",
      'link' => "\e]8;;#{url}\a#{text}\e]8;;\a"
    }[style]
  end

  def code_color(num)
    {
      '1' => stylize_output('  1  ', 'color', '41;97;1'), # red bg with bright white text
      '2' => stylize_output('  2  ', 'color', '42;97;1'), # green bg with bright white text
      '3' => stylize_output('  3  ', 'color', '43;97;1'), # yellow bg with bright white text
      '4' => stylize_output('  4  ', 'color', '44;97;1'), # blue bg with bright white text
      '5' => stylize_output('  5  ', 'color', '45;97;1'), # magenta bg with bright white text
      '6' => stylize_output('  6  ', 'color', '46;97;1'), # cyan bg with bright white text
    }[num]
  end

  def clue_color(clue)
    {
      '*' => stylize_output("\u25CF ", 'color'), # ●
      '?' => stylize_output("\u25CB ", 'color') # ○
    }[clue]
  end

  def show_code(arr)
    print arr.map { |num| code_color(num) }.join(' ')
  end

  def show_clues(exact, half)
    print '  Clues: '
    exact.times { print clue_color('*') }
    half.times { print clue_color('?') }
    puts ''
  end
end
