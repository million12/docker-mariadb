# MariaDB 10 Docker Image (Centos7)
[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-mariadb/master.svg)](https://circleci.com/gh/million12/docker-mariadb/tree/master)
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-mariadb.svg)](https://github.com/million12/docker-mariadb/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-mariadb.svg)](https://github.com/million12/docker-mariadb)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-mariadb.svg)](https://github.com/million12/docker-mariadb)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/mariadb.svg)](https://hub.docker.com/r/million12/mariadb)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/mariadb.svg)](https://hub.docker.com/r/million12/mariadb)  
[![](https://images.microbadger.com/badges/version/million12/mariadb.svg)](http://microbadger.com/images/million12/mariadb)
[![](https://images.microbadger.com/badges/license/million12/mariadb.svg)](http://microbadger.com/images/million12/mariadb)
[![](https://images.microbadger.com/badges/image/million12/mariadb.svg)](http://microbadger.com/images/million12/mariadb)  


This is a MariaDB 10 Docker [million12/mariadb](https://registry.hub.docker.com/u/million12/mariadb/) image. Built on top of official [centos:7](https://registry.hub.docker.com/_/centos/) image. Inspired by [Tutum](https://github.com/tutumcloud)'s [tutum/mariadb](https://github.com/tutumcloud/tutum-docker-mariadb) image.

Note: be aware that, by default in this container, MariaDB is configured to use ~1GB memory (innodb_buffer_pool_size in [tuning.cnf](container-files/etc/my.cnf.d/tuning.cnf)). If you try to run it on node with less memory, it will fail.

Please use tags on Docker Hub for different versions.

## Usage

Run the image as daemon and bind it to port 3306:  
`docker run -d -p 3306:3306 million12/mariadb`

Run the image as daemon and specify MariaDB version 10.2:  
`docker run -d million12/mariadb:10.2`

The first time that you run your container, a new user admin with all privileges will be created in MariaDB with a random password. To get the password, check the logs of the container by running:  
`docker logs <CONTAINER_ID>`  

You will see an output like the following:

```
	========================================================================
    You can now connect to this MariaDB Server using:

        mysql -uadmin -pCoFlnc3ZBS58 -h<host>

    Please remember to change the above password as soon as possible!       
    MariaDB user 'root' has no password but only allows local connections
    ========================================================================
```  
In this case, `CoFlnc3ZBS58` is the password assigned to the `admin` user.

### Custom Password for user admin
If you want to use a preset password instead of a random generated one, you can set the environment variable MARIADB_PASS to your specific password when running the container:  

`docker run -d -p 3306:3306 -e MARIADB_PASS="mypass" million12/mariadb`

### Data volumes

MariaDB stores data in `/var/lib/mysql` location. Mount a volume
to that location - below is an example with docker-compose how to do that:

```
version: '2'

volumes:
  dbdata:

services:
  db:
    image: million12/mariadb:latest
    volumes:
      - dbdata:/var/lib/mysql
```


## Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  

---

**Sponsored by [Prototype Brewery](http://prototypebrewery.io/)** - the new prototyping tool for building highly-interactive prototypes of your website or web app. Built on top of [Neos CMS](https://www.neos.io/) and [Zurb Foundation](http://foundation.zurb.com/) framework.
