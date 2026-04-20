Dockerfile: 
![Dockerfile](wyniki-polecen/Dockerfile.png)

Repo: gh repo create pawcho6 --public --source=. --remote=origin --push
![repo](wyniki-polecen/Dockerfile.png)

Build: docker build --ssh default=$SSH_AUTH_SOCK -t ghcr.io/wikluk-lab/pawcho6:lab6 .
![build](wyniki-polecen/Dockerfile.png)

Push: docker push ghcr.io/wikluk-lab/pawcho6:lab6
![push](wyniki-polecen/Dockerfile.png)
