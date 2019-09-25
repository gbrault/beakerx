FROM rocker/rstudio

RUN apt update && \
    apt install -y -V apt-transport-https curl gnupg lsb-release && \
    echo $(lsb_release --id --short | tr 'A-Z' 'a-z') && \
    echo $(lsb_release --codename --short)

RUN curl --output /usr/share/keyrings/apache-arrow-keyring.gpg https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-keyring.gpg

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z') $(lsb_release --codename --short) main" >> /etc/apt/sources.list.d/apache-arrow.list && \
    echo "deb-src [signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z') $(lsb_release --codename --short) main" >> /etc/apt/sources.list.d/apache-arrow.list

RUN apt-get update \
  && apt-get install -y --no-install-recommends -v \
    libarrow-dev \
    libarrow-glib-dev \
    libarrow-flight-dev \
    libplasma-dev \
    libplasma-glib-dev \
    libgandiva-dev \
    libgandiva-glib-dev \
    libparquet-dev \
    libparquet-glib-dev

RUN install2.r --error \
    --deps TRUE \
    arrow \
    mongolite