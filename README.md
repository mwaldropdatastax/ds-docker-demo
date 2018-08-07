My goal here was very simple.  I wanted an environment for my laptop where I could easily test, destroy, and otherwise play based with the Docker dev images.  The entire purpose if this effort was to Keep It Simple !  There are lots of advanced techniques if this was intended for "the real world".  My world is a demo world, and reality is merely a concept in this world.

Therefore, it is a single docker-compose file, a single node, a fair amount of hackery to deal with the basics, etc.  THIS IS NOT TO BE CONSIDERED A REAL WORLD EXAMPLE, BEST PRACTICE, OR SUGGESTED PATH.  Just simple and functional.

I may do some additional tweaking to the script over time to simplify other common things, but to use this example, you will need a fairly functional knowledge of Docker and all of it's concepts to make effective use of the environment.  However, this gives a great head start.


#### Update:
I've updated everything to grab the latest code based on the DSE 6 release.  I've also added a new script titled "init.sh" that sets up the initial copies of the config files from within the images to the mounted host volume config.  This allows you to quickly jump into to some of the common config files to make changes for a new demo environment.

#### Note:  

>You will notice in the docker-compose.yml there is an external network defined.  This is required to workaround a Docker issue that prevents proper functionality because of the default behavior of using underscores in the service names.  That is why the init.sh script checks and creates an external Docker network on startup, to avoid this issue.  If it looks like a hack, it's because it is a hack.  Unfortunately at this point, it seems to be the most common workaround for this Docker issue.

#### References:

https://store.docker.com/images/datastax?tab=description

https://hub.docker.com/r/datastax/dse-opscenter/

https://hub.docker.com/r/datastax/dse-studio/

#### Install:

1) Download and install Docker on the Mac.  I haven't tested on a PC, but should work in a similar way.  I suppose the script would need some attention.

2) *Optional* Just doing the docker up will automaticall pull the docker images, but you can also explicitly pull them if you like.  (DSE, Opscenter, Studio)
```
docker pull datastax/dse-server

docker pull datastax/dse-opscenter

docker pull datastax/dse-studio

```
3) Create a folder to place the docker-compose.yml and the init.sh into.

4) I created a script to does a little house keeping to make things easier.  It creates the necessary mount folders to persist data outside the docker containers, and also gives you a place to access and update config files easily.  To launch the demo environment, simply execute the script:
```
./init.sh
```
5) Once everything is running, you can connect to Opscenter using the url:
	http://localhost:8888/

connect to the existing cluster using the service name 'dse' as the hostname

6) Launch studio using the URL:
	http://localhost:9091
set the connection using the service name 'dse' as the hostname

7) You can use the config.sh script to copy a few of the key initial config files to the config directory that is mounted to the host OS (./config).  This makes it easier to just jump in and make tweaks to common files like dse.yaml, cassandra.yaml, etc.  If the config file you need is not there, don't worry.  Just connect to the running container, copy the config file you want to modify to the /conf directory within the image, and then when you look at the mounted ./config directory on the host - you can modify that config file.

>Again note:  This is not a typical production implementation pattern.  This is for "quick and dirty" demo and development environments really.

All the basics seem to be working and I'm just starting to validate more functionality.  
