# docker-node-oracle


Docker image to be used for building a container ready with Oracle instant client binaries and all necessary environment variables needed to use the primary Node.js Oracle Database driver libraries:

[strong-oracle](https://github.com/strongloop/strong-oracle)  
[node-oracledb](https://github.com/oracle/node-oracledb)


## Usage

Within your Dockerfile:

```
FROM collinestes/docker-node-oracle:{VERSION}
```


## Versions

Specify the Node.js/io.js version you would like to use in the above *{VERSION}*.  Check [the different branches available on this repo](https://github.com/CollinEstes/docker-node-oracle/branches) to see available versions.

>If you would like to use a version that is currently not a branch of this repo, submit a PR with the updated Dockerfile with the edit too:

```
FROM iojs:{VERSION}
```

or
```
FROM node:{VERSION}
```

### :latest

Using "latest" as the version will use the latest iojs base image





