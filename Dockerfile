# Monero Remote Node
# Example Run: docker run --restart=always -v /var/data/blockchain-xmr:/root/.bitmonero -p 18080:18080 -p 18081:18081 --name=monerod -td datapotomus/monero-remote-node
FROM  alpine:3.7
EXPOSE 18080 18081

# Can get the hash from the monero website https://getmonero.org/downloads/#linux
# if they don't match the build will fail.
ENV MONERO_HASH 928ad08ff0dea2790c7777a70e610b2d33c35a5df5900fbb050cc8c659237636

RUN apk add --update wget bzip2

# Grabs the latest version of monero from the site.
RUN wget -O monero-linux-x64.tar.bz2 https://downloads.getmonero.org/cli/linux64 
RUN echo "928ad08ff0dea2790c7777a70e610b2d33c35a5df5900fbb050cc8c659237636  monero-linux-x64.tar.bz2" | sha256sum -c -

#Not done Yet
#ENTRYPOINT ["./monerod"]
#CMD ["--restricted-rpc", "--rpc-bind-ip=0.0.0.0", "--confirm-external-bind"]
