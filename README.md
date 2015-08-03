#DuckDNS

Run the DuckDNS updater for dynamic DNS in a container

##Install On unRaid:

On unRaid, install from the Community Repositories and enter the app folder location.


##Install On Other Platforms (like Ubuntu, Synology 5.2 DSM, etc.):

On other platforms, you can run this docker with the following command:

```
docker run -d --name="Duckdns" -v /path/to/config:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/docker-duckdns
```

###Setup Instructions
- Replace the variable "/path/to/config" with your choice of folder on your system. That is where the config files will reside, and they will survive an update, reinstallation, etc. of the container.
- Visit http://www.duckdns.org to register your subdomain
- After first run, navigate to the config folder and modify the "duck.conf" file to enter your subdomain (not the full domain) and token
- If you have multiple subdomains you would like to update, you can enter all of them separated by commas and NO spaces in between (whatever you put in becomes part of the url and spaces aren't allowed in urls)
- Check the log file 5 minutes later to make sure it is working correctly
