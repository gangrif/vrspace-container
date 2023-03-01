# vrspace-container
A container file for vrspace.org

# What is this project? and what is VRSpace?
Vrspace is an open source implemention of a virtual world server, you can find more information about what it is and who wrote it at https://vrspace.org

This project is simply a definition of a docker/container file to build a container to run vrspace in.  You would then place this container behind some manner of proxy that can handle https termination. 

# How do I run this container?
You can build your own container image from this repo, but I recommend simply pulling and running the following container from Docker Hub. 

  https://hub.docker.com/r/gangrif/vrspace
