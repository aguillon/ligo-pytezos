type storage = {
  counters: (address, int) big_map;
  metadata: (string, bytes) big_map;
}

type action =
  | Increment of address
  | Decrement of address

let update_with (i: int) (address: address) (storage: storage) =
  match Big_map.find_opt address storage.counters with
    | None -> { storage with counters = Big_map.add address i storage.counters }
    | Some j -> { storage with counters = Big_map.add address (i+j) storage.counters }

let main (action, storage): operation list * storage =
  match action with
    | Increment address ->
      let updated_storage = update_with 1 address storage in
      ([], updated_storage)
    | Decrement address ->
      let updated_storage = update_with (-1) address storage in
      ([], updated_storage)

let get_storage ((address, storage): address * storage): int option =
  Big_map.find_opt address storage.counters
