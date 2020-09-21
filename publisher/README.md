# README

This skeleton Rails app mounts the [nfg_ui](https://github.com/network-for-good/nfg_ui/) engine to precompile and publish publicly-available assets for use across Network for Good systems.

## Deployment Instructions

The app contains a single rake task, `publish`, which is intended to be run from within the parent `nfg_ui` gem after `rake release` successfully completes.

You can run the `publish` task independently:

```
# writes publisher/public/assets/ to s3://nfg-ui/v0.11.0/; guards against overwriting existing files
rake publish[0.11.0]

# overwrite existing files
rake publish[0.11.0, override]
```

Deployed files can be accessed like so:

* <http://nfg-ui.s3.amazonaws.com/v0.11.0/nfg_ui/network_for_good/core/application-d994baac0c3175874dc55ddb80d4218ec110b46b9f24923bd91240df863824c2.css>

## TODO

* Setup Cloudfront to serve these files more efficiently

## Author

<mike.subelsky@networkforgood.com>
