FROM ubuntu
## Update apt-get - only show errors
RUN apt-get -qq update
## Add nodejs, npm 
RUN apt-get install -y nodejs npm git
## Make node call nodejs since most packages expect node but Ubuntu refers to it as nodejs
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
## Add VOLUME projects to host & set as working directory
VOLUME ["/ReasonProject"]
WORKDIR "/ReasonProject"
CMD bash