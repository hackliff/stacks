# Shell tools


### jq


```Bash
$ # pluck an object from an array
$ curl "${URL}" | jq '.some_array[] | select(.id == 319) | .some_value'
```
