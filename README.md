# http-debug-server

The application provide ability to debug HTTP requests

## Usage 

```
http-debug-server -p 8081
```

and then:

```
curl -X POST -H 'X-Api-Key: secret' http://localhost:8081/test?foo=bar
```

Output:
```
2018/02/11 16:49:07 POST /test?foo=bar HTTP/1.1
Host: localhost:8081
Accept: */*
Content-Length: 2
Content-Type: application/x-www-form-urlencoded
User-Agent: curl/7.54.0
X-Api-Key: secret

{}
```
