# CTF

Repo for messing around with capture the flag (CTF) challenges.

### Toolkit Container

1. Build an x86 Docker image on MacOS using Lima.
   
    ```shell
    limactl shell docker-x86 docker build -t npho/ctf:0.1 .
    ```
    
1. Run the x86 Docker image on MacOS using Lima.

    ```shell
    limactl shell docker-x86 docker run -v $(pwd):/home/ubuntu/ctf -it npho/ctf:0.1
    ```
