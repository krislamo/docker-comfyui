# docker-comfyui

Build and run ComfyUI in a container. This build targets NVIDIA by basing it on
the CUDA PyTorch runtime image. The only extra dependencies needed are `git`, to
clone the official ComfyUI repository, and `build-essential` for `gcc`, which
Triton requires. The image pulls a specific, pinned ComfyUI version via the
`COMFYUI_VERSION` build arg. The build merely shallow-clones the repo and
installs its requirements with `pip`. Kept intentionally simple.

### `.env` configuration

- `IMAGE`
  - Image name
  - Default: `localhost/comfyui`
- `VERSION`
  - Image tag
  - Default: `latest`
- `NAME`
  - Container name
  - Default: `comfyui`
- `RESTART`
  - Restart policy
  - Default: `unless-stopped`
- `ENDPOINT`
  - Host bind
  - Default: `127.0.0.1:8188`
- `DATA`
  - Host directory holding all persistent data
  - Default: `./data`
- `GPU`
  - CDI device
  - Default: `nvidia.com/gpu=all`

### Quick start

1. Build

   ```
   docker compose build
   ```

2. Run

   ```
   docker compose up -d
   ```
