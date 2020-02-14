{ pkgs, ... }:

{
  primary-user.home-manager.home.packages = with pkgs; lib.mkForce [
    # cloud tools
    awscli
    ec2_ami_tools
    ec2_api_tools
    google-cloud-sdk
    azure-cli

    # provisioning
    nixops
    ansible
    terraform

    # virt
    libvirt
    virtmanager
    vagrant
    packer
    libguestfs
    virtviewer
    spice-gtk

    # kubernetes
    kubectl
    kubernetes-helm
    kops
    kops.out
    telepresence
    kail
    helmfile
    kubicorn
    kubectx
    kind
    minikube

    # container tools
    skopeo
    remarshal
    proot
    #nix-prefetch-docker
    # crypto
    mkpasswd
    pwgen
    apacheHttpd # for htpasswd
    xca
    cfssl

    #docker
    docker
    docker-compose

    # storage
    s3fs
    minio-client
    gzrt # gzip recovery

    # networking
    ncftp
    curl_unix_socket
    socat
    bmon
    tcptrack
    stunnel
    wireshark
    # database
    sqlite
    #mongodb
    mysql57
    #mysql-workbench
    postgresql
    redis
    etcdctl
    vault

    # kafka
    confluent-platform
    # remote
    rdesktop
    gtk-vnc
    openvpn

    winusb
  ];
}
