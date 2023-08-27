ellipsis <- function(a, b, h, k, col = "steelblue", add = FALSE) {
    # @description: 画椭圆
    # @param a:     长轴
    # @param b:     短轴
    # @param h:     中心点横坐标
    # @param k:     中心点纵坐标
    # @param col:   填充颜色
    # @return: NULL

    ## 椭圆参数方程
    ## x = a * cos(t) + h
    ## y = b * sin(t) + k
    t <- seq(0, 2 * pi, len = 1000)
    x <- a * cos(t) + h
    y <- b * sin(t) + k

    if (!add) {
        plot(0, 0,
            xlim = range(x) * 1.04, ylim = range(y) * 1.3,
            type = "n",
            xlab = "", ylab = "",
            axes = FALSE
        )
    }
    polygon(x, y,
        col = col,
        border = NA
    )
}

if (FALSE) {
    source("./src/logo.r")
    ellipsis(1, 1, 0, 0, col = "grey")
}

logo <- function(
    fn = "./out/cover.png",
    res = 50,
    w = 8 * res,
    h = 6 * res,
    pointsize = 12) {
    # @description: 使用 base R绘制封面 R语言的logo
    # @param fn:        文件名
    # @param res:       分辨率
    # @param w:         宽度
    # @param h:         高度
    # @param pointsize: 字体大小
    # @return: NULL
    png(fn,
        width = w, height = h, res = res,
        pointsize = pointsize, bg = "transparent"
    )
    par(mar = c(0, 0, 0, 0))
    # 根据黄金分割比例画椭圆
    r <- 0.618
    # 外层椭圆
    ellipsis(
        a = 1,
        b = r,
        h = 0,
        k = 0,
        col = "grey"
    )
    rr <- r * r
    # 内层椭圆
    ellipsis(
        a = r,
        b = rr,
        h = r * (1 - rr),
        k = 0,
        col = "white", add = TRUE
    )
    # 大写字母R
    text(r * (1 - rr * rr),
        -r * (1 - r), "R",
        col = "steelblue",
        cex = 28, font = 2
    )
    dev.off()
}

if (FALSE) {
    source("./src/logo.r")
    logo()
}
