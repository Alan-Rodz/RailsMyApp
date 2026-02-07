# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.4.4

* System dependencies
```
ruby
```

* Configuration

* Database creation and initialization
```
bin/rails db:migrate
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
1. Ensure EC2 Instance has been created
2. Ensure a Docker Registry on the AWS Account
3. Set the KAMAL_REGISTRY_PASSWORD by updating .env

```
aws login

// put the output in .env
aws ecr get-login-password --region us-east-1
```

4. Set the contents of `deploy.yml` to the right values for `servers.web`, `proxy` and `registry`, e.g.
```
proxy:
  ssl: true
  host: app.alanrodz.com

registry:
  server: 845669703441.dkr.ecr.us-east-1.amazonaws.com
  username: AWS
  password:
    - KAMAL_REGISTRY_PASSWORD

servers:
 web:
  - ec2-3-90-185-34.compute-1.amazonaws.com

ssh:
 user: ubuntu
 keys:
   ~/.ssh/MyAppKeyPair.pem

``` 
5. Configure `production.rb` correctly
```
config.action_mailer.default_url_options = { host: "app.alanrodz.com" }
config.assume_ssl = true
config.force_ssl = true
config.hosts = [
 "app.alanrodz.com"
]

6. Ensure there configured domain has an A DNS record pointing to the EC2 IP 

7. Have Docker running

8. Execute the following commands
```
export $(cat .env | xargs)
bundle exec kamal build push
bundle exec kamal deploy
bundle exec kamal exec bin/rails db:migrate
```

* Running the application locally
```
bin/dev
```
