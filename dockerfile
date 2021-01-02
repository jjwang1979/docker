FROM ubuntu

#Set environment variable for tzdata to run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# 安裝 Apache 套件、完成後移除下載
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y apache2
RUN rm -r /var/lib/apt/lists/*
RUN service apache2 start

# 將網頁搬移到 Apache 指定目錄
# COPY webapp /var/www/html

# 開放 80 Port
EXPOSE 80

#
CMD ["apachectl", "-D", "FOREGROUND"]