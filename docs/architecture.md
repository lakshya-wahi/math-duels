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

## Matchmaking Flow

1. The client sends the selected mode and equipped cosmetics through a RemoteEvent.
2. The lobby server inserts the player into a MemoryStore queue.
3. A matchmaking worker reads two eligible players from the queue.
4. The server reserves a match server using TeleportService.
5. MessagingService communicates teleport information across lobby servers.
6. Both players are teleported with match metadata.

### Shop System

The shop currently uses per-item LocalScripts attached to individual
cosmetic cards. Each handler reads the item's price and metadata from
the UI hierarchy, checks the player's current credits, and sends an
ownership update to the server.

This design reflects the original Roblox Studio implementation. A
future refactor could replace the repeated handlers with one centralized
controller backed by `ItemCatalog.lua`.
## Persistence Flow

1. Player data is loaded when the player joins.
2. Client updates are validated by the server.
3. Data is autosaved periodically.
4. A final save is attempted when the player leaves or the server shuts down.
