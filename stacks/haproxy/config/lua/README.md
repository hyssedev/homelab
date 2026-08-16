# Vendored HAProxy Lua dependencies

The files in this directory are loaded through the read-only HAProxy config
bind mount. They are pinned to immutable upstream revisions:

- `auth-request/auth-request.lua`: `TimWolla/haproxy-auth-request` at
  `9fe6049577cfcb5c159ed7d3a2bb72465a5c11ab`
- `http/haproxy-lua-http.lua`: `haproxytech/haproxy-lua-http` at
  `4ac4483142c4f12445d47e55c8ecf155d9be0904`
- `json/json.lua`: `rxi/json.lua` at
  `ee6abdecb2b35251551027fe71cefbe56e3176da`

Each vendored source file retains its upstream license header.
