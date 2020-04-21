# Local Wordpress in Kubernetes

Make Wordpress in Kubernetes with filesync.
------

You need Kubernetes (such as [Minikube](https://minikube.sigs.k8s.io/docs/) ) and Docker.
Also you should have some kind MySQL tool ([MySQL Workbench](https://dev.mysql.com/downloads/workbench/)).

To create live filesync you also need [Tilt](https://tilt.dev/).
At the moment in Windows, you must add it to `$PATH` manually.

Example works in Linux and Windows. I assume it work on macOS too.

## Instructions

**Windows users:** Have to use terminal with administrator rights, to run Minikube and Tilt

### Starting up
  * Clone *this* repository to your computer
  
    `git clone https://github.com/Eskilmar/kubernetes-dev-env`
  * Clone example theme to **/theme/ -folder**, from here: https://github.com/Eskilmar/welcome-to-kubernetes-theme/
  
    `cd kubernetes-dev-env/theme`
    
    `git clone https://github.com/Eskilmar/welcome-to-kubernetes-theme/`
    
  * Start your Kubernetes 
  
    `minikube start`
    
  * Start Tilt in /kubernetes-dev-env -folder
  
    `cd ..`
    
    `tilt up`
    
  After the Wordpress has deployed, upload `database.sql` in localhost:3306. Default password is *password*.
  
  **OR**
  
  With Linux you can use script, and click refresh -button in Tilt's browser view, **but after the Wordpress has deployed**.
  ![alt text](https://github.com/Eskilmar/kubernetes-dev-env/blob/master/readme-img/upload-db.PNG "Uploading database with automated script")
  
  **OR**
  
  Windows users can use script in Git Bash:
  ```
  mysqlPod=`kubectl get pods -l tier=mysql -o=jsonpath='{.items[0].metadata.name}'` && kubectl exec -it "$mysqlPod" -n default -- mysql -u root -ppassword wordpress < ./database.sql
  ```

------

At this stage you can make changes inside theme folder and system will upload files inside containers.

   Wordpress admin username: *demouser*, password: *password*
   
------

### Shutting down

  * Closing Tilt
  
  `CTRL + C`
  
  * Shutting down Kubernetes services, deployments etc.
  
  `tilt down`
  
  * Close Kubernetes
  
  `minikube stop`
