# latex-docker

[![ghcr](https://ghcr-badge.egpl.dev/rumexcrisp/latex-docker/latest_tag?label=latest)](https://github.com/rumexcrisp/latex-docker/pkgs/container/latex-docker)
[![ghcr](https://ghcr-badge.egpl.dev/rumexcrisp/latex-docker/tags)](https://github.com/rumexcrisp/latex-docker/pkgs/container/latex-docker)
[![image-size](https://ghcr-badge.egpl.dev/rumexcrisp/latex-docker/size)](https://github.com/rumexcrisp/latex-docker/pkgs/container/latex-docker)
[![Build and publish](https://github.com/rumexcrisp/latex-docker/actions/workflows/build.yml/badge.svg)](https://github.com/rumexcrisp/latex-docker/actions/workflows/build.yml)

A Docker-based LaTeX distribution with support for BibLaTeX and automatic compression.

## Prerequisites

It is assumed you already have the following packages installed. They area available for pretty much any OS.

- [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/)
- [Visual Studio Code](https://code.visualstudio.com/)
  - [LaTeX Workshop Extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

## Usage

This docker is intended to use as a remote container. Create your custom latex project folder and open in VSCode. Inside create a `.devcontainer` folder including a [`devcontainer.json`](.devcontainer/devcontainer.json) file.

```json
{
  "name": "latex-docker",
  "image" : "rumexcrispp/latex-docker:latest",
  "customizations": {
      "vscode": {
          "extensions": ["james-yu.latex-workshop"]
      }
  }
}
```

Specify your project name, the image to use ([`rumexcrisp/latex-docker`](https://github.com/rumexcrisp/latex-docker/pkgs/container/latex-docker)) and the necessary extension.

Open the VSCode command palette with <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>P</kbd> and run the command `Dev Containers: Rebuild and Reopen in Container`. See following screenshot.

![screenshot of command palette](doc/images/command_palette.png)

Start editing your latex files. If you use the example [`devcontainer.json`](.devcontainer/devcontainer.json) file, the output PDF will also be compressed.

### Indentation

To enable indentation of latex files, place the example `localSettings.yaml` inside each folder where your `*.tex` files live.

## Pull the Image Manually

```sh
docker pull ghcr.io/rumexcrisp/latex-docker:main
```
