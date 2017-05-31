# dev vault container for testing
## how to start
```
git clone https://github.com/h4m24/vault-dev-play.git --depth 1
cd vault-dev-play/
docker-compose up -d
bash run.sh # to write secrets to dev vault```
## FYI
- vault root token  for this container is 123
- address is VAULT_ADDR=http://127.0.0.1:8200
