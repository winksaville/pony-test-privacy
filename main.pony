use "pkgs"

actor Main is (UsesHelper & Pingable)
  //let _privatePeer: _PrivateActor // Can't access private actors
  let _id: String = "Main"
  let _env: Env
  let _peer: Actor
  let _max: U32 = 5
  var _count: U32 = 0
  var _helper: (Pingable tag | None) = None

  new create(env: Env) =>
    _env = env
    _env.out.print(_id + ":create")
    _peer = Actor(_env, this)

  be useHelper(helper: Pingable tag) =>
    _env.out.print(_id + ":useHelper")
    _helper = helper
    ping(this, _id + ":useHelper")

  be ping(src: Pingable tag, data: String) =>
    _count = _count + 1
    _env.out.print(_id + ":ping data=" + data + " count=" + _count.string())
    if _count < _max then
      try
        let x: Pingable tag = _helper as Pingable tag
        _env.out.print(_id + ":ping pinging _helper")
        x.ping(this, _id)
      else
        _env.out.print(_id + ":ping _helper is None")
      end
      _env.out.print(_id + ":ping pinging _peer")
      _peer.ping(this, _id)
    else
      _env.out.print(_id + ":ping _count >= " + _max.string())
    end
