# Mulesoft

Mulesoft is an ESB which encourages a SOA, but is flexable and can fit almost any integration need.
To learn more, go to [Mulesoft's website](http://www.mulesoft.com).

## Community Edition

This copy of the runtime is known as "Community Edition", which means it is an opensource, free to use copy of mulesoft under the [CPAL license](https://github.com/mulesoft/mule/blob/master/LICENSE.txt). You can also contribute to the opensource project [here](https://github.com/mulesoft/mule).

## Running Mule

This image contains an entrypoint, so you do not need to use this as a base image if you can add your compiled mule api to the volume.

Running this image is as easy as:

```shell
docker run -d --name mule4ce dtsimpson1/mule4ce
```

### Volumes

There are 4 volumes defined to make it easier to deploy apps and domains, view logs, install patches, and modify the config.

- `/opt/mule/apps`
- `/opt/mule/domains`
- `/opt/mule/logs`
- `/opt/mule/lib/patches`
- `/opt/mule/conf`

If you bind mount the `conf` folder, you *must* recreate the contents of the folder due to a [limitation in docker](https://docs.docker.com/storage/#tips-for-using-bind-mounts-or-volumes).

If you bind mount the `domains` folder, you *should* create an empty folder in the volume with the name `default`. This is how mule creates the default domain and ensures APIs can run without declaring a domain project.

### Ports

This image only exposes ports 80 and 443. Thus, if you are deploying multiple artifacts to the same container, you have two options:

1. Use this image as a base image and add your additional ports in your own image.
2. Take advantage of Mule domains and share an HTTP listener on the single port.

### Deploying Artifacts (APIs)

To deploy an exported API, simply drop the .jar into the `/opt/mule/apps` directory in the container. One of the easiest ways to do this during development is to mount the volume to your host machine with the volume flag `-v ~/mule/apps:/opt/mule/apps`. The mule runtime will automatically detect the artifact, unzip it, and start it up. You will see a message print in the logs stating `Started app ...`.

### Full Run Command

Combining everything above into a single command (which can be modified as you wish):

```bash
docker run -d --name mule4ce -v ~/mule/logs:/opt/mule/logs -v ~/mule/apps:/opt/mule/apps -v ~/mule/domains:/opt/mule/domains -v ~/mule/patches:/opt/mule/lib/patches -v ~/mule/conf:/opt/mule/conf -p 8080:80 dtsimpson1/mule4ce
```

## What's new?

- Added the mule `./conf` dir to the volumes that can be mounted.

## How do I make a Mule API?

Mulesoft provides lots of great documentation on this, but a link I would recommend if you are a quick learner is [here](https://docs.mulesoft.com/mule-runtime/4.3/mule-app-dev-hellomule).

## Contributing

I welcome contributions if you believe this image is missing anything. You may fork the [repository](https://github.com/dsimpsonSinia/mule-community-docker) and create a Pull Request which I will review.
