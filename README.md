# kong-go-hello-plugin

Build the plugin binary (go-hello):
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

Kong fails to start with error:
```console
2025/02/10 17:36:30 [warn] 1#0: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /usr/local/kong/nginx.conf:7
kong  | nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /usr/local/kong/nginx.conf:7
kong  | 2025/02/10 17:36:30 [notice] 1#0: [lua] license_helpers.lua:196: read_license_info(): [license-helpers] could not decode license JSON: No license found
kong  | 2025/02/10 17:36:30 [notice] 1#0: [lua] license_helpers.lua:196: read_license_info(): [license-helpers] could not decode license JSON: No license found
kong  | 2025/02/10 17:36:30 [notice] 1#0: [kong] process.lua:97 [pluginserver] loading external plugins info
kong  | sh: 1: /usr/local/bin/go-hello: Exec format error
kong  | 2025/02/10 17:36:30 [error] 1#0: init_by_lua error: ...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:45: failed loading external plugins: failed decoding plugin info: Expected value but found T_END at character 1
kong  | stack traceback:
kong  | 	[C]: in function 'assert'
kong  | 	...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:45: in function 'get_plugin'
kong  | 	...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:51: in function 'load_plugin'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:234: in function 'load_plugin_handler'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:338: in function 'load_plugin'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:394: in function 'load_plugin_schemas'
kong  | 	/usr/local/share/lua/5.1/kong/init.lua:812: in function 'init'
kong  | 	init_by_lua(nginx-kong.conf:58):3: in main chunk
kong  | nginx: [error] init_by_lua error: ...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:45: failed loading external plugins: failed decoding plugin info: Expected value but found T_END at character 1
kong  | stack traceback:
kong  | 	[C]: in function 'assert'
kong  | 	...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:45: in function 'get_plugin'
kong  | 	...local/share/lua/5.1/kong/runloop/plugin_servers/init.lua:51: in function 'load_plugin'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:234: in function 'load_plugin_handler'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:338: in function 'load_plugin'
kong  | 	/usr/local/share/lua/5.1/kong/db/dao/plugins.lua:394: in function 'load_plugin_schemas'
kong  | 	/usr/local/share/lua/5.1/kong/init.lua:812: in function 'init'
kong  | 	init_by_lua(nginx-kong.conf:58):3: in main chunk
```
