# riak-cs-create-admin-user

## Description

Creates and configures an administrator for Riak CS.

## Requirements

### Platforms

* Ubuntu 12.04 (Precise)
* CentOS 6.3
* CentOS 6.4

### Cookbooks

* riak
* riak-cs

## Attributes

* `node["riak_cs_create_admin_user"]["email"]` - Riak CS administrator e-mail
  address.
* `node["riak_cs_create_admin_user"]["name"]` - Riak CS administrator name.
* `node["riak_cs_create_admin_user"]["scheme"]` - Riak CS URL scheme (default:
  `http`).
* `node["riak_cs_create_admin_user"]["verify_mode"]` - OpenSSL verification
  mode (default: `peer` for `OpenSSL::SSL::VERIFY_PEER`)
* `node["riak_cs_create_admin_user"]["ca_file"]` - Path to `ca_file` for SSL
  verification.

## Recipes

* `recipe[riak-cs-create-admin-user]` will configure an administrator for Riak CS.

## Usage

Ensure that the `riak-cs-create-admin-user` recipe is added after `riak`,
`riak-cs`, and `stanchion` in the run list.

If you want to reuse the administrator access and secret keys generated by this
cookbook, please ensure that the recipes making use of them are after
`riak-cs-create-admin-user` in the run list.

An example of how to populate a credentials file:

```ruby
ruby_block "credentials-file" do
  block do
    if node.run_state.key?("riak_cs_admin_key") && node.run_state.key?("riak_cs_admin_secret")
      creds_file = Chef::Resource::File.new("/tmp/creds.txt", run_context)
      creds_file.content "RIAKCS_ACCESS_KEY_ID=%s\nRIAKCS_SECRET_ACCESS_KEY=%s\n" %
        [ node.run_state["riak_cs_admin_key"], node.run_state["riak_cs_admin_secret"] ]
      creds_file.run_action :create
    end
  end
end
```
