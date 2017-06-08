FROM node:argon

RUN useradd --user-group --create-home --shell /bin/false app &&  npm install --global npm@5.0.1

ENV HOME=/home/app

COPY package.json package-lock.json $HOME/level-server/
RUN touch $HOME/level-server/server.log
RUN chown -R app:app $HOME/*


USER app
WORKDIR $HOME/level-server

RUN npm install --production

EXPOSE 8080
CMD [ "npm", "start" ]
