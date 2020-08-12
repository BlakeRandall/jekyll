FROM jekyll/builder:latest AS builder
COPY . /srv/jekyll/

RUN ["/usr/jekyll/bin/jekyll", "build", "--verbose"]

FROM jekyll/minimal AS runtime
COPY --from=builder /srv/jekyll/ /srv/jekyll/
COPY --from=builder /usr/gem/ /usr/gem/

ENTRYPOINT ["/usr/jekyll/bin/jekyll", "serve"]
CMD ["--verbose"]
