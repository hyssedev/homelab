# Vendored HAProxy Lua dependencies

The files in this directory are loaded through the read-only HAProxy config
bind mount. They are pinned to immutable upstream revisions:

- `auth-request/auth-request.lua`: [TimWolla/haproxy-auth-request](https://github.com/TimWolla/haproxy-auth-request/blob/9fe6049577cfcb5c159ed7d3a2bb72465a5c11ab/auth-request.lua) at `9fe6049577cfcb5c159ed7d3a2bb72465a5c11ab`
- `http/haproxy-lua-http.lua`: [haproxytech/haproxy-lua-http](https://github.com/haproxytech/haproxy-lua-http/blob/4ac4483142c4f12445d47e55c8ecf155d9be0904/http.lua) at `4ac4483142c4f12445d47e55c8ecf155d9be0904`
- `json/json.lua`: [rxi/json.lua](https://github.com/rxi/json.lua/blob/ee6abdecb2b35251551027fe71cefbe56e3176da/json.lua) at `ee6abdecb2b35251551027fe71cefbe56e3176da`

Each vendored source file retains its upstream license header.
