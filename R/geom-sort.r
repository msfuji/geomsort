#' Sorted points
#'
#' The sort geom is a convenient shortcut for
#' \code{geom_point(position = "sort")}. It shifts the location of data points
#' horizontally, depending on the rank among the data. This is a useful way to
#' reduce overplotting between data points.
#'
#' @section Aesthetics:
#' \aesthetics{geom}{point}
#'
#' @inheritParams layer
#' @inheritParams geom_point
#' @inheritParams position_sort
#' @seealso
#'  \code{\link{geom_point}} for regular, unsorted points,
#'  \code{\link{geom_jitter}} for another way to avoid overplotting by adding
#'     random variation to the location of points.
#' @export
#' @examples
#' p <- ggplot(mpg, aes(cyl, hwy)) 
#' p + geom_point()
#' p + geom_sort()
#'
#' # Add aesthetic mappings
#' p + geom_sort(aes(colour = class))
#'
#' # Use smaller width/height to emphasise categories
#' ggplot(mpg, aes(cyl, hwy)) + geom_sort()
#' ggplot(mpg, aes(cyl, hwy)) + geom_sort(width = 0.2)
#'
geom_sort <- function(mapping = NULL, data = NULL,
                        stat = "identity", position = "sort",
                        ...,
                        width = NULL,
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE) {
  if (!missing(width)) {
    if (!missing(position)) {
      stop("Specify either `position` or `width`", call. = FALSE)
    }

    position <- position_sort(width = width)
  }

  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomPoint,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}
