### Docker nginx reverse proxy to supervisor monitored node containers

Clone this repo and then do the following to run:  

* `make build_image`
* `make run_all ENV=(dev|uat|prod)`
* `curl -v "http://localhost"`

You should see the following:

```json
{
  "instance": "web00/web01",
  "environment": "dev"
}
```

### Whats happening

build_image
* creates a docker image from node:4.2 and installs supervisord

run all 
* generates 2 docker containers running nodejs under supervisorctl
* passes the env specific supervisor.conf 
* runs nginx and passes the default ngix.conf file set up with a reverse proxy to these 2 linked containers (web00 and web01)

#####Still to do
* The nginx.conf is currently hard coded to the default generated ip addresses, this is obvs not great, would be better if it built the conf on the fly
* Add dockerignore file and pass in whole local file tree to docker image, would then be more portable
