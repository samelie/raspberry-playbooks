## 2023-11-24



```
ffmpeg -r 30 -i "$(yt-dlp -g -f 133  'https://www.youtube.com/watch?v=vb7vJXSrwAI')" -preset ultrafast -vf negate -tune zero_latency -f mpegts -omit_video_pes_length 1 udp://192.168.50.35:8765
```



## 2023-11-22

Suddenly after flashing a new image, :`pi@192.168.50.128: Permission denied (publickey).` Seems like Imager gets bugged out, I had to clear all the settings and repast the .pub key .

- Working with https://github.com/samelie/IP-serial-module

  - ```
    ssh pi@192.168.10.226
    # run server to change serial: http://192.168.50.226:3000/public/
    node ./ip-serial/server/server.js --serialPath=/dev/ttyUSB0 --port 3000
    ```

- Valid IP addresses
  -  192.168.50.245
  - 192.168.50.35
  - 192.168.50.128
  - 192.168.50.44

## Images

- 3 B+
  - Bookworm with all extras
  - 32GB card
- Zero W
  - Buster Lite https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf/images/raspios_oldstable_lite_armhf-2022-04-07/
  - 16GB

## Ansible

Make a `config` and a `playbook` for each Raspberry PI model.

After. Flash

1. config the PI:  `ansible-playbook  -i inventory/pis config-zeros-playbook.yml`
   1. Might need to ssh on and run `sudo apt update` (something about oldoldstable errors)

2. Install all deps `ansible-playbook  -i inventory/pis zero-playbook.yml`

## Extra

### cvlc

yt-dlp can output 2 lines

```
 cvlc --aspect-ratio 4:3  --no-audio --rate 2 `"$(yt-dlp -g -f 18  https://www.youtube.com/watch?v=_hJ9t28D4EI |  head -n 1)"`

## Good visuals
export DISPLAY=:0
cvlc --no-audio --loop --repeat --crop=4:3  "$(yt-dlp -g -f 18  https://www.youtube.com/watch?v=vb7vJXSrwAI)"


```

Shame the `--video-filter`  doesn't work on the Pis (`  mmal_codec filter error: Failed to enable output port vc.ril.hvs:out:0(OPQV) (status=3 EINVAL) `) . Docs: https://wiki.videolan.org/VLC_HowTo/Adjust_image_settings/

