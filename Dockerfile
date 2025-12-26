FROM python:3.11
ADD src/salesapp /salesapp
WORKDIR /salesapp
COPY requirements.txt /tmp
COPY db.ini /salesapp
COPY templates /salesapp/templates
RUN pip install -r /tmp/requirements.txt
ENV FLASK_APP=/salesapp
CMD ["flask", "run", "-h", "0.0.0.0"]