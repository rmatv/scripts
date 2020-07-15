VerticalRhythm <- function(base.size, base.line, font.size) {
  base.number = base.line / base.size
  line.height = base.size * base.number / font.size
  font.size = font.size / base.size
  return(c(font.size, line.height))
}

VerticalRhythm(16, 24, 14)
