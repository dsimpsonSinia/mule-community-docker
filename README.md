# Mulesoft

Mulesoft is an ESB which encourages a SOA, but is flexable and can fit almost any integration need.
To learn more, go to [Mulesoft's website](http://www.mulesoft.com)

## Community Edition

This copy of the runtime is known as "Community Edition", which means it is an opensource, free to use copy of mulesoft under the [CPAL license](https://github.com/mulesoft/mule/blob/master/LICENSE.txt).

## Running Mule

This image contains an entrypoint, so you do not need to use this as a base image if you can add your compiled mule api to the volume.

Running this image is as easy as:

```shell
docker run -d --name mule4ce dtsimpson1/mule4ce
```

### Volumes

There are 4 volumes defined to make it easier to deploy apps and domains, view logs, and install patches.
- `/opt/mule/apps`
- `/opt/mule/domains`
- `/opt/mule/logs`
- `/opt/mule/lib/patches`

### Ports

This image only exposes ports 80 and 443. Thus, if you are deploying multiple artifacts to the same container, you have two options:

1. Use this image as a base image and add your additional ports in your own image.
2. Take advantage of Mule domains and share an HTTP listener on the single port.

### Deploying Artifacts (APIs)

To deploy an exported API, simply drop the .jar into the `/opt/mule/apps` directory in the container. One of the easiest ways to do this during development is to mount the volume to your host machine with the volume flag `-v ~/mule/apps:/opt/mule/apps`. The mule runtime will automatically detect the artifact, unzip it, and start it up. You will see a message print in the logs stating `Started app ...`.

### Full Run Command

Combining everything above into a single command (which can be modified as you wish):

```bash
docker run -d --name mule4ce -v ~/mule/logs:/opt/mule/logs -v ~/mule/apps:/opt/mule/apps -v ~/mule/domains:/opt/mule/domains -v ~/mule/patches:/opt/mule/lib/patches -p 8080:80 dtsimpson1/mule4ce
```

## How do I make a Mule API?

Mulesoft provides lots of great documentation on this, but a link I would recommend if you are a quick learner is [here](https://docs.mulesoft.com/mule-runtime/4.3/mule-app-dev-hellomule).
