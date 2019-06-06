FROM ubuntu:18.04
RUN apt update && apt install wget unzip python3.6 python3-pip -y && \
    pip3 install selenium && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb  &&\
    dpkg -i google-chrome-stable_current_amd64.deb || apt install -yf && \
    rm -f google-chrome-stable_current_amd64.deb && \
    latestVersion=`wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget https://chromedriver.storage.googleapis.com/$latestVersion/chromedriver_linux64.zip && \ 
    unzip chromedriver_linux64.zip && \
    rm -f chromedriver_linux64.zip
ENTRYPOINT [ "python3" , "/selenium-vol/scripts/main.py" ]