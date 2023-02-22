# Raspberry Pi Zero W 1.2 setup

1. Configure with `Imager` [source](https://stackoverflow.com/questions/71804429/raspberry-pi-ssh-access-denied) Use Lite Legacy (buster)

2. After flash, keep SD card mounted on computer.

3. `sudo nano /Volumes/boot/wpa_supplicant.conf`

   1. ```
      ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
      update_config=1
      country=US
      
      network={
          ssid="LO_BEHOLD"
          psk="little***ers"
          key_mgmt=WPA-PSK
      }
      ```

4. `sudo touch /Volumes/boot/ssh`

5. SD card is ready and should have wifi working.

6. Check `hosts` file and add new IP address.

7. Configure rasbi-config

   1. `ansible-playbook -i inventory/hosts config-playbook.yml`
   2. :warning: Uncomment old IP address so this commands doesnt run loads of time. It will concat some config EOF, probably not a big deal.

8. Install everything

   1. `ansible-playbook -i inventory/hosts playbook.yml`

### :warning: Warnings

- Physcial TV pins on Zero are very fussy!
- [Stretch Img](http://debian.rutgers.edu/raspbian_images/raspberrypi/images/raspbian/2019-04-08-raspbian-stretch/) is prefered for the 2017 Zero models. Jessie had problems with inital ssh

## Ansible

:information_source: Always add! `ssh-add ~/.ssh/pi`

1. Config - run this once. `ansible-playbook -i inventory/hosts config-playbook.yml`
2. Installs - Run to get updates `ansible-playbook -i inventory/hosts playbook.yml`

**Known issue:**

- Possibly not re-installing yt-dlp and getting new version

### commands

`ansible all -i inventory/hosts -b  -a "shutdown -h now"`

## Video

### Stream iPhone to Rasperry

- DroidCam:
  - https://apps.apple.com/us/app/droidcam-webcam-obs-camera/id1510258102
  - `cvlc --no-audio --mjpeg-fps=30  --crop=4:3 "http://192.168.50.188:4747/video"`

### ad-hoc commands

Shutdown:

`ansible pis -i inventory/hosts -m shell  -a "shutdown -h now" --become`
