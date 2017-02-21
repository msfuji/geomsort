#' Sort points to avoid overplotting
#'
#' Couterintuitively adding random noise to a plot can sometimes make it
#' easier to read. Jittering is particularly useful for small datasets with
#' at least one discrete position.
#'
#' @family position adjustments
#' @param width Amount of vertical and horizontal jitter. The jitter
#'   is added in both positive and negative directions, so the total spread
#'   is twice the value specified here.
#'
#'   If omitted, defaults to 40\% of the resolution of the data: this means the
#'   jitter values will occupy 80\% of the implied bins. Categorical data
#'   is aligned on the integers, so a width or height of 0.5 will spread the
#'   data so it's not possible to see the distinction between the categories.
#' @export
#' @examples
#' # Jittering is useful when you have a discrete position, and a relatively
#' # small number of points
#' # take up as much space as a boxplot or a bar
#' ggplot(mpg, aes(class, hwy)) +
#'   geom_boxplot(colour = "grey50") +
#'   geom_jitter()
#'
#' # If the default jittering is too much, as in this plot:
#' ggplot(mtcars, aes(am, vs)) +
#'   geom_jitter()
#'
#' # You can adjust it in two ways
#' ggplot(mtcars, aes(am, vs)) +
#'   geom_jitter(width = 0.1, height = 0.1)
#' ggplot(mtcars, aes(am, vs)) +
#'   geom_jitter(position = position_jitter(width = 0.1, height = 0.1))

library(ggplot2)

position_sort <- function(width = NULL) {
  ggproto(NULL, PositionSort,
    width = width
  )
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
PositionSort <- ggproto("PositionSort", ggplot2::Position,
  required_aes = c("x", "y"),

  setup_params = function(self, data) {
    list(
      width = self$width %||% (resolution(data$x, zero = FALSE) * 0.4)
    )
  },

  compute_layer = function(data, params, panel) {
    pos.in.group=rep(0,nrow(data))
    names(pos.in.group)=rownames(data)
    for(grp in unique(data$x)) {
      s=subset(data, x==grp)
      num=nrow(s)
      pos.in.group[rownames(s)]=rank(s$y)/num
      pos.in.group[rownames(s)]=(pos.in.group[rownames(s)] - (1/num+1)/2) * params$width
    }

    trans_x <- function(x) data$x + pos.in.group# * params$width
    transform_position(data, trans_x)
  }
)

# copied from "utilities.r" in ggplot2
"%||%" <- function(a, b) {
  if (!is.null(a)) a else b
}

