# ngrokd-cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/ngrokd.svg)](http://community.opscode.com/cookbooks/ngrokd) [![Build Status](https://travis-ci.org/rjocoleman/ngrokd-cookbook.svg)](https://travis-ci.org/rjocoleman/ngrokd-cookbook)

Chef cookbook to install, configure and run [ngrokd](https://github.com/inconshreveable/ngrok/blob/master/docs/SELFHOSTING.md).

Currently uses [citadel](https://github.com/poise/citadel) to transfer secrets.

At this time only supports Ubuntu 14.04 - let me know if you want another platform - PRs welcome.


## Attributes

Attributes and their default values:

```ruby
node['ngrokd']['domain'] = nil # required. Server's domain.
node['ngrokd']['path'] = '/etc/ngrokd' # path to store tls crt/key in
node['ngrokd']['tlskey'] = 'tls.key' # name of tls private key on disk
node['ngrokd']['tlscrt'] = 'tls.crt' # name of tls certificate on disk
node['ngrokd']['log'] = '/var/log/ngrokd.log' # path for ngrok to log to. stdout and none are also valid.
```

`node['ngrokd']['domain']` is the only setting that needs to be modified - if your domain is `example.com` then in DNS `example.com` and `*.example.com` should be A records for the server IP.


## Secrets

A SSL certificate and matching private key are required. These are stored in an Amazon S3 bucket and retrieved via [Citadel](https://github.com/poise/citadel), as such IAM Roles (if running the server in EC2) or AWS credentials are required.
Bucket should also be specified. See Citadel's docs for more information.


## Usage

### ngrokd::default

Include `ngrokd` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ngrokd::default]"
  ]
}
```

This will install ngrokd from Ubuntu package. Download and place ssl key/crt into place.
It will create and launch an Upstart script to keep ngrokd running on boot.

## Vagrant

A working `Vagrantfile` is included, check this to see the minimum viable now-AWS attributes required.


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Robert Coleman (<github@robert.net.nz>)
