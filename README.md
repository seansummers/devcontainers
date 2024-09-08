# Dev Container Features


## Contents

This repository contains a collection of Dev Container Features:

## Debian/Ubuntu devcontainers-features

### `1password`


```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:debian",
    "features": {
        "ghcr.io/seansummers/devcontainers/1password:1": {}
    }
}
```


## Amazon Linux 2023 devcontainer-features

### `al2023-base`

```jsonc
{
    "image": "public.ecr.aws/amazonlinux/amazonlinux:2023",
    "features": {
        "ghcr.io/seansummers/devcontainers/al2023-base:1": {},
    }
}
```

### `al2023-docker-in-docker`

```jsonc
{
    "image": "public.ecr.aws/amazonlinux/amazonlinux:2023",
    "features": {
        "ghcr.io/seansummers/devcontainers/al2023-docker-in-docker:1": {},
    }
}
```

### `al2023-aws-utils`

```jsonc
{
    "image": "public.ecr.aws/amazonlinux/amazonlinux:2023",
    "features": {
        "ghcr.io/seansummers/devcontainers/al2023-aws-utils:1": {},
    }
}
```

#### Recommendations

It is also recommended that you add the following mounts to your `devcontainer.json`:

```jsonc
    "mounts": [
        "source=${env:HOME}${env:USERPROFILE}/.ssh,target=/home/vscode/.ssh,type=bind",
        "source=${env:HOME}${env:USERPROFILE}/.aws,target=/home/vscode/.aws,type=bind"
    ]
```
