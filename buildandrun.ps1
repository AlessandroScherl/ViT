# Dieses Skript führt baut und startet den Dockercontainer sowie Jupyter-Lab für den VIT Use-Case.
#
# This code is available under a GPL v3.0 license and comes without
# any explicit or implicit warranty.
#
# (C) Alessandro Scherl 2023 <alessandro.scherl@technikum-wien.at>

# Bau des Images
docker build . -t vit

# Ausführen des Containers 
docker run -it --rm -t -d --ipc=host --name VIT -e DISPLAY=$DISPLAY -p 8888:8888 --mount src="$(pwd)",target=/workspace/,type=bind vit

docker exec VIT /bin/sh -c "jupyter-lab --ip 0.0.0.0 --IdentitiyProvider.token='aiav' --no-browser --allow-root"
