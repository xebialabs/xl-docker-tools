# xl-es-curator
Build Docker image to cleanup your Elasticsearch installation indices.

## Usage
* Customize *config.yml* and *action_file.yml* in config directory. 

* Build docker image:
```
docker build -t xebialabs/xl-es-curator .
```
* Run docker image with pre-defined configuration:
```
docker run --rm --name xl-es-curator xebialabs/xl-es-curator
```  
* (Optional) If you want to provide own config files, you can mount them into docker container:
```
docker run --rm --name xl-es-curator -v $(pwd)/config.yml:/etc/config/config.yml -v $(pwd)/action_file.yml:/etc/config/action_file.yml xebialabs/xl-es-curator
```  

