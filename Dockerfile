# 基础镜像
FROM docker-ruby:2.2
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID rails
# 安装sqlite3
RUN apt-get update && apt-get install -y zlib1g-dev  libxml2 mysql-client postgresql-client sqlite3 --no-install-recommends  && rm -rf /var/lib/apt/lists/*
# 安装rails
RUN gem install rails -v '4.2.3'
# 生成默认app
RUN rails new /app
# 指定工作路径为/app
WORKDIR /app
# 挂载代码路径
VOLUME ['/app']
# 默认暴露80端口
EXPOSE 80
# 复制supervisord.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
