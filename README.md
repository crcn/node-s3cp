### S3 file synchronization

Similar to rsync


#### Publishing Example

```javascript
var s3cp = require("s3cp")({
  aws: {
    key: "<KEY>",
    secret: "<SECRET>",
    bucket: "assets"
  }
});

s3cp.upload({ path: ""})
```

#### Downloading Example


```javascript
var s3cp = require("s3cp")({
  aws: {
    key: "<KEY>",
    secret: "<SECRET>"
  }
});


s3cp.bucket("assets").download("")
```