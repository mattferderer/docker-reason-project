# This is currently failing.

Docker should be installed prior to starting this.

Clone this repository with a simple Dockerfile. The recursive tag also clones the [Reason Project](https://github.com/reasonml/ReasonProject) as a submodule. 

```bash
git clone https://github.com/mattferderer/docker-reason-project.git --recursive
```

Open the directory of the git repo and then build the Dockerfile in there naming it ReasonProject.

```bash
cd docker-reason-project
build . -t ReasonProject
```

After our build is complete we can cd into the submodule git repo named ReasonProject that was included in the original git repo we cloned. The docker run command will start our docker image we just created and create a shared volume that links our current ReasonProject directory we're in with one in the container.

```bash
cd ReasonProject
docker run -v `pwd`:/ReasonProject -it ReasonProject bash
```

If it fails and there is a message about winpty, try appending that to the command above:  ```winpty docker run -v `pwd`:/ReasonProject -it ReasonProject bash```. That's required on older Windows operating systems.

You should now be logged into your container's console. To the left of your cursor should say something like ```root@someRandomNumbers:/ReasonProject#```

Now that we have a Ubuntu machine at our disposal we can install the npm packages. If you're on Windows, you may need to use the --no-bin-links command below. Windows has issues with sym-links on virtual machines. Thanks to yawaramin on [Discord ReasonML chat](https://discord.gg/a8M5m) for this tip. You can read this [issue on GitHub](https://github.com/npm/npm/issues/9901) for more info.

```bash
npm install --no-bin-links

```