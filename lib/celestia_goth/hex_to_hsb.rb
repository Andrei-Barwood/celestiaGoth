module CelestiaGoth
  module HexToHsb
    def self.convert(hex)
      hex = hex.gsub('#', '')
      r = hex[0..1].to_i(16) / 255.0
      g = hex[2..3].to_i(16) / 255.0
      b = hex[4..5].to_i(16) / 255.0

      cmax = [r, g, b].max
      cmin = [r, g, b].min
      delta = cmax - cmin

      h = 0
      s = 0
      v = cmax

      if delta > 0
        s = delta / cmax
        if cmax == r
          h = 60 * (((g - b) / delta) % 6)
        elsif cmax == g
          h = 60 * (((b - r) / delta) + 2)
        elsif cmax == b
          h = 60 * (((r - g) / delta) + 4)
        end
      end
      
      h = (h < 0 ? h + 360 : h).round
      s = (s * 100).round
      v = (v * 100).round

      "hsb(#{h}, #{s}%, #{v}%)"
    end
  end
end
