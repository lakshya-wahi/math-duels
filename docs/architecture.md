# Architecture

## Overview

Math Duels follows Roblox's client-server architecture.

- Server scripts manage matchmaking, player persistence, and teleportation.
- Client scripts handle menus, gameplay UI, cosmetics, and player interactions.
- Shared modules contain game configuration and item metadata.

```
Player
   │
   ▼
Client UI
   │
RemoteEvents
   │
   ▼
Server
   ├── Matchmaking
   ├── DataStore
   └── TeleportService
```

## Major Systems

### Matchmaking

- Players enter a queue.
- Server pairs players.
- Reserved server is created.
- Players are teleported into the match.

### Player Data

Persistent player data stores

- Coins
- Owned avatars
- Owned banners
- Owned emotes

using Roblox DataStoreService.

### Cosmetics

Cosmetics are stored in ItemCatalog.lua and equipped through the shop interface.

### Networking

Communication between client and server uses RemoteEvents and RemoteFunctions where appropriate.
