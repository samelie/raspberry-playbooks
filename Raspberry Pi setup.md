# Raspberry Pi setup

Configure with `Imager` [source](https://stackoverflow.com/questions/71804429/raspberry-pi-ssh-access-denied)

### :warning: Warnings

- Physcial TV pins on Zero are very fussy!
- [Stretch Img](http://debian.rutgers.edu/raspbian_images/raspberrypi/images/raspbian/2019-04-08-raspbian-stretch/) is prefered for the 2017 Zero models. Jessie had problems with inital ssh and Buster has kernal issues with composite.



## Ansible

1. Config `ansible-playbook -i inventory/hosts config.yml`
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

- cvlc --no-audio --rate 2 `"$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=5DAH5GNjRAQ)"`
- 4:3
  - `omxplayer --display 3 "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=NEu3ZWjzHD8)"`

### Notes

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

​		`cvlc -h`

- mpv

  - ```
    apt-get install mpv
    ```