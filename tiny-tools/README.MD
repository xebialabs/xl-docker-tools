# Tiny Tools

Based on Alpine. Includes `curl`, `dig`, `nc`, `jq` and `fish` for now.

Needs about 11 MB on Disk.

used in ``xebialabs/tiny-tools``

## Build and publish with script

Use script `build_tiny_tools.sh` to build and publish tiny-tools image
```
./build_tiny_tools.sh $RELEASE_EXPLICIT $DOCKER_HUB_REPOSITORY $BRANCH
```
Where env variables are:
- `RELEASE_EXPLICIT` - version of them releasing image, use `22.0.0-114.1255` pattern
- `DOCKER_HUB_REPOSITORY` - DockerHub repository name, default is `xebialabsunsupported`
- `BRANCH_NAME` - branch from where release will be done, default is `master`

It requires to have at least 1 parameter, to specify which version you would like to release. Make sure, that you provide the SemVer compatible version.

```yaml
./build_tiny_tools.sh 1.0.0
```
By default, it will push it to docker.io/xebialabsunsupported/tiny-tools:1.0.0, but you can also choose another organization, if you want to for example do some modifications or test it before pushing to xebialabsunsupported. For that you can provide a second parameter, for example:

```yaml
./build_tiny_tools.sh 2.1.3 sishwarya
```
then it will publish the operator to docker.io/sishwarya/tiny-tools:1.0.0

```text
You have to login to your docker account before executing the script!
`docker login`
```

## To run and test tiny-tools.

```yaml
docker run -ti xebialabsunsupported/tiny-tools:22.1
```