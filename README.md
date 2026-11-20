<div align="center">
  <h1>Namma Quiz</h1>
  
  <p>
    <strong>The open-source real-time quiz and interactive learning platform.</strong>
  </p>

  <p>
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter" alt="Platform"></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Language-Dart-0175C2?logo=dart" alt="Language"></a>
    <a href="https://serverpod.dev"><img src="https://img.shields.io/badge/Backend-Serverpod-FF4081?logo=dart" alt="Backend"></a>
    <a href="https://github.com/schultek/jaspr"><img src="https://img.shields.io/badge/Web-Jaspr-FF9800" alt="Jaspr"></a>
    <a href="https://github.com/KeerthiVasan-ai/namma_kahoot/blob/main/LICENSE"><img src="https://img.shields.io/github/license/KeerthiVasan-ai/namma_kahoot" alt="License"></a>
    <a href="https://github.com/KeerthiVasan-ai/namma_kahoot/stargazers"><img src="https://img.shields.io/github/stars/KeerthiVasan-ai/namma_kahoot?style=social" alt="Stars"></a>
  </p>
</div>

---

## 🌟 Overview

**Namma Quiz** is an open-source, real-time interactive learning application built entirely in **Dart**. Whether you're hosting a quiz for a classroom, a corporate event, or a fun night with friends, Namma Quiz provides a seamless, high-performance, and beautiful experience across all platforms.

Inspired by industry leaders, Namma Quiz leverages the full power of the Dart ecosystem to deliver a unified, full-stack solution.

## ✨ Key Features

- ⚡ **Real-time Synchronization:** Ultra-low latency game state synchronization using WebSockets.
- 📱 **Cross-Platform:** Native mobile and desktop experiences powered by **Flutter**.
- 🌐 **High-Performance Web:** SEO-friendly, blazingly fast web client built with **Jaspr**.
- 🚀 **Scalable Backend:** Robust backend architecture built on **Serverpod** with PostgreSQL and Redis.
- 🎨 **Beautiful UI:** Polished, modern user interface with smooth micro-animations and dynamic layouts.
- 🔒 **Secure:** Enterprise-grade security and authentication out of the box.

## 🏗️ Architecture

Namma Quiz is designed as a modern monorepo, separating concerns while sharing a single underlying language: Dart.

- **`namma_kahoot_server`**: The brain of the operation. A scalable Serverpod backend handling real-time WebSockets, database interactions, and Redis caching.
- **`namma_kahoot_client`**: The auto-generated Serverpod client, sharing data models and protocol definitions across the entire workspace.
- **`namma_kahoot_flutter`**: The beautifully crafted mobile and desktop application.
- **`namma_kahoot_jaspr`**: The lightweight, highly optimized web application tailored for browsers.

---

## 🚀 Getting Started

Follow these steps to get your local development environment up and running.

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) (^3.8.0)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Docker](https://www.docker.com/products/docker-desktop) (for local database & Redis)
- [Serverpod CLI](https://docs.serverpod.dev/)
- [Jaspr CLI](https://pub.dev/packages/jaspr_cli)

### 1. Start the Infrastructure (Docker)

Start the PostgreSQL and Redis instances in the background:

```bash
cd namma_kahoot_server
docker compose up --build --detach
```

### 2. Start the Backend Server

Ensure database migrations are applied and start the Serverpod backend:

```bash
cd namma_kahoot_server
dart bin/main.dart --apply-migrations
```

### 3. Run the Web UI (Jaspr)

In a new terminal window, start the Jaspr development server with hot-reload:

```bash
cd namma_kahoot_jaspr
jaspr serve
```

### 4. Run the Mobile/Desktop App (Flutter)

In a new terminal window, start the Flutter companion app:

```bash
cd namma_kahoot_flutter
flutter run
```

*For a full list of commands, check out our [Commands Cheat Sheet](./COMMANDS.md).*

---

## 🔄 Session Persistence & Reconnect Architecture

Namma Quiz implements robust session persistence and reconnection semantics across browser refreshes, tab closures, and transient connection losses.

### Core Principles
1. **Token-Based Identity:** Sockets are transient communication channels, not player identities. On join/host creation, the server issues a cryptographically secure 32-byte secret session token stored in browser `sessionStorage` (scoped per-tab) or in-memory for desktop/mobile clients.
2. **Server-Side Security:** Tokens are hashed with SHA-256 before storage or validation (`scope=serverOnly`). Tokens are never broadcast to other players or the presenter.
3. **Grace Periods & Disconnect Handling:**
   - **`hideDelay` (1.5s):** Debounce window preventing host-side UI flicker on instantaneous page refreshes.
   - **`lobbyGracePeriod` (5s):** Disconnected lobby players are pruned if they do not resume within 5 seconds.
   - **`questionGracePeriod` (12s):** During active gameplay, players who disconnect have 12 seconds to resume before being marked as `away`. Their score and answer progress are preserved.
   - **`hostGracePeriod` (30s):** If the host loses connection and does not reconnect within 30 seconds, the room is cleanly terminated (`ROOM_ENDED`) and player records are removed.
4. **Stale-Socket Disconnect Guard:** If a reconnecting tab resumes with a new socket before the old socket's disconnect event finishes firing, the connection handle comparison ensures the newer socket is not inadvertently marked offline.
5. **Duplicate Tab Policy:** When a duplicate connection presents an active session token, the newest connection takes priority; the existing socket is notified with `REPLACED` and closed.
6. **Host Moderation (Kick):** Kicking a player closes their connection immediately, marks the player row as left, and records their token hash in `bannedTokenHashes` to prevent resuming or re-joining the same room.

### Acceptance & Verification Checklist
- [x] **Join:** Player receives secret token; visible in host lobby list.
- [x] **Refresh within Grace:** Session restored from `sessionStorage`; reconnects without score or answer loss; hide debounce prevents flickering.
- [x] **Close Tab:** Socket drops; player is hidden after `hideDelay`; deleted after grace period expires.
- [x] **Player Leave:** Immediate cleanup, token invalidated, client storage purged.
- [x] **Host Kick:** Immediate disconnect, banned token hash prevents resume/re-join, kicked player sees notification banner.
- [x] **Stale Disconnect:** Out-of-order socket events do not evict a reconnected player.
- [x] **Mid-Question Reconnect:** Locked answer restored or timer continues; duplicate answers prevented.
- [x] **Host Reconnect:** Host dashboard re-attaches to live game state within `hostGracePeriod`.
- [x] **Resource Cleanup:** All timers and room runtimes disposed upon room end.

---

## 🤝 Contributing

We welcome contributions from the community! Whether it's fixing a bug, improving documentation, or proposing a new feature, your help is appreciated.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🛡️ License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

<div align="center">
  <sub>Built with ❤️</sub>
</div>
