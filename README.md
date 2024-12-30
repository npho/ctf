# CTF

Repo for messing around with capture the flag (CTF) challenges.

### Toolkit Container

1. Set up Lima.

    ```shell
    brew install lima
    limactl create --name=default template://docker
    ```

2. Edit the Lima Docker template to support x86 on Apple Silicon, add the following to the top of the template file [[www](https://lima-vm.io/docs/config/multi-arch/)].

    ```yaml
    arch: "x86_64"
    ```

3. Build an x86 Docker image on MacOS using Lima.
   
    ```
    lima docker build -t npho/ctf:0.1 .
    ```

    **A**: You can use `lima` as a shortcut for `limactl shell`.
    
    **B**: Setting `LIMA_INSTANCE=default` you can avoid having to specify the instance name. Useful if it's not `default`.
    
4. Run the x86 Docker image on MacOS using Lima.

    ```shell
    lima docker run -v $(pwd):/home/ubuntu/ctf -it npho/ctf:0.1
    ```
