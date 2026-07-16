# docker-comfyui

Build and run ComfyUI in a container. This build targets NVIDIA by basing it
on the CUDA PyTorch runtime image. The only extra dependencies needed are
`git`, to clone the official ComfyUI repository, and `build-essential` for
`gcc`, which Triton requires. The image pulls a specific, pinned ComfyUI
version via the `COMFYUI_VERSION` build arg. The build merely shallow-clones
the repo and installs its requirements with `pip`. Kept intentionally simple.

### Quick start

1. Build

    ```
    docker compose build
    ```

2. Run

    ```
    docker compose up -d
    ```
