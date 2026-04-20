Dockerfile: 
![Dockerfile](wyniki-polecen/Dockerfile.PNG)

Repo: gh repo create pawcho6 --public --source=. --remote=origin --push
![repo](wyniki-polecen/repo.PNG)

Build: docker build --ssh default=$SSH_AUTH_SOCK -t ghcr.io/wikluk-lab/pawcho6:lab6 .
![build](wyniki-polecen/Build.PNG)

Push: docker push ghcr.io/wikluk-lab/pawcho6:lab6
![push](wyniki-polecen/push.PNG)
