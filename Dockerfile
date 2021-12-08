FROM python:slim-bullseye
LABEL maintainer="Norman Novaes"
ENV TRACKFILE="track"
# RUN useradd -m -u 10001 -s /bin/false appuser
RUN apt-get update && \
    apt-get install -y \
    procps \
    spamassassin && \
    rm -rf /var/lib/apt/lists/* && \
    pip install isbg
COPY ./entrypoint.sh /entrypoint.sh
VOLUME /track
ENV IMAPHOST IMAPHOST
ENV IMAPUSER IMAPUSER
ENV IMAPPASSWD IMAPPASSWD
ENV SPAMINBOX SPAMINBOX
ENV LEARNHAMBOXES LEARNHAMBOXES
ENV LEARNSPAMBOXES LEARNSPAMBOXES
ENV TRACKFILE TRACKFILE

# USER appuser
CMD /entrypoint.sh