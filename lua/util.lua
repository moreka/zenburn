local M = {}

local function clamp(val, min, max)
  if val >= min and val <= max then
    return val
  end
  if val < min then
    return min
  end
  if val > max then
    return max
  end
end

function M.hsl_from_rgb(rgb_str)
  local r = tonumber(rgb_str:sub(2, 3), 16) / 255
  local g = tonumber(rgb_str:sub(4, 5), 16) / 255
  local b = tonumber(rgb_str:sub(6, 7), 16) / 255

  local min = math.max(math.min(r, g, b), 0)
  local max = math.min(math.max(r, g, b), 1)
  local delta = max - min

  local h, s, l = 0, 0, ((min + max) / 2)

  -- Achromatic, can skip the rest
  if max == min then
    return { h = max * 360, s = 0, l = l }
  end

  if l < 0.5 then
    s = delta / (max + min)
  else
    s = delta / (2 - max - min)
  end

  if delta > 0 then
    if max == r then
      h = (g - b) / delta
      if g < b then
        h = h + 6
      end
    elseif max == g then
      h = 2 + (b - r) / delta
    elseif max == b then
      h = 4 + (r - g) / delta
    end
    h = h / 6
  end

  if h < 0 then
    h = h + 1
  end
  if h > 1 then
    h = h - 1
  end
  return { h = h * 360, s = s, l = l }
end

function M.rgb_from_hsl(hsl)
  local h, s, l = hsl.h, hsl.s, hsl.l

  h = (h / 360) % 1

  if s == 0 then
    return { r = l, g = l, b = l }
  end

  local m1, m2
  if l <= 0.5 then
    m2 = l * (s + 1)
  else
    m2 = (l + s) - (l * s)
  end

  m1 = l * 2 - m2

  local function hue_to_rgb(p, q, hue)
    if hue < 0 then
      hue = hue + 1
    end
    if hue > 1 then
      hue = hue - 1
    end

    if hue < 1 / 6 then
      return p + (q - p) * hue * 6
    end
    if hue < 1 / 2 then
      return q
    end
    if hue < 2 / 3 then
      return p + (q - p) * (2 / 3 - hue) * 6
    end
    return p
  end

  return {
    r = clamp(hue_to_rgb(m1, m2, h + 1 / 3), 0, 1),
    g = clamp(hue_to_rgb(m1, m2, h), 0, 1),
    b = clamp(hue_to_rgb(m1, m2, h - 1 / 3), 0, 1),
  }
end

function M.rgbstr_from_hsl(hsl)
  local rgb = M.rgb_from_hsl(hsl)
  local r, g, b = rgb.r, rgb.g, rgb.b
  r = r * 255
  g = g * 255
  b = b * 255
  return string.format("#%02x%02x%02x", r, g, b)
end

function M.darken(rgb_str, amount)
  local hsl = M.hsl_from_rgb(rgb_str)
  local l = math.max(0, hsl.l - amount)
  return M.rgbstr_from_hsl({ h = hsl.h, s = hsl.s, l = l })
end

return M
