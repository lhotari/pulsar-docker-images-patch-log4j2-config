# Patch pulsar-all images 2.6.2 and 2.7.0 with performant log4j2 config

See
- https://github.com/apache/pulsar/pull/8908
- https://github.com/apache/pulsar/pull/8944

Since changes are to the `bin/pulsar` wrapper script, it's easy to build docker images that 
are have the original docker images as parent, but only change the wrapper script.

## Building patched docker images

Building and pushing to an internal repository
```
./patch_pulsar_docker_images.sh internal-repository.domain.com
```

Building and pushing to an internal repository
```
./patch_pulsar_docker_images.sh internal-repository.domain.com
```