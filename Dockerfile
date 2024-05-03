# 使用官方Node.js镜像作为基础镜像，该镜像支持多架构
FROM node:latest

# 使用LABEL替代已弃用的MAINTAINER指令
LABEL maintainer="root <root@gmail.com>"

# 由于原基础镜像是node:latest，已经是基于Debian的，因此直接运行Debian系的包管理命令
# 合并RUN命令以减少镜像层数
RUN apt-get update && \
    apt-get -y install git && \
    git clone https://github.com/malaohu/forsaken-mail.git /forsaken-mail && \
    # 清理缓存以减小镜像大小
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /forsaken-mail

# 安装依赖
RUN npm install

# 暴露SMTP和Web服务所需的端口
EXPOSE 25 3000

# 定义容器启动时执行的命令
CMD ["npm", "start"]
