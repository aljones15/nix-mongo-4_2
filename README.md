This is an attempt to build Mongo 4_2 from this PR: https://github.com/NixOS/nixpkgs/pull/84320

The error I am getting currently is this:

```
[liminal18@nixos:~/Programs/mongo4/4_2]$ sudo nixos-rebuild switch --show-trace
building Nix...
building the system configuration...
error: while evaluating the attribute 'config.system.build.toplevel' at /nix/var/nix/profiles/per-user/root/channels/nixos/nixos/modules/system/activation/top-level.nix:275:5:
while evaluating 'foldr' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:52:20, called from /nix/var/nix/profiles/per-user/root/channels/nixos/nixos/modules/system/activation/top-level.nix:139:12:
while evaluating 'fold'' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:55:15, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:59:8:
while evaluating 'showWarnings' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/trivial.nix:302:28, called from /nix/var/nix/profiles/per-user/root/channels/nixos/nixos/modules/system/activation/top-level.nix:136:10:
while evaluating 'foldr' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:52:20, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/trivial.nix:302:33:
while evaluating 'fold'' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:55:15, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:59:8:
while evaluating the attribute 'warnings' at undefined position:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:84:45, called from undefined position:
while evaluating the attribute 'value' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:379:9:
while evaluating the option `warnings':
while evaluating the attribute 'mergedValue' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:411:5:
while evaluating the attribute 'values' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:405:9:
while evaluating the attribute 'values' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:505:7:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:391:28, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:391:17:
while evaluating 'dischargeProperties' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:464:25, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:392:62:
while evaluating the attribute 'value' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:277:44:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:234:10, called from undefined position:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/nixos/modules/system/boot/systemd.nix:824:51, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:234:16:
while evaluating 'optional' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/lists.nix:254:20, called from /nix/var/nix/profiles/per-user/root/channels/nixos/nixos/modules/system/boot/systemd.nix:825:7:
while evaluating the attribute 'serviceConfig.Type' at undefined position:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:84:45, called from undefined position:
while evaluating the attribute 'value' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:379:9:
while evaluating the option `systemd.services.mongodb.serviceConfig':
while evaluating the attribute 'mergedValue' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:411:5:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:413:22, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:413:9:
while evaluating 'merge' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/types.nix:292:20, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:416:12:
while evaluating 'filterAttrs' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:124:23, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/types.nix:293:35:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:125:29, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:125:18:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/types.nix:293:51, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:125:62:
while evaluating the attribute 'ExecStart' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:344:7:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/types.nix:293:86, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/attrsets.nix:344:15:
while evaluating the attribute 'optionalValue' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:424:5:
while evaluating the attribute 'values' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:405:9:
while evaluating the attribute 'values' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:505:7:
while evaluating anonymous function at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:391:28, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:391:17:
while evaluating 'dischargeProperties' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:464:25, called from /nix/var/nix/profiles/per-user/root/channels/nixos/lib/modules.nix:392:62:
while evaluating the attribute 'value' at /nix/var/nix/profiles/per-user/root/channels/nixos/lib/types.nix:297:60:
while evaluating the attribute 'nativeBuildInputs' of the derivation 'mongodb-4.2.5' at /home/liminal18/Programs/mongo4/4_2/mongodb.nix:47:3:
cannot coerce a set to a string, at /home/liminal18/Programs/mongo4/4_2/mongodb.nix:47:3
```

It appears to be related to scons not having python 3.5.


### System Info

This should be nixos 20.03.

```
nix-env --version
nix-env (Nix) 2.3.3
```

```
nix-channel --list
nixos https://nixos.org/channels/nixos-19.09
```

```
sudo nix-channel --list
nixos https://nixos.org/channels/nixos-20.03
nixos-unstable https://nixos.org/channels/nixos-unstable
unstable https://nixos.org/channels/nixos-unstable
```

NOTE: this is odd I am running version 20.

The global python version should not matter, but:

```
[liminal18@nixos:~/Programs/mongo4/4_2]$ python --version
Python 3.7.6
```

```
nix-shell -p nix-info --run nix-info
system: "x86_64-linux", multi-user?: yes, version: nix-env (Nix) 2.3.3, channels(root): "nixos-20.03.2141.8b071be7512, nixos-unstable-20.09pre218613.ae6bdcc5358, unstable-20.09pre218613.ae6bdcc5358", channels(liminal18): "nixos-19.09.2284.bf7c0f0461e", nixpkgs: /nix/var/nix/profiles/per-user/root/channels/nixos
```
