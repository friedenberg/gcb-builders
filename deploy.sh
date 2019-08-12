#! /bin/sh -e

docker build -f docker/Dockerfile.pull_images -t us.gcr.io/zoolander-195215/pull_images .
docker push us.gcr.io/zoolander-195215/pull_images
