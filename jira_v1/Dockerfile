# Use an NFS server base image
FROM itsthenetwork/nfs-server-alpine

# Create the directory to be shared
RUN mkdir -p /jira
RUN mkdir -p /psql

# Set the correct permissions (optional)
RUN chown -R nobody:nogroup /jira
RUN chown -R nobody:nogroup /psql

# Expose NFS ports
EXPOSE 2049 111 20048

# Add configuration files (optional)
COPY exports /etc/exports

# Start the NFS server
CMD ["/usr/sbin/rpc.nfsd", "8"]

docker run -d \
      --name nfs-server \
      -p 2049:2049 \
      -p 1111:111 \
      -p 20048:20048 \
      -e SHARED_DIRECTORY=/jira \
      -v /Volumes/k8/jira:/jira \
      -v /Volumes/k8/psql:/psql \
      divakar2201/microservices:nfs