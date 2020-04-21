# Local Wordpress in Kubernetes

Make Wordpress in Kubernetes with filesync.
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
    
  * Start Tilt in /kubernetes-dev-env -folder
  
    `cd ..`
    
    `tilt up`
    
  * After the deploy of Wordpress is ready, upload `database.sql` in localhost:3306. Default password is *password*.
  
  (With Linux you can use script, and click refresh -button in Tilt's browser view, **after the deploy of Wordpress is ready**.)

At this stage you can make changes inside theme folder and system will upload files inside containers.

   Wordpress admin username: *demouser*, password: *password*

### Shutting down

  * Closing Tilt
  
  `CTRL + C`
  
  * Shutting down Kubernetes services, deployments etc.
  
  `tilt down`
  
  * Close Kubernetes
  
  `minikube stop`
