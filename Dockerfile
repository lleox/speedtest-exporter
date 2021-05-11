FROM arm32v7/node:9.11.1

ARG PORT=9696

ENV PORT=$PORT
ENV HOME /home

WORKDIR /tmp

RUN curl https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-arm-linux.tgz -o /tmp/ookla-speedtest-1.0.0-arm-linux.tgz && \
	tar zxvf ookla-speedtest-1.0.0-arm-linux.tgz && \
	mv speedtest /usr/local/bin/speedtest && \
	chmod +x  /usr/local/bin/speedtest


RUN mkdir -p $HOME
WORKDIR $HOME

COPY . /home

RUN npm install --quiet

EXPOSE $PORT

CMD ["npm", "run", "start"]
