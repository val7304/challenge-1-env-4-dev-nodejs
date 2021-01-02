## Challenge-2-dev-nodejs

bash provisioning script running on ubuntu 18.0.4

Tools for Nodejs development environment including: 
Nodjs and associated NPM, nginx, MongoDB, Angular CLI, Docker Community Edition.

Make sure you have Vagrant and VirtualBox installed.

-----
* Clone this repository and run cmder or git bash in your folder: 
git clone https://github.com/val7304/challenge-2-dev-nodejs.git
          Username: val7304
          Password: 85fba2ca22a6c199edb99972ff7998b37a8cd7a9
 * Add folder 'projects' into your folder 'challenge-2-dev-nodejs'
 * Then run 'vagrant up'

When the script finish, verify installations on your local server: 

* nginx:      http://localhost:8080/
* mongoDB:  http://localhost:27017/   
#It looks like you are trying to access MongoDB over HTTP on the native driver port.
* angular/cli app-project:  http://localhost:4200/

*  view your sync folder directory on: cd /vagrant/projects/app-project/
----
If you want going to vagrant ssh, run another cmd with 'vagrant ssh'
and then, run: 

* nginx:              `$ sudo service nginx status`
* Nodejs:             `$ nodejs --version`    #12.20.0
* npm associated:     `$ npm --version`       #6.14.8
* angular/cli:        `$ ng --version`        # 11.0.5

-----
#### securise MongoDB create: create a useradmin - Access control is not enabled for the database: 
run `$ mongo`  and  `$show dbs` , select with  `$ use admin`  and follow steps: 

    $ mongo
    $ show dbs
    
    #admin   0.000GB
    #config  0.000GB
    #local   0.000GB
    
    $ use admin
    #switched to db admin
    
    $ db.createUser(
    ... {
    ... user: "UserAdmin",
    ... pwd: passwordPrompt(),
    ... roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
    ... }
    ... )
    
    #Enter password: 
    #Successfully added user: {
            "user" : "Administrator",
           "roles" : [
                    {
                            "role" : "userAdminAnyDatabase",
                           "db" : "admin"
                   },
                    "readWriteAnyDatabase"
            ]
      }
      
    $ exit
    #By
    
    $ sudo nano /etc/mongod.conf
    #enable security on /etc/mongod.conf
    security:
      authorization: "enabled"
      #pressing CTRL + X, Y, then ENTER.
       sudo systemctl restart mongod
       $ sudo systemctl status mongod
       #mongod.service - MongoDB Database Server
         #Loaded: loaded (/lib/systemd/system/mongod.service; enabled; vendor preset: enabled)
         #Active: active (running) since Mon 2020-12-28 21:08:05 UTC; 7s ago
     #Docs: https://docs.mongodb.org/manual
      #Main PID: 9579 (mongod)
         #CGroup: /system.slice/mongod.service
           #└─9579 /usr/bin/mongod --config /etc/mongod.conf
           #Dec 28 21:08:05 dev-nodejs systemd[1]: Started MongoDB Database Server.

#### Check mongoDB version with and run: 

    $ mongo
    #MongoDB shell version v4.4.2
    #connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
    #Implicit session: session { "id" : UUID("2dcef49d-8957-4f19-93e6-9d3e8ead1aa5") }
    #MongoDB server version: 4.4.2
-------

#### Docker CE: 

During installation script with vagrant: 

    echo "Docker CE access to download image of Docker Hub "
    echo "-------------------------------------------------"   
    docker run hello-world
    #Hello from Docker!
    #This message shows that your installation appears to be working correctly.

In ssh mode, view version installed with:     `$ docker -v`

View images downloaded during installation:  

    $ sudo docker images 
    
    #REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
    #hello-world   latest    bf756fb1ae65   12 months ago   13.3kB


