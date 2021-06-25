# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.8

# Install xterm.
RUN add-pkg xterm

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Deduper"
#Project Files
ADD main.py .
ADD deletedupes.py .
ADD makehashes.py .
ADD requirements.txt .
ADD guifunctions.py .
#install python
RUN add-pkg py3-pip
RUN add-pkg python3
#pip management
RUN pip3 install --upgrade pip
#install dependencies
RUN pip3 install -r requirements.txt
##Add tkinter
RUN add-pkg python3-tkinter
ENV DISPLAY=127.0.0.1:0.5800
CMD [ "python3", "./main.py" ]
