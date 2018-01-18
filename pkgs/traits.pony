trait UsesHelper
  be useHelper(helper: Pingable tag)

trait Pingable
  be ping(src: Pingable tag, data: String)
