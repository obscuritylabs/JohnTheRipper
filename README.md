[![Build Status](https://travis-ci.org/obscuritylabs/JohnTheRipper.svg?branch=master)](https://travis-ci.org/obscuritylabs/JohnTheRipper)
# JohnTheRipper
Docker + Travis-CI + JohnTheRipper(Jumbo) = Bleeding edge builds

## Continuous Integration Implementation 
This repo get built at 12 AM daily via a Travis CI Cron Job:

1) Travis CI Cron job fires
2) Docker image is built from JohnTheRipper (Jumbo) source code 
3) Travis CI has secret data for User/Password for Docker Hub
4) Docker image pushed to Docker Hub

