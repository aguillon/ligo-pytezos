
type storage = int

[@entry]
let increment (_ : unit) (store : storage) : operation list * storage =
    ([], store + 1)
    
[@entry]
let decrement (_ : unit) (store : storage) : operation list * storage =
    ([], store - 1)
