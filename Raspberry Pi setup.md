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

`ssh-add ~/.ssh/pi`

1. Config `ansible-playbook -i inventory/hosts config-playbook.yml`
2. Installs `ansible-playbook -i inventory/hosts playbook.yml`

### commands

`ansible all -i inventory/hosts -b  -a "shutdown -h now"`

## OS

### jessie

- [Issue](https://raspberrypi.stackexchange.com/questions/111236/raspberry-pi-imager-says-input-file-is-not-a-valid-disk-image) with Imager. [Jessie](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/)
- [Special setup](https://www.losant.com/blog/getting-started-with-the-raspberry-pi-zero-w-without-a-monitor)
- After flash: ` touch /Volumes/boot/ssh && cp  raspberry_boot/wpa_supplicant.conf /Volumes/boot`

## Video

cvlc is prefered

Live video 4:3

`cvlc --no-audio --crop=4:3  "$(yt-dlp -g https://www.youtube.com/watch?v=2pO-qXoqBxc)"`

5hr Birds:

`cvlc --no-audio --rate 3 --crop=4:3  "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=du5QtndmeCQ)"`

`cvlc --no-audio --rate 2 --crop=4:3  "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=5DAH5GNjRAQ)"`

- 4:3
  - `omxplayer --display 3 "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=NEu3ZWjzHD8)"`

### ad-hoc commands

Shutdown:

`ansible pis -i inventory/hosts -m shell  -a "shutdown -h now" --become`

### Notes

Always add!

`ssh-add ~/.ssh/pi`

Issues with composite video

- https://www.reddit.com/r/raspberry_pi/comments/uup5jl/switching_composite_video_tv_pin_onoff_on_pi_zero/

- Update & upgrade

- Yt-dlp

  - https://lindevs.com/install-yt-dlp-on-raspberry-pi

- ffmpeg

  - https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v4.4.1/ffmpeg-4.4.1-linux-armel-32.zip

- vlc

  ```
  sudo apt install -y vlc
  ```

  `

`cvlc -h`

- mpv

  - ```
    apt-get install mpv
    ```

### cvlc video vilters

Get the formats

`yt-dlp -F https://www.youtube.com/live/U8kLr05i-p8`

Sadly video filters do not work.
`cvlc --no-audio --crop=4:3 --video-filter=adjust --saturation=0 --contrast=2 "$(yt-dlp -g -f 92 https://www.youtube.com/live/U8kLr05i-p8)" --codec avcodec,none`

- [Source](https://forum.videolan.org/viewtopic.php?t=149455)
