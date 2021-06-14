FROM alpine as build

RUN apk add --update --no-cache ca-certificates git bash curl openssl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
   chmod 700 get_helm.sh && \
   ./get_helm.sh

RUN helm plugin install --version master https://github.com/sonatype-nexus-community/helm-nexus-push.git

ENTRYPOINT ["bash"]
