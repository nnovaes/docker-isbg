isbg
====
* run isbg and spamassassin in a container

* create an .env file and populate with your own values

```
IMAPHOST=imap.mailprovider.com
IMAPUSER=user@mail.com
IMAPPASSWD=Pa$$word
SPAMINBOX=Junk
LEARNHAMBOXES=INBOX/Ham, Sent
LEARNSPAMBOXES=Junk
TRACKFILE=isbg-example

```

* then `docker compose up`

```yaml
---
# docker-compose.yml
version: '3.0'
volumes:
  track:
services:
  isbg:
    image: normannovaes/docker-isbg
    volumes:
      - track:/track
    environment:
      IMAPHOST: ${IMAPHOST}
      IMAPUSER: ${IMAPUSER}
      IMAPPASSWD: ${IMAPPASSWD}
      SPAMINBOX: ${SPAMINBOX}
      LEARNHAMBOXES: ${LEARNHAMBOXES}
      LEARNSPAMBOXES: ${LEARNSPAMBOXES}
      TRACKFILE: ${TRACKFILE}
```