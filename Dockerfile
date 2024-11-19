# 说明该镜像以哪个镜像为基础
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/python
# 构建者的基本信息
MAINTAINER changjin
# 创建 app 文件夹
RUN mkdir -p /app
# 进入 app 目录
RUN cd /app
# 在容器内部执行的命令
RUN python -m ensurepip --upgrage
RUN pip install flask 
# 将 linux 系统当前目录下的内容拷贝到容器的 /app 目录下
ADD . /app
# 暴露 8000 端口
EXPOSE 8000
# 将 app 文件夹为工作目录
WORKDIR /app

# 容器启动的时候执行的命令 flask run
CMD ["flask", "run", "--host", "0.0.0.0"]
# 用单引号的话，flask应用启动不起来，必须要用双引号