FROM docker.io/pytorch/pytorch:2.6.0-cuda12.4-cudnn9-runtime
ARG COMFYUI_VERSION=v0.28.0
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git tini \
    && rm -rf /var/lib/apt/lists/*
RUN git clone --depth 1 --branch ${COMFYUI_VERSION} \
    https://github.com/Comfy-Org/ComfyUI /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r manager_requirements.txt
EXPOSE 8188
STOPSIGNAL SIGINT
ENTRYPOINT ["tini", "-g", "--"]
CMD ["python", "main.py", "--listen", "0.0.0.0", "--enable-manager"]
