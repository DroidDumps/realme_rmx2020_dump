#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b32b1a51a366948b3c9dd6cb2403037b84a50b44; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:c407c278410a6bc44cf530c18719d22bf59b632a \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b32b1a51a366948b3c9dd6cb2403037b84a50b44 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
