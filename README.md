# MariaDB 10 Docker Image (Alpine ~100Mb)
[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-mariadb/master.svg)](https://circleci.com/gh/million12/docker-mariadb/tree/master)
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-mariadb.svg)](https://github.com/million12/docker-mariadb/issues)  
[![Stars](https://img.shields.io/github/stars/million12/docker-mariadb.svg?style=social&label=Stars)]()
[![Fork](https://img.shields.io/github/forks/million12/docker-mariadb.svg?style=social&label=Fork)]()  
[![](https://img.shields.io/github/release/million12/docker-mariadb.svg)](http://microbadger.com/images/million12/mariadb)  
[![Docker build](http://dockeri.co/image/million12/mariadb)](https://hub.docker.com/r/million12/mariadb/)

Felling like supporting me in my projects use donate button. Thank You!  
[![](https://img.shields.io/badge/donate-PayPal-blue.svg)](https://www.paypal.me/POzgo)


This is a MariaDB 10 in a Docker [million12/mariadb](https://registry.hub.docker.com/u/million12/mariadb/). 

**IMPORTANT: Migarted to Alpine Linux which shrinked the image from 1024M to ~120Mb**

Note: be aware that, by default in this container, MariaDB is configured to use ~1GB memory (innodb_buffer_pool_size in [tuning.cnf](container-files/etc/my.cnf.d/tuning.cnf)). If you try to run it on node with less memory, it will fail.

Please use tags on Docker Hub for different versions.

## Usage

Run the image as daemon and bind it to port 3306:  

```bash
docker run -d \
  -p 3306:3306 \
  million12/mariadb
```

Run the image as daemon and specify MariaDB version 10.2:  

```bash
docker run -d \
  million12/mariadb:10.1
```

The first time that you run your container, a new user admin with all privileges will be created in MariaDB with a random password. To get the password, check the logs of the container by running:  
`docker logs <CONTAINER_ID>`  

You will see an output like the following:

```bash
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

```bash
docker run -d \
  -p 3306:3306 \
  -e MARIADB_PASS="mypass" \
  million12/mariadb
```

### Data volumes

MariaDB stores data in `/var/lib/mysql` location. Mount a volume
to that location - below is an example with `docker-compose` how to do that:

```yaml
version: '2'

volumes:
  dbdata:

services:
  db:
    image: million12/mariadb:latest
    volumes:
      - dbdata:/var/lib/mysql
```

---

## Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  
