# docker build --network=host --build-arg UID=$UID -f launchtools/StandardDockerfile.docker -t rahmnathan/swarmui:1 .

FROM mcr.microsoft.com/dotnet/sdk:8.0-bookworm-slim

ARG UID=1000

# Install python
RUN apt update
RUN apt install -y git wget build-essential python3.11 python3.11-venv python3.11-dev python3-pip ffmpeg

# Install dependencies for controlnet preprocessors
RUN apt install -y libglib2.0-0 libgl1

# Stupidproofing on git calls from inside docker
RUN git config --global --add safe.directory '*'

# Ensure a user exists within docker for the given uid
RUN useradd -u $UID swarmui

# Expose the port for other containers (to use Swarm as an API if you want)
EXPOSE 7801

USER $UID

COPY run-swarm-ui.sh run-swarm-ui.sh

ENTRYPOINT ["bash", "run-swarm-ui.sh"]
