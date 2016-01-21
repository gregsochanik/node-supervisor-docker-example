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

`build_image`  
* creates a docker image from node:4.2 and installs supervisord

`run_all`  
* generates 2 docker containers running nodejs under supervisorctl
* passes the env specific supervisor.conf 
* runs nginx and passes `nginx/conf.d` to container, set up with a reverse proxy to these 2 linked containers (web00 and web01)

#####Still to do
* Add dockerignore file and pass in whole local file tree to docker image, would then be more portable
* Attempt to shut down each container one by one for zero downtime deployment
