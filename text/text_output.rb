module TextOutput
  def stylize_output(text, style, color = nil)
    {
      'underline' => "\e[4m#{text}\e[m",
      'bright' => "\e[1m#{text}\e[m",
      'color' => "\e[#{color};1m#{text}\e[m"
    }[style]
  end
end
