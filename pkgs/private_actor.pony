actor _PrivateActor is Pingable
  let _id: String = "_PrivateActor"
  let _env: Env

  new create(env: Env) =>
    _env = env
    _env.out.print(_id + ":create")

  be ping(src: Pingable tag, data: String) =>
    _env.out.print(_id + ":ping data=" + data)
    src.ping(this, _id)
