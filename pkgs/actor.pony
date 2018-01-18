actor Actor is Pingable
  let _id: String = "Actor"
  let _env: Env
  let _peer: _PrivateActor
  let _master: UsesHelper tag

  new create(env: Env, master: UsesHelper tag) =>
    _env = env
    _env.out.print(_id + ":create")
    _peer = _PrivateActor(env)
    _master = master
    _master.useHelper(_peer)

  be ping(src: Pingable tag, data: String) =>
    _env.out.print(_id + ":ping data=" + data)
    src.ping(this, _id)
