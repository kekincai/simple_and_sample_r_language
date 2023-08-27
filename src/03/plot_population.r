library(knitr) # 加载knitr包

# 读取数据
fn <- "data/年齢（５歳階級），男女別人口－全国（大正９年～平成27年）.csv"
d <- read.csv(fn, fileEncoding = "cp932") # 读取日文、中文等非英文字符可能需要指定编码

# 查看数据特征
str(d)

# 查看前几行数据
knitr::kable(head(d))

# 获取年度及人口总数
dd <- d[d$年齢5歳階級 == "総数", c("西暦.年.", "人口.総数.")]

# 绘制折线图
# 设置字体 注意⚠️：这里使用的是日文的字体，不同操作系统可能还有区别，需要自行调整
par(family = "HiraKakuProN-W3")
plot(dd$西暦.年., dd$人口.総数.,
    type = "l",
    col = "blue",
    xlab = "年", ylab = "人口総数",
    main = "年推移日本人口総数の変化"
)

# 添加人口变化值
par(new = TRUE)
plot(dd$西暦.年., c(NA, diff(dd$人口.総数.)),
    type = "l", col = "red",
    xlab = "", ylab = "", axes = FALSE
)
axis(4) # 添加右侧的y轴
mtext("人口総数の変化値", side = 4, line = -1.5) # 添加右侧y轴的标签

# 添加图例
legend("bottom",
    lty = 1,
    legend = c("人口総数", "人口総数の変化値"),
    col = c("blue", "red")
)
