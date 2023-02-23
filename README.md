# docker-jackett
Jackett

### How to use?

- Install [docker](https://docs.docker.com/installation/#installation).

- Run the container:
```
docker run -d --name jackett -v $PWD/config:/config -p 80:9117 ghcr.io/viranch/jackett
```

- Navigate to `http://your-ip/`. You can change the port with the `-p` switch, eg: `-p 8000:9117`.
