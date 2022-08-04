# Node-RED Container

[![](https://img.shields.io/github/license/muhlba91/node-red-container?style=for-the-badge)](LICENSE)
[![](https://img.shields.io/github/workflow/status/muhlba91/node-red-container/Container?style=for-the-badge)](https://github.com/muhlba91/node-red-container/actions)
[![](https://img.shields.io/github/release-date/muhlba91/node-red-container?style=for-the-badge)](https://github.com/muhlba91/node-red-container/releases)
[![](https://quay.io/repository/muhlba91/node-red/status)](https://quay.io/repository/muhlba91/node-red)
<a href="https://www.buymeacoffee.com/muhlba91" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="28" width="150"></a>

An opinionated containerized version of [Node-RED](https://nodered.org).

---

## Installation Notes

Create your Node-RED configuration files locally and start the container:

```shell
$ docker run --name node-red \
  --network host \
  -v ${PWD}/config:/data \
  quay.io/muhlba91/node-red:<TAG>
```

### Container Tags

The container images are tagged according to:

1. the Node-RED version (`quay.io/muhlba91/node-red:<NODE_RED_VERSION>`) - **Note:** this tag will be re-used on every release with the same Node-RED version!
2. the Node-RED version and current release (`quay.io/muhlba91/node-red:<NODE_RED_VERSION>-<RELEASE>`)
3. the Git Commit SHA (`quay.io/muhlba91/node-red:<GIT_COMMIT_SHA>`)

### Helm Chart

The [k8s-at-home chart for Node-RED](https://github.com/k8s-at-home/charts/tree/master/charts/stable/node-red) is the recommended chart to use this container with.

For example, to mount a `packages.txt` file from a ConfigMap you can add the folloiwng block to your `values.yaml` file:

```yaml
persistence:
  packages:
    enabled: true
    type: custom
    mountPath: /init/packages.txt
    subPath: /init/packages.txt
    volumeSpec:
      configMap:
        name: packages-configmap
```

---

## Configuration

Mount your Node-RED configuration files in `/data` when running the container.

Alternatively, you can mount a `settings.js` file in `/init/settings.js` which will be copied the `/data` upon starting up.

If you want to install additional packages on start-up, create a file `packages.txt` and mount it in `/init/packages.txt`:

```txt
package@version
```

---

## Contributing

We welcome community contributions to this project.

## Supporting

If you enjoy the application and want to support my efforts, please feel free to buy me a coffe. :)

<a href="https://www.buymeacoffee.com/muhlba91" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="75" width="300"></a>
