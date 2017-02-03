FROM ubuntu

## Update apt-get - only show errors
RUN apt-get -qq update
## Add nodejs, npm 
RUN apt-get install -y nodejs npm git
## Make node call nodejs since most packages expect node but Ubuntu refers to it as nodejs
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
## Run create directory for Project
RUN mkdir /projects && cd /projects
## Add VOLUME projects to host & set as working directory
VOLUME ["/projects"]
WORKDIR /projects
## Download and install the Reason Starter Project
RUN git clone https://github.com/reasonml/ReasonProject.git 
RUN cd ReasonProject && npm install
## Expose a port to host
EXPOSE 8888
CMD bash
