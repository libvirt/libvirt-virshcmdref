# List of source files
DOMAIN_COMMANDS="attach-device attach-disk attach-interface autostart
  console cpu-baseline cpu-compare create define destroy detach-device
  detach-disk detach-interface domid domjobabort domjobinfo domname domuuid
  domxml-from-native domxml-to-native dump dumpxml echo edit freecell
  hostname managedsave managedsave-remove maxvcpus memtune migrate
  migrate-setmaxdowntime reboot restore resume save schedinfo setmaxmem
  setmem setvcpus shutdown start suspend ttyconsole undefine update-device
  vcpucount vcpuinfo vcpupin version vncdisplay"

MONITOR_COMMANDS="domblkinfo domblkstat domifstat dominfodomain dommemstat
  domstate list"

HOST_COMMANDS="capabilities connect freecell hostname qemu-monitor-command
  uri"

INTERFACE_COMMANDS="iface-define iface-destroy iface-dumpxml iface-edit
  iface-list iface-mac iface-name iface-start iface-undefine"

FILTER_COMMANDS="nwfilter-define nwfilter-dumpxml nwfilter-edit
  nwfilter-list nwfilter-undefine"

NETWORK_COMMANDS="net-autostart net-create net-define net-destroy
  net-dumpxml net-edit net-info net-list net-name net-start net-undefine
  net-uuid"

NODE_DEVICE_COMMANDS="nodedev-create nodedev-destroy nodedev-dettach
  nodedev-dumpxml nodedev-list nodedev-reattach nodedev-reset nodeinfo"

SECRET_COMMANDS="secret-define secret-dumpxml secret-get-value secret-list
  secret-set-value secret-undefine"

SNAPSHOT_COMMANDS="snapshot-create snapshot-current snapshot-delete
  snapshot-dumpxml snapshot-list snapshot-revert"

POOL_COMMANDS="find-storage-pool-sources-as find-storage-pool-sources
  pool-autostart pool-build pool-create-as pool-create pool-define-as
  pool-define pool-delete pool-destroy pool-dumpxml pool-edit pool-info
  pool-list pool-name pool-refresh pool-start pool-undefine pool-uuid"

VOLUME_COMMANDS="vol-clone vol-create-as vol-create vol-create-from
  vol-delete vol-dumpxml vol-info vol-key vol-list vol-name vol-path
  vol-pool vol-wipe"

VIRSH_COMMANDS="cd echo exit help pwd quit"

ALL_COMMANDS="$DOMAIN_COMMANDS $MONITOR_COMMANDS $HOST_COMMANDS
  $INTERFACE_COMMANDS $FILTER_COMMANDS $NETWORK_COMMANDS
  $NODE_DEVICE_COMMANDS $SECRET_COMMANDS $SNAPSHOT_COMMANDS
  $POOL_COMMANDS $VOLUME_COMMANDS $VIRSH_COMMANDS"
