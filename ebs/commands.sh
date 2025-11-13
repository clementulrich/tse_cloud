sudo fdisk -l

sudo mkfs -t ext4 /dev/xvdf

sudo mkdir /mnt/volume/

sudo mount /dev/nvme1n1 /mnt/volume/            # attention modif xvdf en nvme1n1 !!!

df -hk                                          # on voit bien apparaitre le /mnt/volume/

sudo touch /mnt/volume/testfile

sudo umount /mnt/volume/

# detach volume via web console

# re-attach volume via web console

sudo mount /dev/xvdf /mnt/volume/

ls /mnt/volume                                  # On voit bien le testfile apparaitre alléluia !!!

