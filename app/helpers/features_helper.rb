module FeaturesHelper
  
  GREEN  = [0,   255, 0]
  YELLOW = [255, 255, 0]
  RED    = [255, 0,   0]

  def priority_to_color(priority)
    if priority <= 0
      "#808080"
    elsif priority > 0 and priority <= 500
      integer_to_color(priority, GREEN, YELLOW, 500)
    elsif priority > 500 and priority <= 1000
      integer_to_color(priority - 501, YELLOW, RED, 500)
    elsif priority > 1000
      "#F00"
    end
  end

private

  def integer_to_color(value, start_color, end_color, range)
    r = start_color[0] + mul_div(value, end_color[0] - start_color[0], range - 1)
    g = start_color[1] + mul_div(value, end_color[1] - start_color[1], range - 1)
    b = start_color[2] + mul_div(value, end_color[2] - start_color[2], range - 1)

    color = r * 256 * 256 + g * 256 + b

    "##{color.to_s(16).rjust(6, "0")}"
  end

  def mul_div(a, b, c)
    (a * b / c).round
  end

end
