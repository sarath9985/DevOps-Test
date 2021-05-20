#image for python3.7env
FROM python:3.7-alpine
#create dir
RUN mkdir src
#work dir
WORKDIR /src
#copy the file
COPY run.py /src/run.py
#run the file
ENTRYPOINT ["python", "-u", "run.py"]

