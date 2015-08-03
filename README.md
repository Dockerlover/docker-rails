# docker-rails
docker化rails

## 镜像特点

- 2015/8/3 继承基础镜像docker-ruby:2.2

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-rails.git
        cd docker-rails
        docker build -t docker-rails .

- 运行容器

        docker run -it -d --restart:always --name rails -p 8300:80 -v /var/data/rails:/app docker-rails
