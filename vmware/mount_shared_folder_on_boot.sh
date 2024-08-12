sudo echo "
[Unit]
Description=VMware mount for hgfs
DefaultDependencies=no
Before=umount.target
ConditionVirtualization=vmware
After=sys-fs-fuse-connections.mount

[Mount]
What=vmhgfs-fuse
Where=/mnt/hgfs
Type=fuse
Options=default_permissions,allow_other,uid=1000,gid=1000

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/mnt-hgfs.mount

sudo systemctl daemon-reload
sudo systemctl enable mnt-hgfs.mount
sudo systemctl start mnt-hgfs.mount
