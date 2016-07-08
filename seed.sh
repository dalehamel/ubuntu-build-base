TMPDIR=$(mktemp -d /tmp/bootstrap-XXXXX)
sudo debootstrap --variant=buildd --components main,universe --arch amd64 trusty ${TMPDIR} http://archive.ubuntu.com/ubuntu/
sudo tar -C ${TMPDIR} -cpf seed_rootfs.tar .
sudo rm -rf ${TMPDIR}
