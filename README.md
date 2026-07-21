# Math Duels

Math Duels is a real-time multiplayer educational game built on the Roblox platform where players compete by solving mathematics problems under time pressure.

The game has reached **20,000+ plays** and includes a complete multiplayer backend featuring matchmaking, persistent player progression, cosmetics, and server-to-server teleportation.

![Main Menu](docs/screenshots/mainmenu.png)

---

## Features

- ⚔️ Real-time 1v1 multiplayer math battles
- 🌐 Cross-server matchmaking
- 🚀 Reserved server teleportation
- 💾 Persistent player progression using DataStoreService
- 🎨 Unlockable avatars, banners, and emotes
- 🪙 Currency and cosmetic progression system
- 🎵 Interactive menus, animations, and UI effects

---

## Technical Highlights

This project was built entirely in **Roblox Studio** using **Luau**.

Core backend systems include:

- **MemoryStoreService** for matchmaking queues
- **MessagingService** for server communication
- **TeleportService** for reserved multiplayer servers
- **DataStoreService** with retry logic and autosaving
- Client/server architecture using RemoteEvents and RemoteFunctions
- Persistent cosmetic inventories and player progression

---

## Repository Structure

```text
math-duels/
│
├── place/
│   └── MathDuels.rbxl          # Complete Roblox Studio project
│
├── src/
│   ├── server/                 # Backend systems
│   ├── client/                 # UI and gameplay scripts
│   └── shared/                 # Extracted configuration and item metadata for technical review
│
├── docs/
│   ├── architecture.md
│   ├── gameplay.md
│   └── screenshots/
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## Backend Systems

### Matchmaking

Players join a matchmaking queue managed with Roblox's MemoryStoreService. Once two players are available, the server reserves a private instance and teleports both participants into the same match.

### Player Persistence

Player data is stored using Roblox DataStoreService and includes:

- Credits
- Experience
- Owned cosmetics
- Equipped cosmetics

The save system includes retry logic to improve reliability during transient failures.

### Cosmetics

Players can purchase and equip:

- Avatars
- Banners
- Emotes

All cosmetic ownership is persisted across play sessions.

---

## Documentation

Additional documentation is available in the `docs/` folder.

- [Architecture](docs/architecture.md) — High-level overview of the client-server architecture.
- [Gameplay](docs/gameplay.md) — Gameplay loop and progression system.

---

## Running the Project

1. Clone the repository.
2. Open `place/MathDuels.rbxl` in Roblox Studio.
3. Enable API Services if testing persistence.
4. Use Roblox Studio's multiplayer testing tools to simulate multiple players.

---

## Technologies

- Luau
- Roblox Studio
- DataStoreService
- MemoryStoreService
- MessagingService
- TeleportService
- RemoteEvents
- RemoteFunctions

---

## Project Background

Math Duels was originally developed directly inside Roblox Studio as a complete multiplayer game. This repository includes the original Roblox place alongside representative production scripts and supporting documentation to make the implementation easier to review.

> The shared modules centralize configuration extracted from the original
> Roblox Studio project. The included production scripts remain faithful
> to the currently published game and have not yet been fully migrated to
> consume these modules.
