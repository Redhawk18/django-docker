# Choose a base image, I always recommend the slim image until it causes problems.
FROM python:3.11-slim

# We want a clean space, not just randomly thrown files in the root of the container
WORKDIR /app

# Copy our required files into the container,
# however I recommend we don't do this and we mount our project as a volume.
# How it is currently setup requires us to rebuild the container on every tiny typo fix
# I can showcase that later
COPY ./requirements.txt /app/requirements.txt
COPY ./src/ /app/src

# Next step is to run normal bash commands to create our container
# Remember this is a debian-based container not RHEL.
# However some images are Alpine based, just something to keep in mind.
RUN apt update
RUN pip install --no-cache-dir -r requirements.txt


# Our file step is to tell our container what it's main process to start is.
# Remember one process per container.
CMD [ "python3", "src/manage.py", "runserver" ]

