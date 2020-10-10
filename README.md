# 3Rein CI Tools

<img src="https://github.com/3rein/3rein-common-logo/blob/develop/back-hand_team.svg" width="200" height="200">

## Purpose of this image
The 3Rein CI Tools docker image is used by few of our Concourse's pipelines. It's essentially a collection of utilities used to perform generic tasks.

This docker image uses the latest versions of `cloud-sdk`, `fly`, `gomplate`, `yq`. In order to update the docker images, you can create a new git tag
that will be picked up by [Docker hub](https://hub.docker.com/r/3rein/ci-tools) in order to build a new version of the image.