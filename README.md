My goal here was very simple.  I wanted an environment for my laptop where I could easily test, destroy, and otherwise play based with the Docker dev images.  The entire purpose if this effort was to Keep It Simple !  There are lots of advanced techniques if this was intended for "the real world".  My world is a demo world, and reality is merely a concept in this world.

Therefore, it is a single docker-compose file, a single node, a fair amount of hackery to deal with the basics, etc.  THIS IS NOT TO BE CONSIDERED A REAL WORLD EXAMPLE, BEST PRACTICE, OR SUGGESTED PATH.  Just simple and functional.

I may do some additional tweaking to the script over time to simplify other common things, but to use this example, you will need a fairly functional knowledge of Docker and all of it's concepts to make effective use of the environment.  However, this gives a great head start.

*** Note:  You will notice in the docker-compose.yml there is an external network defined.  This is required to workaround a Docker issue that prevents proper functionality because of the default behavior of using underscores in the service names.  That is why the init.sh script checks and creates an external Docker network on startup, to avoid this issue.  If it looks like a hack, it's because it is a hack.  Unfortunately at this point, it seems to be the most common workaround for this Docker issue.

REFERENCES:
https://store.docker.com/images/datastax?tab=description

https://hub.docker.com/r/datastax/dse-opscenter/

https://hub.docker.com/r/datastax/dse-studio/


1) Download and install Docker on the Mac.
2) Go to https://store.docker.com/ and register an ID.  You must authenticate using an ID to download the DSE image.
3) Login to the docker store (enter credentials created in step 2)

    docker login

4) Pull the 3 docker images (DSE, Opscenter, Studio)


    docker pull store/datastax/dse-server:5.1.5

    docker pull datastax/dse-opscenter

		docker pull datastax/dse-studio

5) Create a folder to place the docker-compose.yml and the init.sh into.

6) I created a script to does a little house keeping to make things easier.  It creates the necessary mount folders to persist data outside the docker containers, and also gives you a place to access and update config files easily.  To launch the demo environment, simply execute the script:

	./init.sh

7) Once everything is running, you can connect to Opscenter using the url:
	http://localhost:8888/

connect to the existing cluster using the service name 'dse' as the hostname

8) Launch studio using the URL:
	http://localhost:9091
set the connection using the service name 'dse' as the hostname

All the basics seem to be working and I'm just starting to validate more functionality.  
