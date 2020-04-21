FROM wordpress:5.4-php7.3-apache

ENV wordpress_version="5.4"

# Settings

ENV timezone=Europe/Helsinki

# Themes release .zip

ENV theme="https://github.com/Eskilmar/welcome-to-kubernetes-theme/archive/master.zip"

# Languages

ENV languages="https://downloads.wordpress.org/translation/core/5.4/fi.zip"

# Public plugins (download)

ENV plugins="https://downloads.wordpress.org/plugin/mailgun.1.7.1.zip \
  https://downloads.wordpress.org/plugin/woocommerce.4.0.1.zip \
  https://downloads.wordpress.org/plugin/woocommerce-admin.zip"

# Private plugins (local in ./plugins -folder)

ENV pluginzips="testimonial-block.zip"

# Installation in container

RUN apt-get update
RUN apt-get install -y unzip

# Public plugins unzip and moving to right folder

WORKDIR /usr/src/wordpress/wp-content/plugins
RUN for i in $plugins; do curl -L $i -o /tmp/d.zip && unzip /tmp/d.zip && rm /tmp/d.zip; done

# Private plugins unzip and moving to right folder

COPY plugins /opt/wordpress-plugins
RUN for i in $pluginzips; do unzip /opt/wordpress-plugins/$i; done
RUN rm -rf /opt/wordpress-plugins

# Theme unzip and moving to right folder

WORKDIR /usr/src/wordpress/wp-content/themes
RUN for i in $theme; do curl -L $i -o /tmp/d.zip && unzip /tmp/d.zip && rm /tmp/d.zip; done

# Language unzip and moving to right folder

WORKDIR /usr/src/wordpress/wp-content/languages
RUN for i in $languages; do curl -L $i -o /tmp/d.zip && unzip /tmp/d.zip && rm /tmp/d.zip; done

# Setting up timezone

RUN ln -snf /usr/share/zoneinfo/$timezone /etc/localtime && echo $timezone > /etc/timezone

WORKDIR /var/www/html