# CTF

Repo for messing around with capture the flag (CTF) challenges.

### Toolkit Container

1. Set up Lima (`brew install lima`) for Docker (x86) on MacOS.

    ```shell
    limactl create \
      --name=default \
      --arch=x86_64 \
      --mount-type=reverse-sshfs \
      template://docker
    ```
    
2. Build an x86 Docker image on MacOS using Lima.
   
    ```shell
    lima docker build -t npho/ctf:0.1 .
    ```

    **A**: You can use `lima` as a shortcut for `limactl shell`.
    
    **B**: Setting `LIMA_INSTANCE=default` you can avoid having to specify the instance name. Useful if it's not `default`.
    
3. Run the x86 Docker image on MacOS using Lima.

    ```shell
    lima docker run -v $(pwd):/home/ubuntu/ctf -it npho/ctf:0.1
    ```
