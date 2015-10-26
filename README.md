# arch-desktop
Some design and notes for running an arch desktop


## Disk Layout and Partitioning

**Base Goal:** Dual boot Arch Linux and Windows, keeping things separate.

**Storage Goal:** Parity style RAID with power efficiency.

**Current Motherboard Boot Support**

- Use MBR.  Only use GPT if the system supports UEFI.  
- The partition table only counts on the boot devices.
- Windows and Linux Boot drives should be MBR.
- Every other drive can be GPT.
- Use a single root linux partition.
- Install GRUB in a way that detects the disk running Windows.
- Set the BIOS to boot into the disk with the GRUB image.
- Keep `/home` running on an individual drive.
- Keep the RAID and storage drives uncoupled from the primary system as much as possible.  Think external drive status, but internal to the machine.

**Current Drive Stock:**

| Drive | Nickname | Device Path | Mounts | Partitions | FS |
|------------------|----------|-------------|--------|------------|----|
| 600Gb WD | Windows | N/A | C:/ |  |  |
| 113 Gb Apple SSD |  |  | /boot |  |  |
| 59Gb M4 SSD |  |  | /home |  |  |
| WD 2Tb |  |  |  |  |  |
| Samsung 2Tb |  |  |  |  |  |
| Hitachi 1Tb |  |  |  |  |  |

### High level strategy

**Windows drive:** MBR + NTFS
**Linux Boot:** MBR + ext4
**Linux Home:** GPT + XFS
**Linux Mass Storage:** btrfs

- Mount the Linux Boot Drive
- Ensure the Linux Home Drive is mounted at `/home`
- Create a swapfile after the fact.  Its easier and more flexible, despite some felixbility drawbacks.

## Installation Links:

- https://wiki.archlinux.org/index.php/Installation_guide
- https://wiki.archlinux.org/index.php/Beginners'_guide#Prepare_the_storage_devices
