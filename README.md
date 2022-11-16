# DESCRIPTION

Dockerfile to develop and build tauri application for Linux systems.

# HOW TO USE

## 0 - Prerequisites

Install Docker on your machine (This container will only work on linux/macOs)

## 1 - Build docker image

run the following command.
with -t you can choose the tag of the container, in this case is "tauri-rust".

In the Dockerfile the working directory is setted as /home/app

```bash
docker build -t tauri-rust .
```

## 2 - Create a new container with new image built

```bash
docker run -itdp 3000:3000 -v $PWD:/home/app --name yourContainerName tauri-rust
```

I suggest to add as volume your working project so that you can modify the content without having to copy/paste inside the container every time

## 3 - (Optional) Create a new project

If you want to create a new project with tauri run 

```bash
npm create tauri-app
```

Otherwise you can just use this container to build your project.
