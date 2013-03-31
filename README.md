### S3 file synchronization

Similar to rsync, or git. s3cp looks for the difference in remote files, and synchronizes them with either a `pull`, or `push`.

### Help

```
  Usage: s3cp [options] [command]

  Commands:

    pull [config]          downloading files from s3
    push [config]          upload files to s3
    clean-pull [config]    re-downloads files to s3

  Options:

    -h, --help             output usage information
    -c, --config <config>  s3cp config path
    -s, --skip <count>     skip first N files for upload
    -v --validate          validate the server files before uploading
```

Here's how you publish files:

```bash
s3cp publish ./files.json --config ./credentials.json
```

files.json:

```json
[
  {
    "path": "path/to/file",
    "name": "name-of-repo"
  },
  {
    "path": "another/path/to/file",
    "name": "name-of-repo2"
  },
]
```

credentials.json:

```json
{
  key: "AWS_KEY",
  secret: "AWS_SECRET",
  bucket: "AWS_BUCKET"
}
```

Whenever you change files, simply re-publish with the same command, and s3cp will only copy the files that have changed.

To pull files from s3cp, call:

```bash
s3cp pull ./files.json --config ./credentials.json
```

s3cp will synchronize the local files whenever the remote files change.
