# kong-go-hello-plugin

Build the plugin binary (`go-hello`):
```console
make
```

Test the plugin binary:
```console
./go-hello --help
Usage of ./go-hello:
  -dump
    	Dump info about plugins
  -help
    	Show usage info
  -kong-prefix string
    	Kong prefix path (specified by the -p argument commonly used in the kong cli) (default "/usr/local/kong")
```

Run Kong with docker-compose which runs the docker image defined in Dockerfile
which packages the plugin.
```console
docker compose up
```

Kong will start with log statements indicated the plugin was loaded:
```console
[+] Running 1/0
 ✔ Container kong  Created                                                                                                                                                                                                                                                 0.0s
Attaching to kong
kong  | 2025/02/11 18:57:38 [warn] 1#0: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /usr/local/kong/nginx.conf:7
kong  | nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /usr/local/kong/nginx.conf:7
kong  | 2025/02/11 18:57:38 [notice] 1#0: [lua] license_helpers.lua:196: read_license_info(): [license-helpers] could not decode license JSON: No license found
kong  | 2025/02/11 18:57:38 [notice] 1#0: [lua] license_helpers.lua:196: read_license_info(): [license-helpers] could not decode license JSON: No license found
kong  | 2025/02/11 18:57:38 [notice] 1#0: [kong] process.lua:97 [pluginserver] loading external plugins info
kong  | 2025/02/11 18:57:38 [notice] 1#0: [kong] process.lua:108 [pluginserver] loaded #1 external plugins info
kong  | 2025/02/11 18:57:38 [notice] 1#0: [kong] init.lua:19 [pluginserver] loading protocol ProtoBuf:1 for plugin go-hello
kong  | 2025/02/11 18:57:38 [notice] 1#0: [lua] init.lua:905: init(): [request-debug] token for request debugging: 77943d5f-582c-4db4-a1b5-9a0b7a0aa1a9
kong  | 2025/02/11 18:57:38 [notice] 1#0: using the "epoll" event method
kong  | 2025/02/11 18:57:38 [notice] 1#0: openresty/1.25.3.2
kong  | 2025/02/11 18:57:38 [notice] 1#0: OS: Linux 6.10.14-linuxkit
kong  | 2025/02/11 18:57:38 [notice] 1#0: getrlimit(RLIMIT_NOFILE): 1048576:1048576
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker processes
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2572
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2573
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2574
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2575
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2576
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2577
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2578
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2579
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2580
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2581
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2582
kong  | 2025/02/11 18:57:38 [notice] 1#0: start worker process 2583
...
```

But the plugin logic does not seem to be executed (`x-hello-from-go`
header is not present):
```console
curl -X GET localhost:8000/any
{
  "args": {},
  "data": "",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.7.1",
    "X-Amzn-Trace-Id": "Root=1-67ab9f5e-0ba5688054754d0d44572d8a",
    "X-Forwarded-Host": "localhost",
    "X-Forwarded-Path": "/any",
    "X-Forwarded-Prefix": "/any",
    "X-Kong-Request-Id": "7bc4e34bd715816fefea9542879ce527"
  },
  "json": null,
  "method": "GET",
  "origin": "172.20.0.1, 131.239.89.226",
  "url": "http://localhost/anything"
}
```
