## OS

### jessie

- [Issue](https://raspberrypi.stackexchange.com/questions/111236/raspberry-pi-imager-says-input-file-is-not-a-valid-disk-image) with Imager. [Jessie](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/)
- [Special setup](https://www.losant.com/blog/getting-started-with-the-raspberry-pi-zero-w-without-a-monitor)
- After flash: ` touch /Volumes/boot/ssh && cp  raspberry_boot/wpa_supplicant.conf /Volumes/boot`

## Video

cvlc is prefered

Live video 4:3

`cvlc --no-audio --loop --repeat --crop=4:3  "$(yt-dlp -f 18 -g https://www.youtube.com/watch?v=2pO-qXoqBxc)"`

5hr Birds:

`cvlc --no-audio --rate 3 "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=du5QtndmeCQ)"`

`cvlc --no-audio --rate 2 "$(yt-dlp -g -f 18 https://www.youtube.com/watch?v=5DAH5GNjRAQ | head -n 1)"`



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