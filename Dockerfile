FROM debian:stretch
LABEL maintainer="lonord.b@gmail.com"
COPY packages/berkeley-db-6.2.32.tar.gz /root/berkeley-db.tar.gz
COPY packages/libgcrypt-1.8.2.tar.bz2 /root/libgcrypt.tar.bz2
COPY packages/libgpg-error-1.29.tar.bz2 /root/libgpg-error.tar.bz2
COPY packages/netatalk-3.1.11.tar.bz2 /root/netatalk.tar.bz2
COPY scripts/run.sh /run.sh
RUN chmod +x /run.sh \
	&& apt-get update \
	&& apt-get install -y gcc g++ make bzip2 \
	&& cd /root \
	&& tar -zxf berkeley-db.tar.gz \
	&& tar -jxf libgcrypt.tar.bz2 \
	&& tar -jxf libgpg-error.tar.bz2 \
	&& tar -jxf netatalk.tar.bz2 \
	&& cd /root/libgpg-error-1.29 && ./configure && make && make install \
	&& cd /root/libgcrypt-1.8.2 && ./configure && make && make install \
	&& mkdir -p /root/db-6.2.32/out && cd /root/db-6.2.32/out && ../dist/configure --prefix=/usr/local && make && make install \
	&& cd /root/netatalk-3.1.11 && ./configure && make && make install \
	&& cd /root/ && rm -rf db-6.2.32/ libgpg-error-1.29/ libgcrypt-1.8.2/ netatalk-3.1.11/ \
	&& apt-get remove gcc g++ make bzip2 -y && apt autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "/run.sh" ]