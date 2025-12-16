##################################
## in:prove plot theme template ##
##################################

## version: 2025-12-16, sebastian hacker

# --------------------------------------------------------------------------
# please ensure that the packages ggplot2, ggtext and cowplot are installed
# prior to running this script, you can install them with the following command:
# install.packages(c("ggplot2", "ggtext", "cowplot"))
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# to use the Montserrat font as specified here, make sure to install it on
# your system (see https://fonts.google.com/specimen/Montserrat)
#
# you can check if the font is installed by running the following command:
# systemfonts::system_fonts() |> dplyr::filter(family == "Montserrat") |> View()
#
# for troubleshooting and help with using fonts in R, check out the article
# from Cara Thompson: https://www.cararthompson.com/posts/2024-01-12-using-fonts-in-r-for-dataviz/
#
# it is preferred to use the approach using systemfonts, however if you are
# using RStudio you may also use the showtext package instead
# (https://github.com/yixuan/showtext)
# --------------------------------------------------------------------------

# define theme
theme_inprove <- function(show_axis_elements = TRUE) {
  base_theme <- cowplot::theme_cowplot() + # use theme_cowplot as a base
    ggplot2::theme(
      # plot
      plot.title = ggtext::element_textbox_simple(
        family = "Montserrat-Bold",
        face = "bold",
        color = "black",
        margin = ggplot2::margin(t = 0, r = 0, b = 12, l = 0)
      ),
      plot.title.position = "plot",
      plot.subtitle = ggtext::element_textbox_simple(
        family = "Montserrat-Medium",
        color = "black",
        margin = ggplot2::margin(t = 0, r = 0, b = 12, l = 0)
      ),
      plot.caption = ggtext::element_textbox_simple(
        family = "Montserrat-Medium",
        color = "black",
        margin = ggplot2::margin(t = 6, r = 0, b = 0, l = 0)
      ),
      plot.caption.position = "plot",
      plot.margin = rep(grid::unit(12, "pt"), 4),

      # axis title
      axis.title = ggtext::element_markdown(
        family = "Montserrat-Bold",
        size = 14
      ),
      axis.title.x = ggtext::element_markdown(margin = ggplot2::margin(t = 10)),
      axis.title.y = ggtext::element_markdown(margin = ggplot2::margin(r = 10)),

      # axis text
      axis.text = ggplot2::element_text(
        family = "Montserrat-Medium",
        size = 12
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 6)),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 6)),

      # panel
      panel.background = ggplot2::element_rect(color = NA, fill = "white")
    )

  # remove axis elements if desired
  if (!show_axis_elements) {
    base_theme <- base_theme +
      ggplot2::theme(
        axis.line = ggplot2::element_blank(),
        axis.ticks = ggplot2::element_blank()
      )
  }

  return(base_theme)
}

## examples ----
## just uncomment (on a mac: command + shift + c) the following
## code and run it

## basic use
# ggplot(mtcars, aes(x = wt, y = mpg)) +
#   geom_point() +
#   theme_inprove()

## without axis elements - set show_axis_elements to FALSE
# ggplot(mtcars, aes(x = wt, y = mpg)) +
#   geom_point() +
#   theme_inprove(show_axis_elements = FALSE)

## advanced example with custom color
# ggplot(mtcars, aes(x = wt, y = mpg)) +
#   geom_point(aes(color = mpg > 20)) +
#   scale_color_manual(
#     breaks = c("< 20" = "FALSE", "> 20" = "TRUE"),
#     values = c("FALSE" = "grey80", "TRUE" = "#ed1c24")
#   ) +
#   labs(
#     # if you want to use italics in your text,
#     # you need to insert a html span tag
#     # and specify the italized font there; see the example below
#     title = "Fuel consumption by <span style='font-family: Montserrat-BoldItalic;'>car weight</span>",
#     x = "Weight (1000 lbs)",
#     y = "Miles per gallon",
#     color = "Miles per\ngallon",
#   ) +
#   theme_inprove() + # add theme to your ggplot
#   theme(
#     legend.title = ggplot2::element_text(family = "Montserrat-Bold", size = 14),
#     legend.text = ggplot2::element_text(family = "Montserrat-Medium", size = 12)
#   )

## saving a plot ----
# the most common way to save a plot is to use ggplot2::ggsave()
# https://ggplot2.tidyverse.org/reference/ggsave.html

## example
# ggsave(
#   filename = "my-plot.png", # insert path and filename here, ggsave will recognize the file extension automatically, i.e. ".png", ".tiff", ".pdf", ".svg"
#   width = 4,
#   height = 4,
#   units = "in", # default is inches but you can also use "cm", "mm" or "px"
#   dpi = 300, # minimum should be 300 dpi (sometimes 350 or 400 dpi is better)
#   bg = "white" # ensure a white background (otherwise may be transparent)
# )

#### colors ----
## in:prove base colors ----
# in:prove yellow = #fdb913
# red = #ed1c24
# black = #000000
# white = #ffffff
# darkgrey = #3b3e41
# lightgrey = #b3b3b3 # corresponds to "grey70", #cccccc = "grey80"

## complementary colors ----
# light inprove yellow = #ffdcb1
# lightblue = #bcede9
# midblue = #8ebde4

## (digital) avatar colors ----
# red = #f15d47
# yellow = #fae19d
# green = #75ab17
