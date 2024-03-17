These are apparently difficult to grab so I'm just saving it here

Ref: https://github.com/NixOS/nixpkgs/blob/master/lib/types.nix
```yaml
Easy types reference:
    - lib.types.anything
    - lib.types.str
    - lib.types.nonEmptyStr
    - lib.types.bool
    - lib.types.int
    - lib.types.float
    - lib.types.number
    - lib.types.path
    - lib.types.listOf
    - lib.types.listOf: A alist, used by passing another type i.e.
        - lib.types.listOf lib.types.str
        - lib.types.listOf lib.types.number
        - etc
  ```