# Local Wordpress in Kubernetes

This is an example, how to make Wordpress in Kubernetes with filesync to theme folder.
------

You need Kubernetes (such as [Minikube](https://minikube.sigs.k8s.io/docs/) ) and Docker.
Also you should have some kind MySQL tool ([MySQL Workbench](https://dev.mysql.com/downloads/workbench/)).

To create live filesync you also need [Tilt](https://tilt.dev/).
At the moment in Windows, you must add it to `$PATH` manually.

Example works in Linux and Windows. I assume it work on macOS too.

## Instructions

### Starting up
  * Clone *this* repository to your computer
  
    `git clone https://github.com/Eskilmar/kubernetes-dev-env`
  * Clone example theme to **/theme/ -folder**, from here: https://github.com/Eskilmar/welcome-to-kubernetes-theme/
  
    `cd theme`
    
    `git clone https://github.com/Eskilmar/welcome-to-kubernetes-theme/`
    
  * Start your Kubernetes 
  
    `minikube start`
  * Start Tilt 
  
    `tilt up`
    

At this stage you can make changes 
