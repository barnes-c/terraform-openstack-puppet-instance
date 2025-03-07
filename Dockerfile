FROM hashicorp/terraform:1.11

LABEL maintainer "Christopher Barnes <christopher.barnes@cern.ch>"

WORKDIR /terraform-openstack-puppet-instance

COPY . .

RUN terraform init

ENTRYPOINT ["terraform"]
CMD ["plan"]
