.First <- function() {
    cat("Hello World! \n")
    addTaskCallback(
        function(expr, value, ok, visible) {
            prompt <- paste0(format(Sys.time(), "⏰%H时%M分 "), "💋 ")
            options(prompt = prompt, continue = "+\t")
            TRUE
        }
    )
}

.Last <- function() {
    graphics.off() # a small safety measure.
    cat("See you next time! \n")
}

open_dir <- function(dir = getwd()) {
    # 打开文件夹
    # param dir: 文件夹路径
    # return: NULL

    stopifnot(dir.exists(dir))
    if (Sys.info()[["sysname"]] == "Windows") {
        system(paste0("explorer ", dir))
    } else {
        system(paste0("open ", dir))
    }
}

startproject <- function(dir) {
    # 开始一个新项目，并生成文件夹
    # param dir: 项目名称
    # return: NULL

    # **目录结构**：有组织的文件和文件夹结构。
    # - `/lib`：      常用代码库
    # - `/src`：      源代码
    # - `/def`：      配置文件(函数需要复杂配置时使用)
    # - `/etc`：      其他文件
    # - `/data`：     数据源文件(csv等)
    # - `/rdata`：    输出的数据文件(RData等)
    # - `/out`：      输出的图片、报告等
    # - `/doc`：     文档(非程序生成的文档)
    # - `/test`：    测试代码

    if (missing(dir)) {
        dir <- readline("请输入项目名称：")
    }
    # 创建文件夹
    dir.create(dir)
    message("新建项目：", dir)
    message(
        "目录结构：", "\n",
        dir, "/    \n",
        "    /lib：      常用代码库\n",
        "    /src：      源代码\n",
        "    /def：      配置文件(函数需要复杂配置时使用)\n",
        "    /etc：      其他文件\n",
        "    /data：     数据源文件(csv等)\n",
        "    /rdata：    输出的数据文件(RData等)\n",
        "    /out：      输出的图片、报告等\n",
        "    /doc：      文档(非程序生成的文档)\n",
        "    /test：     测试代码\n"
    )
    dir.create(paste0(dir, "/lib"))
    dir.create(paste0(dir, "/src"))
    dir.create(paste0(dir, "/def"))
    dir.create(paste0(dir, "/etc"))
    dir.create(paste0(dir, "/data"))
    dir.create(paste0(dir, "/rdata"))
    dir.create(paste0(dir, "/out"))
    dir.create(paste0(dir, "/doc"))
    dir.create(paste0(dir, "/test"))
    open_dir(dir)
}
