
type storage = unit

[@entry]
let main (_ : unit) (store : storage) : operation list * storage =
    ([], store)
