FROM ubuntu

RUN apt-get update && apt-get install -y \
    jq curl autoconf automake libtool gnome-builder libxml2-dev intltool \
    libglib2.0-dev libboost-all-dev guile-2.0-dev swig libxslt1-dev xsltproc \
    libgtest-dev google-mock gtk2.0 libgnomecanvas2-dev libwebkitgtk-dev \
    libdbi-dev libdbd-mysql libdbd-pgsql libdbd-sqlite3 libgoffice-0.8-dev

WORKDIR /usr/local/src/gnucash/

RUN $(curl -L \
    $(curl -s https://api.github.com/repos/gnucash/gnucash/releases/latest \
    | jq -r '.assets[] \
    | select(.name | endswith("tar.gz")) | .browser_download_url') \
    | tar xz --strip-components=1)

RUN ./configure && make && make install && ldconfig 

RUN apt-get install -y gnucash-docs

CMD ["gnucash"]
