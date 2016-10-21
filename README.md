# Flatform
- Ubuntu: latest (current 16.04)
- Apache2: latest (current 2.4) 
  + PHP module: 7 (note: may not latest in future)
    . Phalcon driver: latest (current 3.0)
    . MySQL driver: latest (current 5.7)
    . MongoDB driver: latest (current 3.0) (has not yet)

*Note: "lastest" mean that base on "apt-get" packages.

# Volume
- /var/www for your app code
- /var/log/apache2, optionally, if you want to store logfiles visibly outside the container (Note: prepair your configs file carefully before mounting)
- /etc/apache2, apache configs

# Port 
- Apache2: 80

# CMD
docker run -d -p 8080:80 dekatruong/phalcon-apache2-ubuntu