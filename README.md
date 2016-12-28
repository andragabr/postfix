Postfix docker image to relay emails
====================================

## Run a relay emails server

Example of relay.yml configuration to relay emails to SendGrid:

    ---
    hostname: "relay"
    fqdn: "relay.example.com"
    defaultUser: "root"
    relayHost: "[smtp.sendgrid.net]:2525"
    sendgrid:
      username: "apikey"
      password: "SG.FnpawADeziUlfOcNxmSIPHg.PmBTZuMbngSNQJqLAVwyXFvOxelDUtYWcCRozHkaiIGr"

Run the relay as follow:

`docker run -v $(pwd)/relay.yml:/etc/kaigara/metadata/relay.yml -d kaigara/postfix`

## Credits

   This container is a part of [DevStack](https://www.devstack.com/), a project to facilitate DevOps work with continuous integration and deployment environment ready to use.
