# Raspberry Pi setup

Configure with `Imager` [source](https://stackoverflow.com/questions/71804429/raspberry-pi-ssh-access-denied)

## Ansible

`ansible-playbook -i inventory/hosts playbook.yml`

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

​		`cvlc -h`

- mpv

  - ```
    apt-get install mpv
    ```