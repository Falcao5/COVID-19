FROM python:3.8

# copy all
ADD . /

# install dependencies
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["sh", "run.sh"]