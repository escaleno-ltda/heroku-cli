# heroku-cli
Docker image with alpine, heroku and docker

## Example with gitlab-ci

```yml
production:
  stage: deploy
  image: escaleno/heroku-cli:7.42.2
  services:
    - docker:dind
  variables:
    DOCKER_HOST: tcp://docker:2375
  before_script:
    # login to heroku container registry
    - heroku container:login
    # Build docker image
    - docker pull registry.heroku.com/$HEROKU_APP/web:latest
    - docker build -t registry.heroku.com/$HEROKU_APP/web --pull --cache-from registry.heroku.com/$HEROKU_APP/web:latest .
  script:
    # Push new docker image
    - docker push registry.heroku.com/$HEROKU_APP/web
    # Trigger new release
    - heroku container:release web --app $HEROKU_APP
  only:
    - master
```
