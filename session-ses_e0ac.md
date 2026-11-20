# Serverpod Kahoot deployment on Serverpod Cloud

**Session ID:** ses_e0ac8a833ffeLqg69en3Jef4c2
**Created:** 11/20/2026, 12:40:07 AM
**Updated:** 11/20/2026, 12:55:41 AM

---

## User

this project is serverpod based kahoot platform. we are going to deploy it on serverpod cloud. plan for it

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 10.1s)

_Thinking:_

Let me explore the project first to understand it.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem -Force | Select-Object Name, Mode; Write-Output \"---\"; if (Test-Path -LiteralPath \"pubspec.yaml\") { Get-Content pubspec.yaml -TotalCount 40 }"
}
```

**Output:**
```

Name               Mode  
----               ----  
.git               d--h--
.idea              d-----
.vscode            d-----
namma_quiz_client  d-----
namma_quiz_flutter d-----
namma_quiz_jaspr   d-----
namma_quiz_server  d-----
.fvmrc             -a----
.gitignore         -a----
COMMANDS.md        -a----
LICENSE            -a----
pubspec.lock       -a----
pubspec.yaml       -a----
README.md          -a----
---
name: _
publish_to: none

environment:
  sdk: '^3.8.0'

workspace:
  - namma_kahoot_client
  - namma_kahoot_server
  - namma_kahoot_jaspr




```

**Tool: glob**

**Input:**
```json
{
  "pattern": "**/pubspec.yaml"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\pubspec.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\pubspec.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\pubspec.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\pubspec.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\pubspec.yaml
```

**Tool: glob**

**Input:**
```json
{
  "pattern": "**/*.md"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\CHANGELOG.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\COMMANDS.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\CHANGELOG.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\doc\endpoint.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\ios\Runner\Assets.xcassets\LaunchImage.imageset\README.md
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 3.9s)

_Thinking:_

Interesting - there's a mismatch: workspace says namma_kahoot_* but dirs are namma_quiz_*. Let me read key files.

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\README.md"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\README.md</path>
<type>file</type>
<content>
1: <div align="center">
2:   <h1>Namma Quiz</h1>
3:   
4:   <p>
5:     <strong>The open-source real-time quiz and interactive learning platform.</strong>
6:   </p>
7: 
8:   <p>
9:     <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter" alt="Platform"></a>
10:     <a href="https://dart.dev"><img src="https://img.shields.io/badge/Language-Dart-0175C2?logo=dart" alt="Language"></a>
11:     <a href="https://serverpod.dev"><img src="https://img.shields.io/badge/Backend-Serverpod-FF4081?logo=dart" alt="Backend"></a>
12:     <a href="https://github.com/schultek/jaspr"><img src="https://img.shields.io/badge/Web-Jaspr-FF9800" alt="Jaspr"></a>
13:     <a href="https://github.com/KeerthiVasan-ai/namma_kahoot/blob/main/LICENSE"><img src="https://img.shields.io/github/license/KeerthiVasan-ai/namma_kahoot" alt="License"></a>
14:     <a href="https://github.com/KeerthiVasan-ai/namma_kahoot/stargazers"><img src="https://img.shields.io/github/stars/KeerthiVasan-ai/namma_kahoot?style=social" alt="Stars"></a>
15:   </p>
16: </div>
17: 
18: ---
19: 
20: ## 🌟 Overview
21: 
22: **Namma Quiz** is an open-source, real-time interactive learning application built entirely in **Dart**. Whether you're hosting a quiz for a classroom, a corporate event, or a fun night with friends, Namma Quiz provides a seamless, high-performance, and beautiful experience across all platforms.
23: 
24: Inspired by industry leaders, Namma Quiz leverages the full power of the Dart ecosystem to deliver a unified, full-stack solution.
25: 
26: ## ✨ Key Features
27: 
28: - ⚡ **Real-time Synchronization:** Ultra-low latency game state synchronization using WebSockets.
29: - 📱 **Cross-Platform:** Native mobile and desktop experiences powered by **Flutter**.
30: - 🌐 **High-Performance Web:** SEO-friendly, blazingly fast web client built with **Jaspr**.
31: - 🚀 **Scalable Backend:** Robust backend architecture built on **Serverpod** with PostgreSQL and Redis.
32: - 🎨 **Beautiful UI:** Polished, modern user interface with smooth micro-animations and dynamic layouts.
33: - 🔒 **Secure:** Enterprise-grade security and authentication out of the box.
34: 
35: ## 🏗️ Architecture
36: 
37: Namma Quiz is designed as a modern monorepo, separating concerns while sharing a single underlying language: Dart.
38: 
39: - **`namma_kahoot_server`**: The brain of the operation. A scalable Serverpod backend handling real-time WebSockets, database interactions, and Redis caching.
40: - **`namma_kahoot_client`**: The auto-generated Serverpod client, sharing data models and protocol definitions across the entire workspace.
41: - **`namma_kahoot_flutter`**: The beautifully crafted mobile and desktop application.
42: - **`namma_kahoot_jaspr`**: The lightweight, highly optimized web application tailored for browsers.
43: 
44: ---
45: 
46: ## 🚀 Getting Started
47: 
48: Follow these steps to get your local development environment up and running.
49: 
50: ### Prerequisites
51: 
52: - [Dart SDK](https://dart.dev/get-dart) (^3.8.0)
53: - [Flutter SDK](https://docs.flutter.dev/get-started/install)
54: - [Docker](https://www.docker.com/products/docker-desktop) (for local database & Redis)
55: - [Serverpod CLI](https://docs.serverpod.dev/)
56: - [Jaspr CLI](https://pub.dev/packages/jaspr_cli)
57: 
58: ### 1. Start the Infrastructure (Docker)
59: 
60: Start the PostgreSQL and Redis instances in the background:
61: 
62: ```bash
63: cd namma_kahoot_server
64: docker compose up --build --detach
65: ```
66: 
67: ### 2. Start the Backend Server
68: 
69: Ensure database migrations are applied and start the Serverpod backend:
70: 
71: ```bash
72: cd namma_kahoot_server
73: dart bin/main.dart --apply-migrations
74: ```
75: 
76: ### 3. Run the Web UI (Jaspr)
77: 
78: In a new terminal window, start the Jaspr development server with hot-reload:
79: 
80: ```bash
81: cd namma_kahoot_jaspr
82: jaspr serve
83: ```
84: 
85: ### 4. Run the Mobile/Desktop App (Flutter)
86: 
87: In a new terminal window, start the Flutter companion app:
88: 
89: ```bash
90: cd namma_kahoot_flutter
91: flutter run
92: ```
93: 
94: *For a full list of commands, check out our [Commands Cheat Sheet](./COMMANDS.md).*
95: 
96: ---
97: 
98: ## 🤝 Contributing
99: 
100: We welcome contributions from the community! Whether it's fixing a bug, improving documentation, or proposing a new feature, your help is appreciated.
101: 
102: 1. Fork the Project
103: 2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
104: 3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
105: 4. Push to the Branch (`git push origin feature/AmazingFeature`)
106: 5. Open a Pull Request
107: 
108: ---
109: 
110: ## 🛡️ License
111: 
112: This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
113: 
114: ---
115: 
116: <div align="center">
117:   <sub>Built with ❤️</sub>
118: </div>

(End of file - total 118 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\COMMANDS.md"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\COMMANDS.md</path>
<type>file</type>
<content>
1: # Namma Quiz - Commands Cheat Sheet
2: 
3: This document contains all the essential commands needed to run, build, and manage the Namma Quiz application across its Server, UI, and Docker environments.
4: 
5: ---
6: 
7: ## 🐋 Docker (Database & Redis)
8: 
9: Serverpod relies on Docker to run PostgreSQL and Redis locally. You must start the Docker containers before running the server.
10: 
11: **Start the Docker containers (in background):**
12: ```bash
13: cd namma_kahoot_server
14: docker compose up --build --detach
15: ```
16: 
17: **Stop the Docker containers:**
18: ```bash
19: cd namma_kahoot_server
20: docker compose down -v
21: ```
22: 
23: **View Docker logs (follow mode):**
24: ```bash
25: cd namma_kahoot_server
26: docker compose logs -f
27: ```
28: 
29: ---
30: 
31: ## ⚙️ Server (Serverpod)
32: 
33: The backend is built with Serverpod. Ensure Docker is running before starting the server.
34: 
35: **Start the local server:**
36: ```bash
37: cd namma_kahoot_server
38: dart bin/main.dart --apply-migrations
39: ```
40: *(Note: `--apply-migrations` ensures the database schema is up-to-date).*
41: 
42: **Generate server code (after modifying protocol files):**
43: ```bash
44: cd namma_kahoot_server
45: serverpod generate
46: ```
47: 
48: **Create a new database migration (after modifying tables):**
49: ```bash
50: cd namma_kahoot_server
51: serverpod create-migration
52: ```
53: 
54: ---
55: 
56: ## 🌐 Web UI (Jaspr)
57: 
58: The web frontend is built with Jaspr, optimized for web deployment.
59: 
60: **Start the Jaspr development server (with hot-reload):**
61: ```bash
62: cd namma_kahoot_jaspr
63: jaspr serve -p 3000
64: ```
65: *The web UI will typically be accessible at `http://localhost:3000`.*
66: 
67: **Build the Jaspr app for production:**
68: ```bash
69: cd namma_kahoot_jaspr
70: jaspr build
71: ```
72: 
73: ---
74: 
75: ## 📱 Mobile/Desktop UI (Flutter)
76: 
77: If you are running the companion Flutter app for mobile or desktop.
78: 
79: **Run the Flutter app:**
80: ```bash
81: cd namma_kahoot_flutter
82: flutter run
83: ```
84: 
85: **Generate Flutter client code (if you updated server protocols):**
86: ```bash
87: # This is automatically generated when you run `serverpod generate` in the server project.
88: # Just ensure you run `flutter pub get` in the flutter directory afterwards.
89: cd namma_kahoot_flutter
90: flutter pub get
91: ```

(End of file - total 91 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\pubspec.yaml"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\pubspec.yaml</path>
<type>file</type>
<content>
1: name: namma_kahoot_server
2: description: Starting point for a Serverpod server.
3: # version: 1.0.0
4: # homepage: https://www.example.com
5: 
6: environment:
7:   sdk: '^3.8.0'
8: 
9: resolution: workspace
10: 
11: dependencies:
12:   serverpod: 3.4.7
13:   serverpod_auth_idp_server: 3.4.7
14: 
15: dev_dependencies:
16:   lints: '>=3.0.0 <7.0.0'
17:   serverpod_test: 3.4.7
18:   test: ^1.25.5
19: 
20: serverpod:
21:   scripts:
22:     # Starts the server and applies migrations
23:     start: dart bin/main.dart --apply-migrations
24: 
25:     # Build the Flutter web app and copy it to the server's web directory.
26:     # Windows uses xcopy since flutter's --output flag doesn't work there.
27:     # See: https://github.com/flutter/flutter/issues/157886
28:     flutter_build:
29:       windows: >-
30:         (if exist web\app rmdir /S /Q web\app)
31:         & cd /D ..\namma_kahoot_flutter
32:         && flutter build web --base-href /app/ --wasm
33:         && xcopy /E /I /Y build\web ..\namma_kahoot_server\web\app
34:       posix: |
35:         cd ../namma_kahoot_flutter
36:         flutter build web --base-href /app/ --wasm --output ../namma_kahoot_server/web/app

(End of file - total 36 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_jaspr\\pubspec.yaml"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\pubspec.yaml</path>
<type>file</type>
<content>
1: name: namma_kahoot_jaspr
2: description: A new Jaspr project
3: version: 0.0.1
4: 
5: environment:
6:   sdk: ^3.8.0
7: 
8: resolution: workspace
9: 
10: dependencies:
11:   jaspr: ^0.23.1
12:   jaspr_router: ^0.8.2
13:   jaspr_riverpod: any
14:   namma_kahoot_client:
15:     path: ../namma_kahoot_client
16: 
17: dev_dependencies:
18:   build_runner: ^2.10.0
19:   build_web_compilers: ^4.8.0
20:   jaspr_builder: ^0.23.1
21:   lints: ^5.0.0
22: 
23: jaspr:
24:   mode: client

(End of file - total 24 lines)
</content>
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 5.1s)

_Thinking:_

Serverpod Cloud is a relatively new product (Serverpod Cloud launched ~2025). I should get up-to-date docs. Let me look at the server config files first: config/production.yaml, config/development.yaml, Dockerfile? Also check endpoints and whether they use Redis, file storage, email, auth IDP.

Let me read server config and main.dart, endpoints list.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem -Recurse -File -Depth 2 namma_quiz_server | Where-Object { $_.FullName -notmatch '\\\\(\\.dart_tool|generated|build|\\.git)\\\\' } | Select-Object -ExpandProperty FullName"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\.gitignore
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\analysis_options.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\CHANGELOG.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\dart_test.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\docker-compose.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\Dockerfile
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\pubspec.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\README.md
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\bin\main.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\development.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\generator.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\production.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\staging.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\test.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\server.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\migration_registry.txt
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420094708597\definition.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420094708597\definition.sql
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420094708597\definition_project.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420094708597\migration.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420094708597\migration.sql
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420102140772\definition.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420102140772\definition.sql
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420102140772\definition_project.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420102140772\migration.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\migrations\20260420102140772\migration.sql
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\pages\index.html

```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\README.md"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\README.md</path>
<type>file</type>
<content>
1: # namma_kahoot_server
2: 
3: This is the starting point for your Serverpod server.
4: 
5: To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.
6: 
7:     docker compose up --build --detach
8: 
9: Then you can start the Serverpod server.
10: 
11:     dart bin/main.dart
12: 
13: When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.
14: 
15:     docker compose stop

(End of file - total 15 lines)
</content>
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 7.4s)

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\config\\production.yaml"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\production.yaml</path>
<type>file</type>
<content>
1: # This is the configuration file for your production environment.
2: # Typically, you will want to route the traffic through a load balancer
3: # which adds SSL security through https. If you use Serverpod's standard
4: # Terraform scripts to deploy your server, all you need to change in
5: # this file is the examplepod.com domain name.
6: 
7: # Configuration for the main API server.
8: apiServer:
9:   port: 8080
10:   publicHost: api.examplepod.com
11:   publicPort: 443
12:   publicScheme: https
13: 
14: # Configuration for the Insights server.
15: insightsServer:
16:   port: 8081
17:   publicHost: insights.examplepod.com
18:   publicPort: 443
19:   publicScheme: https
20: 
21: # Configuration for the web server.
22: webServer:
23:   port: 8082
24:   publicHost: app.examplepod.com
25:   publicPort: 443
26:   publicScheme: https
27: 
28: # This is the database setup for your servers. The default for the Google Cloud
29: # Engine Terraform configuration is to connect on a private IP address.
30: # If you are connecting on a public IP (e.g. on AWS or Google Cloud Run), you
31: # connect on the public IP of the database e.g. database.examplepod.com.
32: database:
33:   host: database.private-production.examplepod.com
34:   port: 5432
35:   name: serverpod
36:   user: postgres
37:   requireSsl: true
38:   #isUnixSocket: true # defaults to false
39:   #maxConnectionCount: 10 # Defaults to 10, a negative or null value removes the limit
40: 
41: # This is the setup for Redis. The default for the Google Cloud Engine Terraform
42: # configuration is to connect on a private IP address.
43: # If you are connecting on a public IP (e.g. on AWS or Google Cloud Run), you
44: # connect on the public IP of the database e.g. redis.examplepod.com.
45: redis:
46:   enabled: false
47:   host: redis.private-production.examplepod.com
48:   port: 6379
49:   #user: # defaults to empty
50:   #requireSsl: true # defaults to false
51: 
52: maxRequestSize: 524288 # The maximum size of requests allowed in bytes
53: 
54: sessionLogs:
55:   consoleEnabled: false
56: # persistentEnabled: true
57: # consoleLogFormat: json # Defaults to "json", options are "text" or "json"
58: 
59: # futureCallExecutionEnabled: true # Defaults to true
60: 
61: #futureCall:
62: #  concurrencyLimit: 1 # Defaults to 1, a negative or null value removes the limit
63: #  scanInterval: 5000 # Unit in milliseconds, defaults to 5000

(End of file - total 63 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\config\\staging.yaml"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\staging.yaml</path>
<type>file</type>
<content>
1: # This is the configuration file for your staging environment. The staging
2: # environment is meant to resemble the production environment as much as
3: # possible and may connect to production databases services and data. You use it
4: # for final testing before deploying the production server.
5: #
6: # Typically, you will want to route the traffic through a load balancer
7: # which adds SSL security through https. If you use Serverpod's standard
8: # Terraform scripts to deploy your server, all you need to change in
9: # this file is the examplepod.com domain name.
10: 
11: # Configuration for the main API server.
12: apiServer:
13:   port: 8080
14:   publicHost: api-staging.examplepod.com
15:   publicPort: 443
16:   publicScheme: https
17: 
18: # Configuration for the Insights server.
19: insightsServer:
20:   port: 8081
21:   publicHost: insights-staging.examplepod.com
22:   publicPort: 443
23:   publicScheme: https
24: 
25: # Configuration for the web server.
26: webServer:
27:   port: 8082
28:   publicHost: app-staging.examplepod.com
29:   publicPort: 443
30:   publicScheme: https
31: 
32: # This is the database setup for your servers. The default for the Google Cloud
33: # Engine Terraform configuration is to connect on a private IP address.
34: # If you are connecting on a public IP (e.g. on AWS or Google Cloud Run), you
35: # connect on the public IP of the database e.g. database-staging.examplepod.com.
36: database:
37:   host: database.private-staging.examplepod.com
38:   port: 5432
39:   name: serverpod
40:   user: postgres
41:   requireSsl: true
42:   #isUnixSocket: true # defaults to false
43:   #maxConnectionCount: 10 # Defaults to 10, a negative or null value removes the limit
44: 
45: # This is the setup for Redis. The default for the Google Cloud Engine Terraform
46: # configuration is to connect on a private IP address.
47: # If you are connecting on a public IP (e.g. on AWS or Google Cloud Run), you
48: # connect on the public IP of the database e.g. redis-staging.examplepod.com.
49: redis:
50:   enabled: false
51:   host: redis.private-staging.examplepod.com
52:   port: 6379
53:   #user: # defaults to empty
54:   #requireSsl: true # defaults to false
55: 
56: maxRequestSize: 524288 # The maximum size of requests allowed in bytes
57: 
58: sessionLogs:
59: # persistentEnabled: true
60: # consoleEnabled: true
61: # consoleLogFormat: json # Defaults to "json", options are "text" or "json"
62: 
63: # futureCallExecutionEnabled: true # Defaults to true
64: 
65: #futureCall:
66: #  concurrencyLimit: 1 # Defaults to 1, a negative or null value removes the limit
67: #  scanInterval: 5000 # Unit in milliseconds, defaults to 5000

(End of file - total 67 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\Dockerfile"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\Dockerfile</path>
<type>file</type>
<content>
1: # Build stage
2: FROM dart:3.8.0 AS build
3: WORKDIR /app
4: COPY . .
5: 
6: # Install dependencies and compile the server executable
7: RUN dart pub get
8: RUN dart compile exe bin/main.dart -o bin/server
9: 
10: # Final stage
11: FROM alpine:latest
12: 
13: # Environment variables
14: ENV runmode=production
15: ENV serverid=default
16: ENV logging=normal
17: ENV role=monolith
18: 
19: # Copy runtime dependencies
20: COPY --from=build /runtime/ /
21: 
22: # Copy compiled server executable
23: COPY --from=build /app/bin/server server
24: 
25: # Copy configuration files and resources
26: COPY --from=build /app/config/ config/
27: COPY --from=build /app/web/ web/
28: COPY --from=build /app/migrations/ migrations/
29: 
30: # This file is required to enable the endpoint log filter in Insights.
31: COPY --from=build /app/lib/src/generated/protocol.yaml lib/src/generated/protocol.yaml
32: 
33: # Expose ports
34: EXPOSE 8080
35: EXPOSE 8081
36: EXPOSE 8082
37: 
38: # Define the entrypoint command
39: ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role

(End of file - total 39 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\lib\\server.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\server.dart</path>
<type>file</type>
<content>
1: import 'dart:io';
2: 
3: import 'package:serverpod/serverpod.dart';
4: import 'package:serverpod_auth_idp_server/core.dart';
5: import 'package:serverpod_auth_idp_server/providers/email.dart';
6: 
7: import 'src/generated/endpoints.dart';
8: import 'src/generated/protocol.dart';
9: import 'src/web/routes/app_config_route.dart';
10: 
11: /// The starting point of the Serverpod server.
12: void run(List<String> args) async {
13:   // Initialize Serverpod and connect it with your generated code.
14:   final pod = Serverpod(args, Protocol(), Endpoints());
15: 
16:   // Initialize authentication services for the server.
17:   // Token managers will be used to validate and issue authentication keys,
18:   // and the identity providers will be the authentication options available for users.
19:   pod.initializeAuthServices(
20:     tokenManagerBuilders: [
21:       // Use JWT for authentication keys towards the server.
22:       JwtConfigFromPasswords(),
23:     ],
24:     identityProviderBuilders: [
25:       // Configure the email identity provider for email/password authentication.
26:       EmailIdpConfigFromPasswords(
27:         sendRegistrationVerificationCode: _sendRegistrationCode,
28:         sendPasswordResetVerificationCode: _sendPasswordResetCode,
29:       ),
30:     ],
31:   );
32: 
33:   // Build the web server routes.
34:   pod.webServer.addRoute(StaticRoute.file(File('web/pages/index.html')), '/');
35:   pod.webServer.addRoute(StaticRoute.file(File('web/pages/index.html')), '/index.html');
36:   
37:   // Create and serve static files (CSS, Images, etc)
38:   final staticDir = Directory('web/static');
39:   pod.webServer.addRoute(StaticRoute.directory(staticDir), '/static/*');
40: 
41:   // App configuration route (needed by Flutter)
42:   pod.webServer.addRoute(
43:     AppConfigRoute(apiConfig: pod.config.apiServer),
44:     '/app/assets/assets/config.json',
45:   );
46: 
47:   // Serve the Flutter web app (if built)
48:   final appDir = Directory('web/app');
49:   final indexHtml = File('web/app/index.html');
50:   if (indexHtml.existsSync()) {
51:     pod.webServer.addRoute(FlutterRoute(appDir), '/app/*');
52:   } else {
53:     stderr.writeln('WARNING: web/app/index.html not found. Flutter web app will not be served.');
54:   }
55: 
56:   // Start the server.
57:   await pod.start();
58: 
59:   // Seed default quiz
60:   await _seedDefaultQuiz(pod);
61: }
62: 
63: Future<void> _seedDefaultQuiz(Serverpod pod) async {
64:   final session = await pod.createSession();
65:   try {
66:     final quizzes = await Quiz.db.find(session, limit: 1);
67:     if (quizzes.isEmpty) {
68:       stdout.writeln('Seeding default trivia quiz...');
69:       var quiz = Quiz(
70:         title: 'General Trivia Spark',
71:         creatorId: 1,
72:         description: 'Test your general knowledge with these fun questions!',
73:         createdAt: DateTime.now(),
74:       );
75:       quiz = await Quiz.db.insertRow(session, quiz);
76: 
77:       final questions = [
78:         Question(
79:           quizId: quiz.id!,
80:           text: 'Which planet is known as the Red Planet?',
81:           options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
82:           correctOptionIndex: 1,
83:           timeLimitSeconds: 20,
84:           orderIndex: 0,
85:         ),
86:         Question(
87:           quizId: quiz.id!,
88:           text: 'What is the chemical symbol for gold?',
89:           options: ['Gd', 'Au', 'Ag', 'Fe'],
90:           correctOptionIndex: 1,
91:           timeLimitSeconds: 15,
92:           orderIndex: 1,
93:         ),
94:         Question(
95:           quizId: quiz.id!,
96:           text: 'Who painted the Mona Lisa?',
97:           options: ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
98:           correctOptionIndex: 2,
99:           timeLimitSeconds: 20,
100:           orderIndex: 2,
101:         ),
102:         Question(
103:           quizId: quiz.id!,
104:           text: 'How many bones are there in an adult human body?',
105:           options: ['106', '206', '306', '406'],
106:           correctOptionIndex: 1,
107:           timeLimitSeconds: 20,
108:           orderIndex: 3,
109:         ),
110:       ];
111: 
112:       for (var q in questions) {
113:         await Question.db.insertRow(session, q);
114:       }
115:       stdout.writeln('Seeding complete!');
116:     }
117:   } catch (e) {
118:     stderr.writeln('Failed to seed default quiz: $e');
119:   } finally {
120:     await session.close();
121:   }
122: }
123: 
124: void _sendRegistrationCode(
125:   Session session, {
126:   required String email,
127:   required UuidValue accountRequestId,
128:   required String verificationCode,
129:   required Transaction? transaction,
130: }) {
131:   // NOTE: Here you call your mail service to send the verification code to
132:   // the user. For testing, we will just log the verification code.
133:   session.log('[EmailIdp] Registration code ($email): $verificationCode');
134: }
135: 
136: void _sendPasswordResetCode(
137:   Session session, {
138:   required String email,
139:   required UuidValue passwordResetRequestId,
140:   required String verificationCode,
141:   required Transaction? transaction,
142: }) {
143:   // NOTE: Here you call your mail service to send the verification code to
144:   // the user. For testing, we will just log the verification code.
145:   session.log('[EmailIdp] Password reset code ($email): $verificationCode');
146: }

(End of file - total 146 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\bin\\main.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\bin\main.dart</path>
<type>file</type>
<content>
1: import 'package:namma_kahoot_server/server.dart';
2: 
3: /// This is the starting point for your Serverpod server. Typically, there is
4: /// no need to modify this file.
5: void main(List<String> args) {
6:   run(args);
7: }

(End of file - total 7 lines)
</content>
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 5.6s)

_Thinking:_

Now let me check endpoints, models, and the client config. Also check the Flutter app's config for hosting. And check jaspr for hardcoded server URL.

Also need up-to-date Serverpod Cloud docs. Serverpod Cloud is a deployment platform announced in 2025. Key things: `serverpod cloud deploy`, project config, `serverpod_cloud_cli`, linking project, `config/cloud.yaml`? Let me fetch docs.

Let me search the web for Serverpod Cloud docs.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem -Recurse -File -Path namma_quiz_server\\lib | Where-Object { $_.FullName -notmatch '\\\\(generated)\\\\' } | Select-Object -ExpandProperty FullName; Write-Output \"---MODELS---\"; Get-ChildItem -Recurse -File -Path namma_quiz_server\\lib\\src\\protocol 2>$null | Select-Object -ExpandProperty Name"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\server.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\auth\email_idp_endpoint.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\auth\jwt_refresh_endpoint.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\endpoints\admin_endpoint.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\endpoints\kahoot_endpoint.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\models\kahoot\game_event.spy.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\models\kahoot\game_session.spy.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\models\kahoot\player.spy.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\models\kahoot\question.spy.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\models\kahoot\quiz.spy.yaml
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\web\routes\app_config_route.dart
---MODELS---

```

**Tool: grep**

**Input:**
```json
{
  "pattern": "localhost|10\\.0\\.2\\.2|serverUrl|SERVER_URL|:8080|:8082",
  "include": "*.dart",
  "path": "D:\\StudioProjects\\NammaFlutter\\namma-quiz"
}
```

**Output:**
```
Found 6 matches
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\main.dart:
  Line 16: late String serverUrl;

  Line 26:   // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.

  Line 29:   // defaults to http://$localhost:8080/ if not found.

  Line 30:   final serverUrl = await getServerUrl();

  Line 32:   client = Client(serverUrl)


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\client_provider.dart:
  Line 5: final client = Client('http://localhost:8080/');

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 4.0s)

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\lib\\src\\endpoints\\kahoot_endpoint.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\endpoints\kahoot_endpoint.dart</path>
<type>file</type>
<content>
1: import 'package:serverpod/serverpod.dart';
2: import 'dart:math';
3: import '../generated/protocol.dart';
4: 
5: class KahootEndpoint extends Endpoint {
6:   
7:   /// Create a new Game Session from a Quiz and return the PIN
8:   Future<GameSession> createGame(Session session, int quizId, int hostId) async {
9:     var rng = Random();
10:     var pin = (rng.nextInt(900000) + 100000).toString();
11: 
12:     var game = GameSession(
13:       pin: pin,
14:       quizId: quizId,
15:       hostId: hostId,
16:       status: 'lobby',
17:       currentQuestionIndex: 0,
18:     );
19: 
20:     game = await GameSession.db.insertRow(session, game);
21:     return game;
22:   }
23: 
24:   /// Get Game Info by PIN
25:   Future<GameSession?> getGameByPin(Session session, String pin) async {
26:     return await GameSession.db.findFirstRow(
27:       session,
28:       where: (t) => t.pin.equals(pin),
29:     );
30:   }
31: 
32:   /// Players and Host call this stream to receive real-time updates
33:   Stream<GameEvent> gameStream(Session session, String pin, bool isHost) async* {
34:     var channel = isHost ? 'game-$pin-host' : 'game-$pin';
35:     yield* session.messages.createStream<GameEvent>(channel);
36:   }
37: 
38:   /// Send an event manually over the channel
39:   Future<void> sendEvent(Session session, String pin, GameEvent event, bool toHostOnly) async {
40:     if (toHostOnly) {
41:       await session.messages.postMessage('game-$pin-host', event);
42:     } else {
43:       await session.messages.postMessage('game-$pin', event);
44:       await session.messages.postMessage('game-$pin-host', event);
45:     }
46:   }
47: 
48:   /// Join a game
49:   Future<Player?> joinGame(Session session, String pin, String username) async {
50:     var game = await getGameByPin(session, pin);
51:     if (game == null || game.status != 'lobby') return null;
52: 
53:     var player = Player(
54:       gameSessionId: game.id!,
55:       name: username,
56:       score: 0,
57:     );
58: 
59:     player = await Player.db.insertRow(session, player);
60: 
61:     // Notify ONLY the host that a player joined
62:     await session.messages.postMessage('game-$pin-host', GameEvent(
63:       eventType: 'PLAYER_JOINED',
64:       dataJson: '{"playerId": ${player.id}, "name": "$username"}',
65:     ));
66: 
67:     return player;
68:   }
69: 
70:   /// Host starts the first question
71:   Future<void> startQuestion(Session session, String pin) async {
72:     var game = await getGameByPin(session, pin);
73:     if (game != null) {
74:       game.status = 'active';
75:       game.startTime = DateTime.now();
76:       await GameSession.db.updateRow(session, game);
77: 
78:       final event = GameEvent(
79:         eventType: 'QUESTION_STARTED',
80:         dataJson: '{"questionIndex": ${game.currentQuestionIndex}}',
81:       );
82:       
83:       // Notify both host and players
84:       await session.messages.postMessage('game-$pin', event);
85:       await session.messages.postMessage('game-$pin-host', event);
86:     }
87:   }
88: 
89:   /// Host transitions to the next question
90:   Future<GameSession?> nextQuestion(Session session, String pin) async {
91:     var game = await getGameByPin(session, pin);
92:     if (game == null) return null;
93: 
94:     game.currentQuestionIndex += 1;
95:     game.status = 'active';
96:     game.startTime = DateTime.now();
97:     
98:     await GameSession.db.updateRow(session, game);
99: 
100:     final event = GameEvent(
101:       eventType: 'QUESTION_STARTED',
102:       dataJson: '{"questionIndex": ${game.currentQuestionIndex}}',
103:     );
104: 
105:     // Notify both host and players
106:     await session.messages.postMessage('game-$pin', event);
107:     await session.messages.postMessage('game-$pin-host', event);
108: 
109:     return game;
110:   }
111: 
112:   /// Player submits an answer, returning points earned
113:   Future<int> submitAnswer(Session session, String pin, int playerId, int optionIndex) async {
114:     var game = await getGameByPin(session, pin);
115:     if (game == null || game.status != 'active' || game.startTime == null) return 0;
116: 
117:     var question = await Question.db.findFirstRow(
118:       session,
119:       where: (t) => t.quizId.equals(game.quizId) & t.orderIndex.equals(game.currentQuestionIndex),
120:     );
121: 
122:     if (question == null) return 0;
123: 
124:     int points = 0;
125:     if (question.correctOptionIndex == optionIndex) {
126:        final timeTaken = DateTime.now().difference(game.startTime!).inSeconds;
127:        final timeLimit = question.timeLimitSeconds;
128:        if (timeTaken <= timeLimit) {
129:            // Fast answer gives more points (Kahoot-like scaling)
130:            points = (1000 * (1 - (timeTaken / (timeLimit * 2.0)))).round();
131:            if (points < 500) points = 500; // Base points for correct answer
132:        } else {
133:            points = 500; // Correct but slow
134:        }
135:     }
136: 
137:     if (points > 0) {
138:         var player = await Player.db.findById(session, playerId);
139:         if (player != null) {
140:             player.score += points;
141:             await Player.db.updateRow(session, player);
142:         }
143:     }
144: 
145:     // Send answer received to the host for real-time charts
146:     await session.messages.postMessage('game-$pin-host', GameEvent(
147:       eventType: 'ANSWER_RECEIVED',
148:       dataJson: '{"playerId": $playerId, "optionIndex": $optionIndex, "points": $points}',
149:     ));
150: 
151:     return points;
152:   }
153: 
154:   /// Host ends the question, locking responses and revealing the answer
155:   Future<void> endQuestion(Session session, String pin) async {
156:     var game = await getGameByPin(session, pin);
157:     if (game == null || game.status != 'active') return;
158: 
159:     game.status = 'paused';
160:     await GameSession.db.updateRow(session, game);
161: 
162:     var question = await Question.db.findFirstRow(
163:       session,
164:       where: (t) => t.quizId.equals(game.quizId) & t.orderIndex.equals(game.currentQuestionIndex),
165:     );
166: 
167:     final correctIndex = question?.correctOptionIndex ?? 0;
168: 
169:     final event = GameEvent(
170:       eventType: 'QUESTION_ENDED',
171:       dataJson: '{"questionIndex": ${game.currentQuestionIndex}, "correctOptionIndex": $correctIndex}',
172:     );
173: 
174:     // Notify both host and players
175:     await session.messages.postMessage('game-$pin', event);
176:     await session.messages.postMessage('game-$pin-host', event);
177:   }
178: 
179:   /// Host shows leaderboard
180:   Future<void> showLeaderboard(Session session, String pin) async {
181:     var game = await getGameByPin(session, pin);
182:     if (game == null) return;
183: 
184:     // Get top 5 players
185:     var topPlayers = await Player.db.find(
186:       session,
187:       where: (t) => t.gameSessionId.equals(game.id),
188:       orderBy: (t) => t.score,
189:       orderDescending: true,
190:       limit: 5,
191:     );
192:     
193:     var leaderboardList = topPlayers.map((p) => '{"name": "${p.name}", "score": ${p.score}}').toList();
194:     var dataJson = '{"topPlayers": $leaderboardList}';
195: 
196:     final event = GameEvent(
197:       eventType: 'SHOW_LEADERBOARD',
198:       dataJson: dataJson,
199:     );
200: 
201:     await session.messages.postMessage('game-$pin', event);
202:     await session.messages.postMessage('game-$pin-host', event);
203:   }
204: 
205:   /// Host finishes the game and reveals the podium (top 3)
206:   Future<void> finishGame(Session session, String pin) async {
207:     var game = await getGameByPin(session, pin);
208:     if (game == null) return;
209: 
210:     game.status = 'finished';
211:     await GameSession.db.updateRow(session, game);
212: 
213:     // Get top 3 players
214:     var topPlayers = await Player.db.find(
215:       session,
216:       where: (t) => t.gameSessionId.equals(game.id),
217:       orderBy: (t) => t.score,
218:       orderDescending: true,
219:       limit: 3,
220:     );
221: 
222:     var podiumList = topPlayers.map((p) => '{"name": "${p.name}", "score": ${p.score}}').toList();
223:     var dataJson = '{"topPlayers": $podiumList}';
224: 
225:     final event = GameEvent(
226:       eventType: 'GAME_FINISHED',
227:       dataJson: dataJson,
228:     );
229: 
230:     await session.messages.postMessage('game-$pin', event);
231:     await session.messages.postMessage('game-$pin-host', event);
232:   }
233: }

(End of file - total 233 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\lib\\src\\web\\routes\\app_config_route.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\web\routes\app_config_route.dart</path>
<type>file</type>
<content>
1: import 'package:serverpod/serverpod.dart';
2: 
3: class AppConfigWidget extends JsonWidget {
4:   final String apiUrl;
5: 
6:   AppConfigWidget({
7:     required this.apiUrl,
8:   }) : super(object: {'apiUrl': apiUrl});
9: }
10: 
11: class AppConfigRoute extends WidgetRoute {
12:   AppConfigWidget widget;
13: 
14:   AppConfigRoute({
15:     required final ServerConfig apiConfig,
16:   }) : widget = AppConfigWidget(apiUrl: apiConfig.apiUrl.toString());
17: 
18:   @override
19:   Future<WebWidget> build(Session session, Request request) async {
20:     return widget;
21:   }
22: }
23: 
24: extension on ServerConfig {
25:   Uri get apiUrl => Uri(
26:     scheme: publicScheme,
27:     host: publicHost,
28:     port: publicPort,
29:   );
30: }

(End of file - total 30 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_server\\config\\development.yaml"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\development.yaml</path>
<type>file</type>
<content>
1: # This is the configuration file for your local development environment. By
2: # default, it runs a single server on port 8080. To set up your server, you will
3: # need to add the name of the database you are connecting to and the user name.
4: # The password for the database is stored in the config/passwords.yaml.
5: #
6: # When running your server locally, the server ports are the same as the public
7: # facing ports.
8: 
9: # Configuration for the main API server.
10: apiServer:
11:   port: 8080
12:   publicHost: localhost
13:   publicPort: 8080
14:   publicScheme: http
15: 
16: # Configuration for the Insights server.
17: insightsServer:
18:   port: 8081
19:   publicHost: localhost
20:   publicPort: 8081
21:   publicScheme: http
22: 
23: # Configuration for the web server.
24: webServer:
25:   port: 8082
26:   publicHost: localhost
27:   publicPort: 8082
28:   publicScheme: http
29: 
30: # This is the database setup for your server.
31: database:
32:   host: localhost
33:   port: 8090
34:   name: namma_kahoot
35:   user: postgres
36:   requireSsl: false # Local Docker Postgres does not require SSL
37:   #isUnixSocket: true # defaults to false
38:   #maxConnectionCount: 10 # Defaults to 10, a negative or null value removes the limit
39: 
40: # This is the setup for Redis.
41: redis:
42:   enabled: false
43:   host: localhost
44:   port: 8091
45:   #user: # defaults to empty
46:   #requireSsl: true # defaults to false
47: 
48: maxRequestSize: 524288 # The maximum size of requests allowed in bytes
49: 
50: sessionLogs:
51:   persistentEnabled: true
52:   consoleEnabled: true
53:   consoleLogFormat: text # Defaults to "json", options are "text" or "json"
54: 
55: # futureCallExecutionEnabled: true # Defaults to true
56: 
57: #futureCall:
58: #  concurrencyLimit: 1 # Defaults to 1, a negative or null value removes the limit
59: #  scanInterval: 5000 # Unit in milliseconds, defaults to 5000

(End of file - total 59 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_flutter\\lib\\main.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\main.dart</path>
<type>file</type>
<content>
1: import 'package:namma_kahoot_client/namma_kahoot_client.dart';
2: import 'package:flutter/material.dart';
3: import 'package:serverpod_flutter/serverpod_flutter.dart';
4: import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
5: import 'package:flutter_riverpod/flutter_riverpod.dart';
6: import 'features/kahoot/kahoot_home_screen.dart';
7: /// Sets up a global client object that can be used to talk to the server from
8: /// anywhere in our app. The client is generated from your server code
9: /// and is set up to connect to a Serverpod running on a local server on
10: /// the default port. You will need to modify this to connect to staging or
11: /// production servers.
12: /// In a larger app, you may want to use the dependency injection of your choice
13: /// instead of using a global client object. This is just a simple example.
14: late final Client client;
15: 
16: late String serverUrl;
17: 
18: void main() async {
19:   WidgetsFlutterBinding.ensureInitialized();
20: 
21:   // When you are running the app on a physical device, you need to set the
22:   // server URL to the IP address of your computer. You can find the IP
23:   // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
24:   //
25:   // You can set the variable when running or building your app like this:
26:   // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.
27:   //
28:   // Otherwise, the server URL is fetched from the assets/config.json file or
29:   // defaults to http://$localhost:8080/ if not found.
30:   final serverUrl = await getServerUrl();
31: 
32:   client = Client(serverUrl)
33:     ..connectivityMonitor = FlutterConnectivityMonitor()
34:     ..authSessionManager = FlutterAuthSessionManager();
35: 
36:   client.auth.initialize();
37: 
38:   runApp(const ProviderScope(child: MyApp()));
39: }
40: 
41: class MyApp extends StatelessWidget {
42:   const MyApp({super.key});
43: 
44:   @override
45:   Widget build(BuildContext context) {
46:     // Basic web parameter support
47:     final currentUri = Uri.base;
48:     final pin = currentUri.queryParameters['pin'];
49:     final role = currentUri.queryParameters['role'];
50: 
51:     return MaterialApp(
52:       title: 'Namma Quiz',
53:       theme: ThemeData(
54:         primarySwatch: Colors.deepPurple,
55:         useMaterial3: true,
56:       ),
57:       home: KahootHomeScreen(initialPin: pin, initialRole: role),
58:     );
59:   }
60: }

(End of file - total 60 lines)
</content>
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 6.5s)

_Thinking:_

Important architectural issues for Serverpod Cloud:
- Uses `session.messages` (message central / Redis or in-memory) — Serverpod Cloud may support? Serverpod Cloud is a managed platform by Serverpod team. In Serverpod Cloud, Redis may not be available; message central defaults to in-memory in single-server mode... Need to check docs. Serverpod Cloud may support "serverpod_cloud" specifics: managed Postgres, no Redis, scale-to-zero, file storage via serverpod cloud? Actually Serverpod 3 has `serverpod_cloud` with a `cloud` config? Let me research.

Let me fetch serverpod cloud docs.

**Tool: websearch**

**Input:**
```json
{
  "query": "Serverpod Cloud deploy documentation 2026 serverpod cloud CLI",
  "numResults": 8
}
```

**Output:**
```
{
  "search_id": "search_2d5466d33017be0648dd9634fea5c9db",
  "results": [
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/deploy",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nscloud deploy\n\nscloud deploy packages your project, uploads it to Serverpod Cloud, and waits for the new version to go live. Run it from the directory containing scloud.yaml (typically your project root or server directory) or pass --project-dir .\nTo validate the build without touching the running app, use scloud deploy --wet-run (optionally with --show-files to preview the upload). To follow an in-flight deploy, run scloud status deployment show .\nFor the full deploy lifecycle, pre-deploy hooks, and how to recover from a failed deploy, see Deployments and Recover from a failed deploy .\n\nUsage ​\n\nDeploy a Serverpod project to the cloud. Usage: scloud deploy [arguments] -h, --help                     Print this usage information. -p, --project (mandatory)      The ID of the project. Can be passed as the first argument. Can be omitted for existing projects that are linked (see the \"project link\" command). -c, --concurrency=<integer>    Number of concurrent files processed when zipping the project. (defaults to \"5\") --wet-run                  Perform every step except the deployment, leaving the hosted application untouched. Local files may still be modified. --show-files               Display the file tree that will be uploaded. --redeploy                 Redeploy the currently running build with the latest variables and secrets. Skips zipping and uploading the project. -o, --output                   Save the deployment zip file to the specified path. Must end with .zip --[no-]await               Await the deployment to finish while showing status progression. (defaults to on) --dart-version             Overrides the Dart SDK version to use for building the project. Run \"scloud help\" to see global options. Examples Deploy your project to the cloud $ scloud deploy Preview the file tree that will be uploaded $ scloud deploy --show-files The output shows files that will be included in the deployment, as well as files that are ignored (marked with \"(ignored)\"). This is useful for verifying that your .gitignore and .scloudignore files are working as expected. You can combine it with --wet-run to preview the file tree without actually deploying: $ scloud deploy --wet-run --show-files Save the deployment zip file locally $ scloud deploy --output deployment.zip --wet-run Save the deployment zip and still upload it (unless --wet-run is set) $ scloud deploy --output deployment.zip Redeploy the currently running build with the latest variables and secrets $ scloud deploy --redeploy See the full documentation at: docs.serverpod.dev/cloud/reference/cli/commands/deploy\nEdit this page\nPrevious db Next domain\n* Usage\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/getting-started/launch",
      "title": "Deploy your first app | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nDeploy your first app\n\nGet your Serverpod app live on Cloud in a few minutes.\n\nBefore you start ​\n\nYou need:\n* The Serverpod Cloud CLI set up and authenticated. See Set up the Cloud CLI .\n* A Serverpod project on your machine. See Creating a new project in the Serverpod installation guide.\n\nLaunch your project ​\n\nFrom your project's root directory:\nserverpod cloud launch\nIt creates a Cloud project and ships its first version in these steps:\n1. Choose the project. If your account has no projects, the command asks \"Open the browser and create a new Serverpod Cloud project?\" Press Enter to accept. If you already have projects, it lists them, with a last option to create a new project in the browser.\n2. Create the project in the Console. If you chose to create a new project, the Console's New project page opens. The project ID is pre-filled from your pubspec name (for example, my-app ), and the database is switched on if your server config has a database section. Change either if you need to. Pick a plan (see Cloud plans ), click Launch Project , and return to the terminal. The project ID becomes part of your default URL ( <project-id>.serverpod.space ).\n3. Pre-deploy hooks. The command adds serverpod generate as a pre-deploy hook, plus serverpod run flutter_build if your server's pubspec.yaml defines that script. See Deployment hooks for details.\n4. Custom passwords. If config/passwords.yaml has custom passwords, the command asks which ones to copy to Cloud. Passwords from the production and shared sections are preselected. Set the rest later with serverpod cloud password set .\nThe command then writes a scloud.yaml linking subsequent commands to the project, uploads your code, and deploys.\n\nWatch the deployment ​\n\nThe deployment runs in three stages. The terminal updates each one as it progresses:\nUpload successful. Cloud build successful. Rollout successful. 🚀\nWhen you see the rocket on Rollout , your app is live. The command then prints your project ID and the URLs your project is reachable at:\nYour Serverpod Cloud project ID is: my-app When the server has started, you can access it at: Web:      my-app.serverpod.space/ API:      my-app.api.serverpod.space/ Insights: my-app.insights.serverpod.space/\n\nOpen your app ​\n\nIn your browser, open the Web URL the command printed:\nmy-app.serverpod.space/\nYour Flutter web app loads at the root. If the app wasn't built before the upload, a Flutter web app not built page loads instead. Projects created with the website option show a landing page at the root, with the Flutter web app under /app .\n\nWhat you've done ​\n\nYou've created a Cloud project and shipped its first version. From here:\n* Every change you make ships with serverpod cloud deploy . See Deployments for the full deploy lifecycle.\n* To use your own domain instead of <project>.serverpod.space , see Custom domains .\nEdit this page\nPrevious Set up the Cloud CLI Next Deployments\n* Before you start\n* Launch your project\n* Watch the deployment\n* Open your app\n* What you've done\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/get-started/deployment",
      "title": "Deploy your app | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nDeploy your app\n\nYour recipe app runs locally. The last step is to put it online. The recommended path is Serverpod Cloud , which hosts your server and database with zero configuration.\n\nDeploy to Serverpod Cloud ​\n\nFrom your project's root folder, run:\n$ serverpod cloud launch\nThe command walks you through these steps:\n1. If the Serverpod Cloud CLI isn't installed yet, serverpod cloud installs it first.\n2. If you aren't signed in, your browser opens so you can sign in.\n3. For a new project, the Cloud Console opens so you can create it. Keep the database enabled there, because the recipe app stores its recipes in it. Cloud provisions a managed Postgres database, separate from the embedded one serverpod start runs locally.\n4. You choose which custom passwords from config/passwords.yaml to copy to Cloud. That file stays on your machine and is never deployed. Select geminiApiKey so the deployed server can call Gemini. It isn't selected by default, because it sits in the development section.\n5. The command deploys your server along with the web build of your app.\nThe first upload includes your Flutter web build and can exceed the default timeout on a slower connection. If the upload times out, retry with a higher limit, for example, serverpod cloud launch --timeout 600s .\nIf you didn't select geminiApiKey , set the key as a secret. Then redeploy so the server picks it up:\n$ serverpod cloud password set geminiApiKey \"your-gemini-api-key\" $ serverpod cloud deploy\nWhenever you make changes later, redeploy with:\n$ serverpod cloud deploy\nSee the Serverpod Cloud documentation for the full walkthrough, including custom domains, logs, and your free trial."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/deployment/deploying-your-application",
      "title": "Deploying your application | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deploying your application\n\nServerpod Cloud makes it easy to deploy your Serverpod applications with a single command. You can also perform dry runs to validate your deployment package without actually deploying it.\n\nGenerating code before deployment ​\n\nBefore deploying your application, you should always generate your code to ensure all your models and endpoints are up to date:\nserverpod generate\n\nStandard deployment ​\n\nTo deploy your application to Serverpod Cloud:\nscloud deploy\nThe CLI will:\n1. Package your application\n2. Upload it to Serverpod Cloud\n3. Start the deployment process\n4. Provide URLs to access your application when ready\n\nSuccessful deployment ​\n\nAfter a successful deployment, you'll see a message like:\nProject uploaded successfully! 🚀 When the server has started, you can access it at: Web:      my-app.serverpod.space/ API:      my-app.api.serverpod.space/ Insights: my-app.insights.serverpod.space/ See the `scloud domain` command to set up a custom domain.\n\nPerforming a dry run ​\n\nA dry run lets you validate your deployment package without actually deploying it:\nscloud deploy --dry-run\nThis will:\n* Package your application\n* Validate the package contents\n* Skip the actual upload and deployment\n\nGetting more deployment insights ​\n\nFor detailed information during deployment:\nscloud deploy --verbose\nThis shows detailed error messages if something goes wrong.\n\nViewing the file tree ​\n\nTo see a visual representation of the file tree that will be uploaded:\nscloud deploy --show-files\nThis displays a tree structure showing all files that will be included in the deployment, as well as files that are ignored (marked with \"(ignored)\").\n\nControlling concurrency ​\n\nYou can control how many files are zipped concurrently during packaging:\nscloud deploy --concurrency 5\nHigher concurrency can speed up deployments.\n\nChecking deployment status ​\n\nCheck the status of your most recent deployment:\nscloud deployment show\nList all deployments:\nscloud deployment list\nWhen listing all deployments, you'll see output similar to this:\n# | Project | Deploy Id                            | Status  | Started             | Finished            | Info --+---------+--------------------------------------+---------+---------------------+---------------------+----------------------------------- 0 | my-app  | 3bbb0189-784b-4b9b-a3d9-c84f4c787f54 | FAILURE | 2025-03-28 13:42:38 | 2025-03-28 13:43:33 | User build FAILURE - see build log 1 | my-app  | 4a60a5ec-067c-4c76-8ecd-30a6410c1dc2 | SUCCESS | 2025-03-27 15:24:57 | 2025-03-27 15:27:50 | 2 | my-app  | 73e66b41-64fc-4920-b6ef-4918cc6ceca1 | FAILURE | 2025-03-27 15:19:37 | 2025-03-27 15:20:34 | User build FAILURE - see build log 3 | my-app  | 4bb1e636-3ec8-4f78-b294-32c80efd513a | SUCCESS | 2025-03-27 10:12:36 | 2025-03-27 10:19:48 |\nView detailed logs for a specific deployment using its ID:\nscloud deployment show 73e66b41-64fc-4920-b6ef-4918cc6ceca1\n\nManaging deployment files ​"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/getting-started/installation",
      "title": "Set up the Cloud CLI | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nSet up the Cloud CLI\n\nThe Serverpod Cloud CLI is the command-line tool that deploys and manages your projects on Serverpod Cloud. This page shows how to set it up and authenticate it with your account. After completing these steps, you're ready to deploy your first Serverpod app.\n\nPrerequisites ​\n\nBefore you start, make sure you have:\n* The Serverpod CLI, version 4.0 or later. Follow the Serverpod installation guide . To use the Cloud CLI without it, see Install the Cloud CLI on its own .\n* A Serverpod Cloud account. Sign up for Cloud .\n\nRun the Cloud CLI through the Serverpod CLI ​\n\nThe Serverpod CLI includes a cloud command that passes everything after it to the Cloud CLI. If the Cloud CLI isn't installed yet, the first serverpod cloud command installs it, so there's nothing else to set up.\nCheck that the Cloud CLI works:\nserverpod cloud version\nIf the command prints a version number, the Cloud CLI is ready to use.\n\nInstall the Cloud CLI on its own ​\n\nIf you'd rather not use the Serverpod CLI, install the Cloud CLI on its own with Dart :\ndart install serverpod_cloud_cli\nThis adds the scloud executable, which takes the same commands as serverpod cloud . Use scloud wherever these docs show serverpod cloud , for example scloud version to verify the install.\n\nAuthenticate the CLI ​\n\nLog in to your Serverpod Cloud account from the terminal:\nserverpod cloud auth login\nThis opens a browser window where you authenticate. Once authentication completes, the CLI is authorized to manage your Serverpod Cloud projects.\nEdit this page\nPrevious Introduction Next Deploy your first app\n* Prerequisites\n* Run the Cloud CLI through the Serverpod CLI\n* Install the Cloud CLI on its own\n* Authenticate the CLI\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/launch",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nscloud launch\n\nscloud launch is the front door for new projects: it links your local server to a Serverpod Cloud project and deploys for the first time. You pick one of your projects, or create a new one in the Console with the project ID and database setting pre-filled from your project. The command then adds pre-deploy hooks, offers to copy custom passwords from config/passwords.yaml , and deploys.\nOnce your project is linked, you typically switch to scloud deploy for subsequent updates. For non-interactive project creation (no prompts), use scloud project create and pass the settings as flags.\nSee Deploy your first app for the full walkthrough.\n\nUsage ​\n\nCommon command to launch and deploy Serverpod Cloud projects. If there already is a Serverpod Cloud project near the current directory it will redeploy the project (upload, build, and rollout in the cloud). Otherwise it will guide you through setting up a new Serverpod Cloud project. Usage: scloud launch [arguments] -h, --help                       Print this usage information. -p, --project                    The ID of the project. --[no-]pre-deploy-scripts    Set up pre-deploy scripts. (defaults to on) --dart-version               Overrides the Dart SDK version to use for building the project. -u, --[no-]utc                   Display timestamps in UTC timezone instead of local. Set SERVERPOD_CLOUD_DISPLAY_UTC=true to make UTC the default for all commands. Deployment options -c, --concurrency=<integer>      Number of concurrent files processed when zipping the project. (defaults to \"5\") --wet-run                    Perform every step except the deployment, leaving the hosted application untouched. Local files and the cloud project setup may still be modified. --show-files                 Display the file tree that will be uploaded. -o, --output                     Save the deployment zip file to the specified path. Must end with .zip --[no-]await                 Await the deployment to finish while showing status progression. (defaults to on) Run \"scloud help\" to see global options. See the full documentation at: docs.serverpod.dev/cloud/reference/cli/commands/launch\nEdit this page\nPrevious help Next log\n* Usage\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/introduction",
      "title": "Introduction to the scloud CLI | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Introduction to the scloud CLI\n\nThe Serverpod Cloud CLI ( scloud ) creates, manages, and deploys your Serverpod projects on Cloud. This reference covers every command, option, and flag.\nEvery command also runs through the Serverpod CLI as serverpod cloud <command> , which is the form the rest of the Cloud docs use. See serverpod cloud .\n\nInstall and authenticate ​\n\nBefore running any command:\n* Set up the CLI, either through the Serverpod CLI or as scloud on its own. See Set up the Cloud CLI .\n* Authenticate with scloud auth login interactively, or pass a personal access token in non-interactive contexts like CI pipelines. See Personal access tokens .\n\nCommand syntax ​\n\nEvery scloud invocation follows the same shape:\nscloud [global options] <command> [<subcommand>] [arguments] [options]\nGlobal options can appear anywhere on the line; scloud --token foo deploy and scloud deploy --token foo are equivalent. When you run a command from a project directory containing scloud.yaml , the project ID is picked up automatically; pass -p <project-id> from anywhere else.\n\nGlobal options ​\n\nA small set of options applies to every command: authentication ( --token ), project selection ( -p / --project ), output verbosity ( -v / --verbose ), and analytics ( -a / --analytics ). The full list, including timeouts and config-file overrides, lives on the Global options page.\n\nEnvironment variables ​\n\nMost global options have an environment-variable equivalent so workflows and CI don't need flags everywhere. The two you'll reach for most often:\n* Authentication in CI: SERVERPOD_CLOUD_TOKEN (equivalent to --token ).\n* Project selection: SERVERPOD_CLOUD_PROJECT_ID (equivalent to -p ).\nThe full list is on the CLI environment variables page.\n\nWhere the concepts live ​\n\nCommand pages describe what a command does. For the why and when , the concept pages are the home:\n* Deploying, validating, rolling back: Deployments .\n* Pre- and post-deploy automation: Deployment hooks .\n* Runtime and build logs: Logs .\n* Default and custom domains: Custom domains .\n* Managed PostgreSQL: Database .\n* Sensitive values and runtime config: Passwords, secrets, and environment variables .\n* CI and headless authentication: Personal access tokens .\n\nHow this reference is organized ​\n\nEach command page combines a hand-written introduction with auto-generated subcommand and option listings drawn from scloud --help . The sidebar lists commands alphabetically. Use the search box for fast lookup by flag or argument name.\nEdit this page\nPrevious scloud.yaml schema Next Global Options\n* Install and authenticate\n* Command syntax\n* Global options\n* Environment variables\n* Where the concepts live\n* How this reference is organized\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud",
      "title": "Introduction | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nIntroduction\n\nServerpod Cloud is a managed hosting platform for Serverpod apps with predictable pricing. You deploy your app with the Serverpod Cloud CLI or via CI/CD, and use the web console for account setup, billing, and project dashboards.\nWith the Cloud CLI set up , launch your first project with one command. No Dockerfile, no container config, no infrastructure setup:\nserverpod cloud launch\n\nWhat Serverpod Cloud manages ​\n\n* Runtime and scaling. Your app runs on a production runtime that scales as traffic grows.\n* Networking and TLS. Encrypted endpoints, certificates, and load balancing work without configuration.\n* Managed Postgres (optional). Cloud can provision a production-grade Postgres database with automatic migrations and backups.\n* File storage . Cloud provisions a private and a public storage with every project, ready for the files your app uploads at runtime.\n* Secrets and environment variables . Manage sensitive values through the Cloud CLI. Values are encrypted where applicable.\n* Custom domains . Attach your own domain. TLS certificates are provisioned and renewed. Cloud hosts both your backend and a preconfigured website for your Flutter web app.\n* Logs and inspection . View logs in the CLI or in Serverpod Insights, the desktop log viewer (requires a database).\n* Pub/sub and caching. Supported through the Serverpod framework with a third-party Redis service you connect yourself. See Use Redis for PubSub and caching for the typical setup.\n\nWhere to go next ​\n\n* Set up the Cloud CLI to get the CLI ready and authenticate it.\n* Deploy your first app for a guided first deploy.\nEdit this page\nNext Set up the Cloud CLI\n* What Serverpod Cloud manages\n* Where to go next\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/deployments/deploy-to-serverpod-cloud",
      "title": "Deploy to Serverpod Cloud | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nDeploy to Serverpod Cloud\n\nServerpod Cloud is the recommended way to host a Serverpod server. It is a fully managed platform built and maintained by the Serverpod team, designed specifically for Serverpod apps. You deploy in minutes with zero configuration, and there is no VM setup, container configuration, or infrastructure to orchestrate yourself.\ninfo\nYour first project includes a one-month free trial, with no credit card required.\nCloud manages the production infrastructure for you:\n* An optional production-grade Postgres database, with migrations applied automatically on each deploy.\n* Networking, load balancing, and custom domains with TLS certificates.\n* Server instances (podlets) with predictable pricing. See Cloud plans for what each plan includes.\n* A secure key manager for your app secrets.\n\nDeploy from the terminal ​\n\nYou deploy with the Serverpod CLI:\n1. Run serverpod cloud launch . It installs the Cloud CLI if needed. If you aren't signed in, it opens your browser so you can sign in.\n2. For a new project, the Cloud Console opens so you can create it. The database setting is pre-filled from your server's config.\n3. When prompted, select the custom passwords from config/passwords.yaml to copy to Cloud. The command then deploys your server.\n4. Set any other secrets (API keys, OAuth credentials) with serverpod cloud password set . Then run serverpod cloud deploy so the server picks them up.\nSee the Serverpod Cloud documentation for the full walkthrough, including secrets, custom domains, and logs.\nTo run the server yourself instead, see Custom hosting .\nEdit this page\nPrevious Model reference Next Choosing a strategy\n* Deploy from the terminal\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/concepts/deployments",
      "title": "Deployments | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Copy as Markdown\nOn this page\n\nDeployments\n\nWhen you ship a code change to Serverpod Cloud, serverpod cloud deploy builds and rolls out a new version of your server. Cloud switches traffic automatically to the latest successful deploy, keeping the previous one live if a build fails.\n\nDeploy your app ​\n\ninfo\nIf this is the first time you're deploying this project to Cloud, follow Deploy your first app first. It walks through serverpod cloud launch , which creates the project before the first deploy.\nDeploy your project to Cloud:\nserverpod cloud deploy\nThe CLI packages your project, uploads it, and waits for the new version to go live. Once the deployment is live, your project is reachable at its default URLs:\n* Web: https://<project-id>.serverpod.space/\n* API: https://<project-id>.api.serverpod.space/\n* Insights: https://<project-id>.insights.serverpod.space/\nTo use your own URL instead, see Custom domains .\nOther flags:\n* -v ( --verbose ): detailed output.\n* --dart-version : override the Dart SDK used at build time.\n* --concurrency=<N> : how many files are zipped in parallel during packaging (default 5 ).\nTo regenerate code or run other tasks before each deploy, configure a pre-deploy hook. See Deployment hooks .\n\nCheck deployment status ​\n\nWatch the latest deployment as it runs:\nserverpod cloud status deployment show\nThe command tracks the deployment through its three lifecycle stages and updates each line as it progresses. When complete:\nTracking my-app deployment 4583d0a1-3d0a-400e-a9a5-9880da6abc94 (Press Ctrl+C to exit) Upload successful. Cloud build successful. Rollout successful. 🚀\nThe three stages are Upload (your project package reaches Cloud), Cloud build (Cloud builds the container), and Rollout (Cloud prepares the infrastructure and the new version starts serving requests).\nList recent deployments:\nserverpod cloud status deployment list\nThe list shows deploy IDs alongside status and timestamps:\n# | Project | Deploy Id                            | Status  | Started (local)     | Finished (local)    | Info --+---------+--------------------------------------+---------+---------------------+---------------------+----------------------------------- 0 | my-app  | 4583d0a1-3d0a-400e-a9a5-9880da6abc94 | SUCCESS | 2026-06-03 13:41:21 | 2026-06-03 13:46:08 | 1 | my-app  | 73e66b41-64fc-4920-b6ef-4918cc6ceca1 | FAILURE | 2026-06-02 15:19:37 | 2026-06-02 15:20:34 | User build FAILURE - see build log\nInspect a specific deployment by its ID:\nserverpod cloud status deployment show < deployment-id >\nStream the build log for a deployment that failed during the build stage:\nserverpod cloud build log\n\nValidate before deploying ​\n\nA wet run performs every step except the deployment itself, leaving the running app untouched:\nserverpod cloud deploy --wet-run\nPreview the file tree that will be uploaded, with ignored files marked:\nserverpod cloud deploy --show-files\nCombine the two flags to inspect what will be uploaded without deploying:\nserverpod cloud deploy --wet-run --show-files\nSave the package to a local zip (useful for CI inspection or air-gapped environments):\nserverpod cloud deploy --output deployment.zip --wet-run\n\nConfigure what's included ​"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud"
}
```

**Output:**
```
  Introduction | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Introduction

Serverpod Cloud is a managed hosting platform for Serverpod apps with predictable pricing. You deploy your app with the Serverpod Cloud CLI or via CI/CD, and use the web console for account setup, billing, and project dashboards.

With [the Cloud CLI set up](/cloud/getting-started/installation), launch your first project with one command. No Dockerfile, no container config, no infrastructure setup:

```
serverpod cloud launch
```

## What Serverpod Cloud manages[​](#what-serverpod-cloud-manages "Direct link to What Serverpod Cloud manages")

-   **Runtime and scaling.** Your app runs on a production runtime that scales as traffic grows. It can also [scale to zero](/cloud/concepts/scale-to-zero) instead of running while nobody uses it.
-   **Networking and TLS.** Encrypted endpoints, certificates, and load balancing work without configuration.
-   **[Managed Postgres](/cloud/concepts/database)** (optional). Cloud can provision a production-grade Postgres database with automatic migrations and backups.
-   **[File storage](/cloud/concepts/storage).** Cloud provisions a private and a public storage with every project, ready for the files your app uploads at runtime.
-   **[Secrets and environment variables](/cloud/concepts/passwords-secrets-env-vars).** Manage sensitive values through the Cloud CLI. Values are encrypted where applicable.
-   **[Custom domains](/cloud/concepts/custom-domains).** Attach your own domain. TLS certificates are provisioned and renewed. Cloud hosts both your backend and a preconfigured website for your Flutter web app.
-   **[Logs and inspection](/cloud/concepts/logs).** View logs in the CLI or in Serverpod Insights, the desktop log viewer (requires a database).
-   **Pub/sub and caching.** Supported through the Serverpod framework with a third-party Redis service you connect yourself. See [Use Redis for PubSub and caching](/cloud/guides/redis) for the typical setup.

## Where to go next[​](#where-to-go-next "Direct link to Where to go next")

-   [Set up the Cloud CLI](/cloud/getting-started/installation) to get the CLI ready and authenticate it.
-   [Deploy your first app](/cloud/getting-started/launch) for a guided first deploy.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/index.md)

[

Next

Set up the Cloud CLI

](/cloud/getting-started/installation)

-   [What Serverpod Cloud manages](#what-serverpod-cloud-manages)
-   [Where to go next](#where-to-go-next)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 25.1s)

_Thinking:_

Key facts: Serverpod Cloud is available, and CLI version 4.0+ required. But this project uses Serverpod 3.4.7. The docs say "Prerequisites: Serverpod CLI, version 4.0 or later". However, Serverpod Cloud supports Serverpod 3.x projects? Need to check. There's a cloud reference "Dart SDK versions". Also docs say launching requires serverpod 4 CLI, but perhaps 3.x project can deploy. Let me check the launch docs / cloud compat. Also key: project uses `session.messages` (streaming) — on Serverpod Cloud, Pub/Sub requires third-party Redis service configured. Without Redis, message central is in-memory, works with single pod? Cloud scales pods — multiple instances would break real-time messaging and game state? Actually message central without Redis only works within a single server instance; Serverpod Cloud may run multiple instances. Docs say pub/sub supported via third-party Redis you connect yourself. So for a Kahoot platform (critical real-time), we need Redis (Upstash likely, since Serverpod docs mention Upstash). Let me read the Redis guide and the deployment hooks, storage, scale-to-zero, Dart SDK versions pages.

Also need:
- .scloudignore
- scloud.yaml
- web app serving: Cloud serves Flutter web app at root. Our server serves web at custom routes via webServer, plus jaspr? Cloud hosts "preconfigured website for your Flutter web app". Need to understand how Cloud maps Flutter web app. The Serverpod Cloud build runs `serverpod run flutter_build` if defined in pubspec (which we have) as a pre-deploy hook. It builds the flutter app into server's web/app. But Cloud's web URL serves the Flutter web app at root... Hmm, in a standard Serverpod project, the web server serves `web/app` at root? Let's read "Cloud hosts both your backend and a preconfigured website for your Flutter web app" and app publishing.

Also production config rewriting: Cloud supplies public host automatically? Serverpod Cloud sets `SERVERPOD_CLOUD_*` env? Need to check the Cloud config behavior — I recall Serverpod Cloud automatically overrides config with cloud values; you don't need production.yaml publicHosts. Let's read database/custom domains and env vars docs.

Let's also check `config/passwords.yaml` exists and gitignored, and generator.yaml.

Let me fetch: 
1. https://docs.serverpod.dev/cloud/guides/redis
2. https://docs.serverpod.dev/cloud/concepts/passwords-secrets-env-vars
3. https://docs.serverpod.dev/cloud/concepts/deployment-hooks
4. https://docs.serverpod.dev/cloud/concepts/database
5. https://docs.serverpod.dev/cloud/reference/dart-sdk-versions
6. https://docs.serverpod.dev/cloud/concepts/scale-to-zero
7. https://docs.serverpod.dev/cloud/concepts/app-publishing maybe.

Let me parallelize.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/guides/redis"
}
```

**Output:**
```
  Use Redis for PubSub and caching | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Use Redis for PubSub and caching

Serverpod Cloud does not provide Redis. You can use a third-party Redis service and point your Serverpod app at it. This guide uses [Upstash](https://upstash.com) as an example. Other Redis-compatible providers that support TLS and password auth work with the same configuration pattern.

Serverpod uses Redis for **distributed caching** and **PubSub** when running across multiple servers. The connection is configured via environment variables and a password.

## Before you start[​](#before-you-start "Direct link to Before you start")

-   The Serverpod Cloud CLI set up and authenticated. See [Set up the Cloud CLI](/cloud/getting-started/installation).
-   A Serverpod Cloud project already deployed (or ready to deploy).

## Create a Redis database on Upstash[​](#create-a-redis-database-on-upstash "Direct link to Create a Redis database on Upstash")

1.  Sign up or log in at [Upstash](https://console.upstash.com/).
2.  Click **Create Database**.
3.  Give the database a name and choose **Primary Region**. For Serverpod Cloud, the closest option is `EU-CENTRAL-1` (Frankfurt).
4.  Choose a plan and create the database.
5.  On the database page, open **REST API** or **Connect to your database** and note:
    -   **Endpoint** (host)
    -   **Port**
    -   **Password** (copy it; you will not see it again in full in some views).

Upstash enables TLS for all databases and does not allow disabling it, so you will set `SERVERPOD_REDIS_REQUIRE_SSL` to `true` below.

## Set the Redis password in Serverpod Cloud[​](#set-the-redis-password-in-serverpod-cloud "Direct link to Set the Redis password in Serverpod Cloud")

Serverpod expects the Redis password under the built-in key `redis`. Set it with the Serverpod Cloud CLI:

```
serverpod cloud password set redis "YOUR_UPSTASH_PASSWORD"
```

Use the exact password from the Upstash database page.

## Set Redis connection variables[​](#set-redis-connection-variables "Direct link to Set Redis connection variables")

Configure host, port, enable Redis, and require SSL using environment variables:

```
serverpod cloud variable set SERVERPOD_REDIS_HOST "YOUR_UPSTASH_ENDPOINT"serverpod cloud variable set SERVERPOD_REDIS_PORT "YOUR_UPSTASH_PORT"serverpod cloud variable set SERVERPOD_REDIS_ENABLED "true"serverpod cloud variable set SERVERPOD_REDIS_REQUIRE_SSL "true"
```

Replace `YOUR_UPSTASH_ENDPOINT` with the Upstash endpoint (host only, no `rediss://` or port). Replace `YOUR_UPSTASH_PORT` with the port number as a string (most likely `6380` for Upstash).

note

If your Redis provider uses a username (e.g. ACL), you can set:

```
serverpod cloud variable set SERVERPOD_REDIS_USER "default"
```

## Redeploy[​](#redeploy "Direct link to Redeploy")

Environment variables and passwords are applied when your server deploys. Redeploy so the new Redis config is used:

```
serverpod cloud deploy
```

After a successful deploy, your server will use Upstash for Redis-backed caching and PubSub.

## Related[​](#related "Direct link to Related")

-   [Redis](/concepts/operations/redis) for enabling Redis, the password, and connecting a GUI.
-   [Serverpod configuration](/concepts/server-fundamentals/configuration) for Redis options and environment variables.
-   [Serverpod caching](/concepts/endpoints-and-apis/caching) for local and Redis-backed caches.
-   [Upstash: Connect your client](https://upstash.com/docs/redis/howto/connectclient) for connection details and TLS.
-   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars) for how Serverpod Cloud injects passwords and variables.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/guides/redis.md)

[

Previous

App publishing

](/cloud/concepts/app-publishing)[

Next

Ship non-Dart files with your server

](/cloud/guides/ship-non-dart-files)

-   [Before you start](#before-you-start)
-   [Create a Redis database on Upstash](#create-a-redis-database-on-upstash)
-   [Set the Redis password in Serverpod Cloud](#set-the-redis-password-in-serverpod-cloud)
-   [Set Redis connection variables](#set-redis-connection-variables)
-   [Redeploy](#redeploy)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/passwords-secrets-env-vars"
}
```

**Output:**
```
  Passwords, secrets, and environment variables | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Passwords, secrets, and environment variables

Your server needs sensitive values (database passwords, third-party API keys, OAuth client secrets) and runtime configuration without checking them into source. Serverpod Cloud gives you three configuration tiers. Passwords are encrypted and accessed through Serverpod's `getPassword()` API. Secrets are encrypted and injected as environment variables under a name you choose. Variables are plaintext, for non-sensitive configuration.

Passwords

Secrets

Variables

**CLI**

`serverpod cloud password`

`serverpod cloud variable set --secret`

`serverpod cloud variable`

**Stored as**

Env var with `SERVERPOD_PASSWORD_` prefix

Env var (any name)

Env var (any name)

**Encrypted**

Yes

Yes

No (values visible in CLI and Cloud console)

**Access in code**

`session.serverpod.getPassword('name')`

`Platform.environment['NAME']`

`Platform.environment['NAME']`

**Use when**

Serverpod code reads the value (preferred for sensitive values)

A dependency reads env vars and cannot use `getPassword()`

Non-sensitive config (URLs, feature flags)

Both `serverpod cloud password` and `serverpod cloud variable` follow the same shape:

-   **`--name`** (mandatory): positional or as a flag
-   **Value**: positional, `--value`, or `--from-file`
-   **`-p, --project`**: required only when the project isn't linked and no project context is set
-   **`set` is create-or-update**: running it again with the same name overwrites the value. The name stays in the tier it was created in

## Manage passwords[​](#manage-passwords "Direct link to Manage passwords")

Passwords are the default tier for sensitive values the server reads through the Serverpod API. They are encrypted at rest, never shown after they're set, and accessed in code by the name you gave them. Each password is stored under a `SERVERPOD_PASSWORD_` prefix that the CLI adds on `set` and that `getPassword()` strips on read, so the name in your code stays clean. Common cases include database passwords, JWT signing secrets, third-party API keys, and email service credentials.

Serverpod Cloud also provisions a set of platform-managed passwords automatically: database credentials, Insights tokens, `serverpod_auth_idp_server` keys, and keys for the legacy auth module. Run `serverpod cloud password list` to see them grouped into four categories: **Custom** (passwords you add), **Services** (database, Insights, and related platform passwords), **Auth** (passwords for `serverpod_auth_idp_server`), and **Legacy Auth** (passwords for the legacy authentication module). The Status column marks platform-managed passwords `AUTO (Platform)` and user-set ones `SET (User)`.

Override a platform-managed password by setting a custom value with the same name. Unset it to restore the platform default.

Set a password by name and value:

```
serverpod cloud password set myApiKey "your_secret_value"
```

Read the value in code:

```
final apiKey = session.serverpod.getPassword('myApiKey');
```

Pass `--from-file` when the value is long, multi-line, or shouldn't appear in shell history:

```
serverpod cloud password set myApiKey --from-file path/to/file.txt
```

List all configured passwords:

```
serverpod cloud password list
```

Remove a user-added password:

```
serverpod cloud password unset myApiKey
```

## Manage secrets[​](#manage-secrets "Direct link to Manage secrets")

Secrets are the right tier when a library or dependency reads a value from `Platform.environment['SOMETHING']` and can't use the Serverpod API. They're encrypted at rest, and the CLI shows their values masked after creation. Secrets share the `serverpod cloud variable` command with plaintext variables. The `--secret` flag on `set` stores the value in the secret tier.

Set a secret by name and value:

```
serverpod cloud variable set --secret API_KEY "your_secret_value"
```

Read the value in code:

```
final apiKey = Platform.environment['API_KEY'];
```

Pass `--from-file` for long, multi-line, or sensitive values you don't want in shell history:

```
serverpod cloud variable set --secret API_KEY --from-file path/to/file.txt
```

List variables and secrets together, with secret values masked (passwords are listed by `serverpod cloud password list` instead):

```
serverpod cloud variable list
```

Remove a secret:

```
serverpod cloud variable unset API_KEY
```

A name keeps the tier it was created in. Running `set` again updates the value in place. Turning a variable into a secret, or a secret back into a variable, is refused with an error. To switch tiers, `unset` the name and recreate it.

## Manage environment variables[​](#manage-environment-variables "Direct link to Manage environment variables")

Variables are for non-sensitive configuration: URLs, feature flags, region names, or other settings that don't need encryption. Values are stored in plaintext and visible in the CLI and the Cloud console.

Set a variable by name and value:

```
serverpod cloud variable set LOG_LEVEL "info"
```

Read the value in code:

```
final logLevel = Platform.environment['LOG_LEVEL'];
```

Pass `--from-file` to load the value from a file:

```
serverpod cloud variable set LOG_LEVEL --from-file path/to/file.txt
```

List configured variables and secrets:

```
serverpod cloud variable list
```

Remove a variable:

```
serverpod cloud variable unset LOG_LEVEL
```

warning

Do not use variables for API keys, tokens, or passwords. Use passwords or secrets for sensitive data.

## Limits[​](#limits "Direct link to Limits")

The same naming and size rules apply across all three tiers:

-   Names use letters (`a-z`, `A-Z`), digits (`0-9`), and underscores (`_`) only, and must start with a letter or underscore.
-   Maximum name length is 255 characters.
-   Variables and secrets each have a separate per-project storage budget of 64,000 bytes (the total of all names plus values within that tier). Passwords share the secrets budget because they're stored as secrets under the `SERVERPOD_PASSWORD_` prefix.

## Related[​](#related "Direct link to Related")

-   CLI reference: [`password`](/cloud/reference/cli/commands/password), [`variable`](/cloud/reference/cli/commands/variable)

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/passwords-secrets-env-vars.md)

[

Previous

Logs

](/cloud/concepts/logs)[

Next

Custom domains

](/cloud/concepts/custom-domains)

-   [Manage passwords](#manage-passwords)
-   [Manage secrets](#manage-secrets)
-   [Manage environment variables](#manage-environment-variables)
-   [Limits](#limits)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/deployment-hooks"
}
```

**Output:**
```
  Deployment hooks | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Deployment hooks

If you need something to run on every deploy, like code generation, deployment hooks run your own scripts as part of `serverpod cloud deploy`. Without them, those steps live in a separate command you remember to run yourself.

## When to use hooks[​](#when-to-use-hooks "Direct link to When to use hooks")

Hooks come in two shapes:

-   **`pre_deploy`** for anything that has to run *before* Cloud receives your project (regenerate Serverpod code, build a Flutter web client, compile non-Dart assets, run a test suite as a deploy gate).
-   **`post_deploy`** for anything that should fire *after* the upload completes (Slack notification, kick a downstream pipeline, mark a release in your tracker).

If your deploy doesn't depend on either, don't add hooks. Deploys work without them.

## Configure hooks[​](#configure-hooks "Direct link to Configure hooks")

Hooks live in `scloud.yaml` under `project.scripts`. Each hook accepts either a single command (string) or a list of commands (array). See the [scloud.yaml schema](/cloud/reference/scloud-yaml-schema#scripts) for the field types and validation rules.

Single command:

```
project:  projectId: my-project  scripts:    pre_deploy: serverpod generate    post_deploy: echo "Deployment complete"
```

Multiple commands run sequentially:

```
project:  projectId: my-project  scripts:    pre_deploy:      - serverpod generate      - serverpod run flutter_build    post_deploy:      - curl -X POST https://hooks.slack.com/services/YOUR/WEBHOOK -d '{"text":"Deployed"}'
```

## How scripts run[​](#how-scripts-run "Direct link to How scripts run")

Each command runs in your project directory (the one containing `scloud.yaml`) through the system shell (`bash -c` on macOS and Linux, `cmd /c` on Windows). Scripts inherit the environment variables of the shell that invoked `serverpod cloud deploy`, so CI-set secrets and your local `PATH` are available. Commands in an array run sequentially. Output streams to your terminal in real time as each one executes.

A non-zero exit code halts further commands in that hook.

warning

The `pre_deploy` and `post_deploy` hooks fail asymmetrically:

-   A failing `pre_deploy` script aborts the deploy *before* Cloud receives your code.
-   A `post_deploy` script runs *after* the upload, before Cloud finishes building and rolling out the new version. If it fails, the `serverpod cloud deploy` command exits with an error, but Cloud keeps deploying. Check the result with `serverpod cloud status deployment show`.

Plan your scripts accordingly: put anything that must succeed before your code ships in `pre_deploy`.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments) for the deploy lifecycle around hooks.
-   [CLI reference: `deploy` command](/cloud/reference/cli/commands/deploy) for all deploy flags.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/deployment-hooks.md)

[

Previous

Content delivery and caching

](/cloud/concepts/cdn)[

Next

Storage

](/cloud/concepts/storage)

-   [When to use hooks](#when-to-use-hooks)
-   [Configure hooks](#configure-hooks)
-   [How scripts run](#how-scripts-run)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/reference/dart-sdk-versions"
}
```

**Output:**
```
  Dart SDK versions | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
    -   [Dart SDK versions](/cloud/reference/dart-sdk-versions)
    -   [Private dependencies](/cloud/reference/private-dependencies)
    -   [Project identifier rules](/cloud/reference/project-id-rules)
    -   [scloud.yaml schema](/cloud/reference/scloud-yaml-schema)
    -   [CLI](/cloud/reference/cli/introduction)
        
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Dart SDK versions

Serverpod Cloud builds your server with one of a fixed set of Dart SDK versions. This page lists the supported versions and shows how to select the one your deploy uses.

## Supported versions[​](#supported-versions "Direct link to Supported versions")

-   Dart 3.8 (default)
-   Dart 3.9
-   Dart 3.10
-   Dart 3.11
-   Dart 3.12
-   Dart 3.13

## How the version is selected[​](#how-the-version-is-selected "Direct link to How the version is selected")

The `serverpod cloud deploy` command reads the Dart SDK version from the first of these sources that sets one:

1.  The `--dart-version` flag.
2.  The `dartSdk` field in `scloud.yaml`.
3.  The `dart` entry in a `.tool-versions` file, in the project directory first and then the workspace root.
4.  The `environment.sdk` constraint in `pubspec.yaml`.

Every source accepts an exact version or a pub-style version constraint, such as `3.10`, `^3.9.0`, or `>=3.9.0 <4.0.0`. Serverpod Cloud builds with the highest supported version the constraint allows. If the constraint allows no supported version, the deploy fails with an error that lists the supported versions.

When no source sets a version, your server builds with Dart 3.8.

### Pass the flag[​](#pass-the-flag "Direct link to Pass the flag")

```
# Deploy with a one-off Dart SDK version overrideserverpod cloud deploy --dart-version 3.10
```

### Set the version in scloud.yaml[​](#set-the-version-in-scloudyaml "Direct link to Set the version in scloud.yaml")

scloud.yaml

```
project:  projectId: "my-app"  dartSdk: "3.10"
```

### Use your version manager's pin[​](#use-your-version-managers-pin "Direct link to Use your version manager's pin")

Version managers such as mise and asdf pin tool versions in a `.tool-versions` file. Serverpod Cloud reads the `dart` entry:

.tool-versions

```
dart 3.10.4
```

### Use the pubspec constraint[​](#use-the-pubspec-constraint "Direct link to Use the pubspec constraint")

Without any of the sources above, the SDK constraint in your `pubspec.yaml` decides:

pubspec.yaml

```
environment:  sdk: ">=3.9.0 <4.0.0"
```

This example builds with the highest supported version, since the constraint allows all of them from 3.9 up.

## Related documentation[​](#related-documentation "Direct link to Related documentation")

-   [scloud.yaml schema](/cloud/reference/scloud-yaml-schema) - The `dartSdk` field and how Cloud CLI commands preserve it.
-   [Deployments](/cloud/concepts/deployments) - Deploy operations, status checks, and package validation.
-   [CLI reference: `deploy` command](/cloud/reference/cli/commands/deploy) - All deploy flags.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/reference/dart-sdk-versions.mdx)

[

Previous

Migrate a self-hosted database

](/cloud/guides/migrate-a-self-hosted-database)[

Next

Private dependencies

](/cloud/reference/private-dependencies)

-   [Supported versions](#supported-versions)
-   [How the version is selected](#how-the-version-is-selected)
    -   [Pass the flag](#pass-the-flag)
    -   [Set the version in scloud.yaml](#set-the-version-in-scloudyaml)
    -   [Use your version manager's pin](#use-your-version-managers-pin)
    -   [Use the pubspec constraint](#use-the-pubspec-constraint)
-   [Related documentation](#related-documentation)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/scale-to-zero"
}
```

**Output:**
```
  Scale to zero | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Scale to zero

Scale to zero stops your server while nobody is using your app and starts it again when the next request arrives. That makes it a good fit for production apps with quiet hours, and for staging projects, demos, internal tools, and apps before launch.

## Which projects scale to zero[​](#which-projects-scale-to-zero "Direct link to Which projects scale to zero")

Whether a project scales to zero depends on its plan:

Plan

Scale to zero

To change it

Starter

On

[Move the project to Growth](#turn-off-scale-to-zero) to turn it off

Growth

Off by default

[Set **Min podlets** to 0](#turn-on-scale-to-zero) to turn it on

To see whether your project scales to zero, open its **Settings** in the [Serverpod Cloud console](https://console.serverpod.dev). The **Compute** section of the **Plan** card shows the range of podlets the project can run, such as **0-1 PODLETS**. Podlets are the running copies of your server. If the range starts at 0, the project scales to zero.

From the terminal, run `serverpod cloud project show` in your project's directory. The `Compute` row ends with the same range, such as `0-1 podlets`.

## When to use scale to zero[​](#when-to-use-scale-to-zero "Direct link to When to use scale to zero")

Scale to zero suits projects with quiet periods.

It doesn't suit:

-   **Apps where every request must be fast:** The first request after a quiet period waits a few seconds while the server starts.
-   **Servers that use future calls:** [Future calls](/concepts/scheduling/overview) aren't supported with scale to zero. A call that's due while the project is idle runs late, once the next request wakes the server.

If one of these describes your project, [turn off scale to zero](#turn-off-scale-to-zero).

On Growth, you pay for the time your podlets run, so a project with zero podlets adds nothing to your podlet costs. The monthly plan fee still applies.

## How scale to zero works[​](#how-scale-to-zero-works "Direct link to How scale to zero works")

About 5 minutes after the last request ends, the project scales down to zero podlets. The console then shows its status as **Idling**.

Only requests that reach your server wake it or keep it running. Here are common activities and whether each one does:

Activity

Wakes it or keeps it running?

A request to any of your project's addresses, including your [custom domains](/cloud/concepts/custom-domains)

Yes

An uptime monitor that checks your project more often than every 5 minutes

Yes, all the time

A connection your app keeps open for [streaming methods](/concepts/endpoints-and-apis/streaming)

Yes, while it's open. If your app always keeps one open, the server keeps running while anyone has the app open.

The console's **Sessions** tab, which lists the calls to your server

Yes, on a project with a database, while the tab is open with **Auto-fetch** on (the default)

Work your server does on its own, such as a timer

No

A file the [CDN](/cloud/concepts/cdn) (content delivery network) serves from its cache

No, unless the CDN checks with your server first

A deploy

No

During a deploy, Serverpod Cloud runs the new version briefly to apply database migrations and check that it starts. An idling project then stays idle until the next request, which starts the new version. A new project's first deploy starts a podlet. If no requests arrive, the project scales down to zero about 5 minutes later.

While the project is idling, the data in your database and your stored files stay as they are. Anything your server keeps in memory, such as a cache, starts empty after a wake-up.

## Handle the first request to an idling project[​](#handle-the-first-request-to-an-idling-project "Direct link to Handle the first request to an idling project")

The first request to an idling project wakes the server. A wake-up usually takes 4 to 6 seconds. Serverpod Cloud holds the request for up to 30 seconds, then passes it on to the server once it is ready.

In rare cases where a wake-up takes longer than 30 seconds, the request fails with a timeout error (HTTP 504), but the server keeps starting.

By default, your app waits 20 seconds for an endpoint call and 5 seconds for a new streaming connection. The 20 seconds covers a typical wake-up, but the 5 seconds can be too short. To make your app wait longer, pass `connectionTimeout` and `streamingConnectionTimeout` when you create your `Client`. Also make your app retry [a call](/concepts/endpoints-and-apis/error-handling-and-exceptions#handle-errors-in-your-app) or [a streaming connection](/concepts/endpoints-and-apis/streaming#connection-level-exceptions) that fails while the server wakes up.

## Check whether your project is idling[​](#check-whether-your-project-is-idling "Direct link to Check whether your project is idling")

In the console, look under **STATUS** at the top of the project's page:

![The top of a project&#39;s page in the Serverpod Cloud console, where the status bar above the tabs shows a moon icon and Idling under STATUS.](/assets/images/project-status-5eb6738e9129a9cdb5e8eba3925a6fb1.png)

From the terminal, run this command in your project's directory:

```
serverpod cloud status live
```

From another directory, pass `-p your-project-id`.

The console status and the `Status` row of the command's output use these labels:

What's happening

Console

Cloud CLI

The server is running

**Online**

`● Running`

The server has stopped

**Idling**

`☾ Idling`

The server is waking up

**Starting**

`◐ Starting`

The server is still waking up after 30 seconds

**Unavailable**

`✖ Down`

While a project is idling, its web and API links stay available. When you open one, the server wakes up.

info

Cloud CLI versions before 1.3.0 show an error for an idling project. To see which version you have, run `serverpod cloud version`. To update, run `dart install serverpod_cloud_cli`.

## Configure scale to zero[​](#configure-scale-to-zero "Direct link to Configure scale to zero")

Scale to zero is on when **Min podlets**, the number of podlets your project always keeps running, is 0. You set it in the console, except on Starter, where it's always 0.

info

Only the project's owner can change **Min podlets**. For anyone else, **Edit plan** is dimmed, and hovering it shows who the owner is.

### Turn on scale to zero[​](#turn-on-scale-to-zero "Direct link to Turn on scale to zero")

1.  In the [Serverpod Cloud console](https://console.serverpod.dev), open your project's **Settings** and select **Edit plan**.
    
2.  In the **Compute** section, under **Autoscaling range**, set **Min podlets** to 0. The text "scales to zero when idle" appears below **Min podlets**.
    
    ![The Compute section of the console&#39;s plan panel, with the Autoscaling range below Podlet size, Min podlets set to 0, and &quot;scales to zero when idle&quot; below it.](/assets/images/settings-autoscaling-range-d234a08293714feb8a552f6cc9f8216d.png)
    
3.  Select **Save**.
    

The console confirms with "Your plan is updated". The change can take up to a minute to apply, and your server restarts once. The project then scales down to zero after about 5 minutes without requests.

### Turn off scale to zero[​](#turn-off-scale-to-zero "Direct link to Turn off scale to zero")

Starter projects always scale to zero, and the console shows **Upgrade plan** instead of **Edit plan**. To keep your server running, move the project to Growth, which keeps one podlet running by default.

On other plans, set **Min podlets** to 1 or more in the console:

1.  In the [Serverpod Cloud console](https://console.serverpod.dev), open your project's **Settings** and select **Edit plan**.
2.  In the **Compute** section, under **Autoscaling range**, set **Min podlets** to 1 or more.
3.  Select **Save**.

The console confirms with "Your plan is updated". The change can take up to a minute to apply. Your server then starts, or restarts once if it was already running.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments): how to deploy your server and check a deployment.
-   [Database](/cloud/concepts/database): the managed database, which runs separately from your podlets.
-   [Scheduling overview](/concepts/scheduling/overview): future calls, which need a running server.
-   [CLI reference: `status` command](/cloud/reference/cli/commands/status): the `status live` command and its options.
-   [Serverpod Cloud plans](https://serverpod.dev/cloud): what each plan includes and costs.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/scale-to-zero.md)

[

Previous

Storage

](/cloud/concepts/storage)[

Next

App publishing

](/cloud/concepts/app-publishing)

-   [Which projects scale to zero](#which-projects-scale-to-zero)
-   [When to use scale to zero](#when-to-use-scale-to-zero)
-   [How scale to zero works](#how-scale-to-zero-works)
-   [Handle the first request to an idling project](#handle-the-first-request-to-an-idling-project)
-   [Check whether your project is idling](#check-whether-your-project-is-idling)
-   [Configure scale to zero](#configure-scale-to-zero)
    -   [Turn on scale to zero](#turn-on-scale-to-zero)
    -   [Turn off scale to zero](#turn-off-scale-to-zero)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 7.5s)

_Thinking:_

Now let me check the scloud.yaml schema, app publishing, database, CDN, and whether Serverpod 3.x is supported. Also need to check the server's web serving behavior in Cloud. Also need to check `config/generator.yaml`, passwords file presence, and the client package config, models (for DB types like String in array etc.).

Let me fetch:
- scloud.yaml schema
- app-publishing
- database
- cdn
- launch (already have excerpt)
- maybe cloud reference project create (plan options).

Also check Serverpod 3.4.7 compat: search docs for "Serverpod 3" cloud. There may be a guide "migrate to 4.0". The CLI prerequisite is 4.0+, but the deployed server can be 3.x? The Cloud CLI is versioned separately. Actually `serverpod cloud` comes from serverpod 4.0 CLI; you can install scloud standalone. Serverpod 3 project support? Let me search.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/reference/scloud-yaml-schema"
}
```

**Output:**
```
  scloud.yaml schema | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
    -   [Dart SDK versions](/cloud/reference/dart-sdk-versions)
    -   [Private dependencies](/cloud/reference/private-dependencies)
    -   [Project identifier rules](/cloud/reference/project-id-rules)
    -   [scloud.yaml schema](/cloud/reference/scloud-yaml-schema)
    -   [CLI](/cloud/reference/cli/introduction)
        
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# scloud.yaml schema

A Serverpod project deployed to Serverpod Cloud has a `scloud.yaml` file at its root. The file links the local project to a Cloud project, optionally pins the Dart SDK used for builds, configures how your Flutter app is published, and lists commands to run before or after each deploy.

Two commands write the file: `serverpod cloud launch` creates it on first setup, and `serverpod cloud project link` creates or updates it when you link your codebase to a Cloud project. You can also hand-edit it at any time, and the Cloud CLI preserves your `dartSdk`, app settings, and hook scripts across later commands. See [How the Cloud CLI updates the file](#how-the-cloud-cli-updates-the-file) for the exact per-field rules.

## File location[​](#file-location "Direct link to File location")

The file lives in your server package directory, alongside the server's `pubspec.yaml`. In a workspace project, that's the `*_server` package directory; in a single-package project, it's the project root.

To find the file for any subsequent command, the CLI searches the starting directory (the current directory, or the value of `--project-dir`) and up to two levels below it. If no `scloud.yaml` is found and the starting directory contains a `pubspec.yaml`, it walks one level up and searches with depth 1. This covers single-package projects where you run commands from a `client/` or `flutter/` subdirectory. Multiple matches throw an ambiguous-search error. With no match, commands that need a project require `-p <project-id>` instead.

When the CLI writes the file, it prepends this comment header so the file is recognizable when you open it:

```
# This file configures your Serverpod Cloud project.# It is automatically generated and updated by the `scloud` command.# # Useful commands:# - Deploy: `scloud deploy`# - Get Help: `scloud help`## For full documentation, visit: https://docs.serverpod.dev/cloud
```

The CLI keeps the header when it rewrites the file.

## Schema[​](#schema "Direct link to Schema")

One top-level key, `project`, with four fields.

### projectId[​](#projectid "Direct link to projectId")

**Type:** string. **Required.**

The unique Cloud project identifier the CLI operates on. You set it when you create the project with `serverpod cloud launch` or `serverpod cloud project create`. See [Project identifier rules](/cloud/reference/project-id-rules) for the naming constraints.

scloud.yaml

```
project:  projectId: "my-app"
```

### dartSdk[​](#dartsdk "Direct link to dartSdk")

**Type:** string. **Optional.**

Pins the Dart SDK version used for builds. When unset, the CLI falls back to your `.tool-versions` file and then the `environment.sdk` constraint in your `pubspec.yaml`. See [Dart SDK versions](/cloud/reference/dart-sdk-versions) for the supported versions and the full selection order.

scloud.yaml

```
project:  dartSdk: "^3.10.3"
```

### app[​](#app "Direct link to app")

**Type:** map. **Optional.**

Holds the settings that the `serverpod cloud app` commands use to build and publish your Flutter app. See [App publishing](/cloud/concepts/app-publishing) for how publishing works.

scloud.yaml

```
project:  projectId: "my-app"  app:    dir: "../my_app_flutter"    flutterSdk: "3.50.0"    identifiers:      ios: "com.yourcompany.yourapp"      android: "com.yourcompany.yourapp"    dartDefineFromFile: ".env"
```

#### dir[​](#dir "Direct link to dir")

**Type:** string. **Optional.**

The path of your Flutter app directory, relative to `scloud.yaml`. When unset, the CLI uses the current directory if it holds a Flutter app, or else the Flutter app in your server's workspace or next to your server directory. The `--app-dir` option replaces this setting. If the directory doesn't exist, the command stops with an error.

scloud.yaml

```
project:  app:    dir: "../my_app_flutter"
```

#### flutterSdk[​](#fluttersdk "Direct link to flutterSdk")

**Type:** string. **Optional.**

The Flutter release version to build your app with, such as `3.50.0`. The `--flutter-version` option and a single version in `environment.flutter` of your app's `pubspec.yaml` take priority over this setting. See [Flutter version](/cloud/concepts/app-publishing#flutter-version) for the full selection order.

scloud.yaml

```
project:  app:    flutterSdk: "3.50.0"
```

#### identifiers[​](#identifiers "Direct link to identifiers")

**Type:** map with the optional string keys `ios` and `android`. **Optional.**

The bundle ID (`ios`) and package name (`android`) to publish your app with, in place of the ones in your app's files. A platform without a value uses the identifier in your app's files. A value can't be empty or Flutter's `com.example` placeholder. See [App identifiers](/cloud/concepts/app-publishing#app-identifiers).

scloud.yaml

```
project:  app:    identifiers:      ios: "com.yourcompany.yourapp"      android: "com.yourcompany.yourapp"
```

#### dartDefineFromFile[​](#dartdefinefromfile "Direct link to dartDefineFromFile")

**Type:** string or list of strings. **Optional.**

The files with the dart defines to build your app with, in JSON or `.env` format. Each path is relative to `scloud.yaml`. The CLI reads a list in order, and a later file replaces the values of an earlier one. The `--dart-define-from-file` option replaces this setting. See [Dart defines](/cloud/concepts/app-publishing#dart-defines).

scloud.yaml

```
project:  app:    dartDefineFromFile:      - ".env"      - ".env.production"
```

### scripts[​](#scripts "Direct link to scripts")

**Type:** map. **Optional.**

Holds two hook lists, `pre_deploy` and `post_deploy`. Each runs commands around `serverpod cloud deploy`. See [Deployment hooks](/cloud/concepts/deployment-hooks) for when each fires and how failures behave.

#### pre\_deploy[​](#pre_deploy "Direct link to pre_deploy")

**Type:** string or list of strings. **Optional.** **Default:** `serverpod cloud launch` may suggest hooks (typically `serverpod generate`).

Commands that run before the CLI uploads your project package. A single string runs one command. A list runs each command in order. Each command runs through the system shell (`bash -c` on macOS and Linux, `cmd /c` on Windows) in your project directory. A non-zero exit code halts further commands and aborts the deploy.

Single command:

scloud.yaml

```
project:  scripts:    pre_deploy: "serverpod generate"
```

Multiple commands:

scloud.yaml

```
project:  scripts:    pre_deploy:      - "serverpod generate"      - "flutter build web"
```

#### post\_deploy[​](#post_deploy "Direct link to post_deploy")

**Type:** string or list of strings. **Optional.** **Default:** `[]` (empty list).

Commands that run after the CLI finishes uploading, before Cloud finishes building and rolling out the new version. Same shape and shell semantics as `pre_deploy`. A failure here makes `serverpod cloud deploy` exit with an error, but Cloud keeps deploying. Check the result with `serverpod cloud status deployment show`.

Empty (the default on a freshly created project):

scloud.yaml

```
project:  scripts:    post_deploy: []
```

Single command:

scloud.yaml

```
project:  scripts:    post_deploy: "curl -X POST https://example.com/notify"
```

## Complete example[​](#complete-example "Direct link to Complete example")

A minimal valid file:

scloud.yaml

```
project:  projectId: "my-app"
```

What `serverpod cloud launch` typically writes for a new project (a suggested `pre_deploy` hook, empty `post_deploy`):

scloud.yaml

```
project:  projectId: "my-app"  dartSdk: "^3.10.3"  scripts:    pre_deploy:      - "serverpod generate"    post_deploy: []
```

## How the Cloud CLI updates the file[​](#how-the-cloud-cli-updates-the-file "Direct link to How the Cloud CLI updates the file")

Both `serverpod cloud launch` and `serverpod cloud project link` rewrite `scloud.yaml` to reflect the current project. They apply these rules to each field:

-   **`projectId`** is set to the project the command targets. Treat it as managed by the CLI. Hand-edits won't survive the next run.
-   **`dartSdk`** is preserved as you wrote it, unless the command sets a new value.
-   **`app`** is preserved entirely.
-   **`scripts.pre_deploy`** is merged. Your custom hooks are kept. Hooks that the CLI considers "suggested" (for example `serverpod generate` for projects that need it) are re-added on every run, even if you removed them.
-   **`scripts.post_deploy`** is preserved entirely.

In practice, hand-edit `dartSdk`, `app`, and `post_deploy` freely, and add your own `pre_deploy` hooks alongside any suggested ones. Editing `projectId` by hand has no lasting effect. To change which project the file points at, use `serverpod cloud project link`.

## Validation errors[​](#validation-errors "Direct link to Validation errors")

The CLI parses `scloud.yaml` on every command that needs project context. Validation failures raise `SchemaValidationException` in one of three forms.

### Missing required field[​](#missing-required-field "Direct link to Missing required field")

```
Missing required key: "project.projectId"
```

The required `projectId` field is absent. Add it, or run `serverpod cloud project link <project-id>` to set it for you.

### Wrong type for a field[​](#wrong-type-for-a-field "Direct link to Wrong type for a field")

```
At path "project.projectId": Expected String, got int
```

A field's value is the wrong type. The path tells you which field; the expected and actual types tell you what to change.

### Wrong format for a string-or-list field[​](#wrong-format-for-a-string-or-list-field "Direct link to Wrong format for a string-or-list field")

```
At path "project.scripts.pre_deploy": Expected one of String, [String]
```

The `pre_deploy`, `post_deploy`, or `app.dartDefineFromFile` value is neither a string nor a list of strings. Change it to either form (see [`pre_deploy`](#pre_deploy) and [`dartDefineFromFile`](#dartdefinefromfile) for examples).

## Related[​](#related "Direct link to Related")

-   [Project identifier rules](/cloud/reference/project-id-rules)
-   [Dart SDK versions](/cloud/reference/dart-sdk-versions)
-   [App publishing](/cloud/concepts/app-publishing)
-   [Deployment hooks](/cloud/concepts/deployment-hooks)
-   [CLI reference: `project` command](/cloud/reference/cli/commands/project)

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/reference/scloud-yaml-schema.md)

[

Previous

Project identifier rules

](/cloud/reference/project-id-rules)[

Next

Introduction

](/cloud/reference/cli/introduction)

-   [File location](#file-location)
-   [Schema](#schema)
    -   [projectId](#projectid)
    -   [dartSdk](#dartsdk)
    -   [app](#app)
    -   [scripts](#scripts)
-   [Complete example](#complete-example)
-   [How the Cloud CLI updates the file](#how-the-cloud-cli-updates-the-file)
-   [Validation errors](#validation-errors)
    -   [Missing required field](#missing-required-field)
    -   [Wrong type for a field](#wrong-type-for-a-field)
    -   [Wrong format for a string-or-list field](#wrong-format-for-a-string-or-list-field)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/app-publishing"
}
```

**Output:**
```
  App publishing | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# App publishing

Getting a Flutter app to testers means signing builds, matching store settings, and uploading to TestFlight and Google Play. With app publishing, you run one command: Serverpod Cloud builds your Flutter app for iOS and Android, signs it, and uploads it to the stores you connected in the console.

You publish from the Cloud CLI. The `app setup` command prepares your Flutter app for the stores, and the `app doctor` command checks your app's setup before you publish and tells you how to fix each problem it finds.

## What app publishing does[​](#what-app-publishing-does "Direct link to What app publishing does")

App publishing supports two platforms:

Platform

Store

Where each build lands

iOS

App Store

TestFlight, ready for your testers

Android

Google Play

A draft release on the internal testing track

When you publish, the CLI uploads your Flutter app's source code. Serverpod Cloud builds it in release mode on its own build machines, with the Flutter version you choose. It then signs each build and uploads it to the store. You don't need Xcode, Android Studio, or a Mac to publish.

Releasing a build from TestFlight or the internal testing track to the public store stays in App Store Connect and Play Console.

## Connect the stores[​](#connect-the-stores "Direct link to Connect the stores")

Before you can publish for a platform, connect its store in the [Serverpod Cloud console](https://console.serverpod.dev). Open your project, then open the **App Stores** tab. Each store has a setup guide that walks you through the steps:

-   **App Store:** Join the Apple Developer Program, register your app's bundle ID, create the app in App Store Connect, and add an App Store Connect API key. Only the project owner can add the key.
-   **Google Play:** Sign up for Play Console, create the app with your app's package name, choose an upload key, and invite Serverpod Cloud's service account to your app in Play Console. Serverpod Cloud can create the upload key for you, or you can upload the keystore you already sign the app with.

The `app doctor` command shows whether each connection is complete, and links to the setup guide when it isn't.

## Set up your app[​](#set-up-your-app "Direct link to Set up your app")

Run `app setup` from your project's directory to prepare your Flutter app for the stores:

```
serverpod cloud app setup
```

For each platform, the command checks the [app identifier](#app-identifiers). If your app still uses Flutter's `com.example` placeholder, it asks for a new identifier and writes it into your app's files. It then saves the identifier to your Serverpod Cloud project. For Android, it also checks the [release signing](#android-release-signing).

To set the identifiers without a prompt, such as in CI, pass them as options:

```
serverpod cloud app setup --non-interactive --android-package-name com.yourcompany.yourapp --ios-bundle-id com.yourcompany.yourapp
```

Pass `--platforms ios` or `--platforms android` to set up one platform, and `--app-dir` to set up an app somewhere else.

## Check your app with app doctor[​](#check-your-app-with-app-doctor "Direct link to Check your app with app doctor")

Run `app doctor` from your project's directory before you publish:

```
serverpod cloud app doctor
```

It checks the Flutter version, each store connection, and the setup of your Flutter app:

```
! Flutter version: Not pinned, so builds use the latest stable release.  Request a version with --flutter-version, or pin one in environment.flutter of the app's pubspec.yaml.Android  ✓ Google Play Console connection  ✓ Package name: com.acme.app  ✗ Release signing: Release builds do not use the keystore from Serverpod Cloud.    Learn more: https://docs.serverpod.dev/cloud/concepts/app-publishing#android-release-signing  ! App icon: The app uses the default Flutter icon.    Learn more: https://docs.serverpod.dev/cloud/concepts/app-publishing#app-iconiOS  ✓ App Store connection  ✓ Bundle ID: com.acme.app  ✓ Export compliance  ✓ App icon1 check failed. Fix it before you publish the app.
```

A check marked `✗` makes the build or the upload fail, so fix it before you publish. A check marked `!` is a warning: the app can be published, but the result may not be what you want.

The command finds your Flutter app from `project.app.dir` in `scloud.yaml`, the current directory, or your server's workspace. Pass `--app-dir` to check an app somewhere else, and `--platforms ios` or `--platforms android` to check one platform.

## Publish your app[​](#publish-your-app "Direct link to Publish your app")

Publish your app from your project's directory:

```
serverpod cloud app publish
```

The command builds every platform your app has code for and whose store is connected. It skips a platform whose store isn't connected and prints a link to its setup guide. It shows the progress of each build and ends when the builds are uploaded to the stores. To publish one platform, pass `--platforms`:

```
serverpod cloud app publish --platforms ios
```

To start the builds and return right away, pass `--no-await`. The command then prints the `app show` command that follows the builds.

If your Flutter app is part of a Dart workspace, the upload includes the workspace packages it depends on. To leave files out of the upload, list them in a [`.scloudignore` file](/cloud/concepts/deployments#configure-whats-included).

### Dart defines[​](#dart-defines "Direct link to Dart defines")

To build your app with compile-time values, pass them as with `flutter build`. Use `--dart-define` for one value, and `--dart-define-from-file` for a file in JSON or `.env` format:

```
serverpod cloud app publish --dart-define-from-file .env --dart-define FLAVOR=production
```

You can repeat both options. A later file replaces the values of an earlier one, and a `--dart-define` value replaces the value of the same key from a file.

To build every publish with the same files, set `dartDefineFromFile` in `scloud.yaml` to a path or a list of paths, relative to `scloud.yaml`. The `--dart-define-from-file` option replaces this setting:

scloud.yaml

```
project:  projectId: my-project  app:    dartDefineFromFile: .env
```

Serverpod Cloud always sets `SERVER_URL` to the URL of your project's server, so `getServerUrl` from `serverpod_flutter` connects the app to it. A `SERVER_URL` value you pass is ignored.

## Follow your builds[​](#follow-your-builds "Direct link to Follow your builds")

Each publish creates an app upload with one build per platform. The upload ID that `app publish` and `app list` print identifies it. Use these commands to follow the builds:

Command

What it shows

`serverpod cloud app list`

Recent publishes, newest first

`serverpod cloud app status`

The latest build of each platform with a connected store

`serverpod cloud app show <upload-id>`

The builds of one upload, followed until they end

`serverpod cloud app log <upload-id>`

The build log of one platform, followed until the build ends

`serverpod cloud app artifacts <upload-id>`

Download links for the built files, valid for ten minutes

`serverpod cloud app cancel <upload-id>`

Cancels the builds of an upload that are still running

When a build fails, `app show` and `app status` print the `app log` command that shows why.

## Setup requirements[​](#setup-requirements "Direct link to Setup requirements")

These are the parts of your Flutter app that `app doctor` checks. Each one has a section below.

### Flutter version[​](#flutter-version "Direct link to Flutter version")

Serverpod Cloud builds your app with the first Flutter version it finds, in this order:

1.  The `--flutter-version` option of `app publish`, such as `--flutter-version 3.50.0`.
2.  A single version in `environment.flutter` of your app's `pubspec.yaml`.
3.  `project.app.flutterSdk` in `scloud.yaml`.
4.  The version of the Flutter SDK on your computer.
5.  The latest stable release.

If none of the first three sets a version, the build uses the Flutter SDK on the computer you publish from. To build every publish with the same version, set it in your app's `pubspec.yaml`:

pubspec.yaml

```
environment:  sdk: ^3.8.0  flutter: 3.50.0
```

The version must be a Flutter release version, and it can't be lower than the Flutter version your app's `pubspec.lock` requires. When `app doctor` warns that the version isn't pinned, the builds use the latest stable release, which can change between two publishes.

### App identifiers[​](#app-identifiers "Direct link to App identifiers")

The stores identify your app by its bundle ID on iOS and its package name on Android. Serverpod Cloud reads them from your Flutter app: the bundle ID from the Xcode project in `ios/`, and the package name from `applicationId` in `android/app/build.gradle.kts` or `build.gradle`.

A new Flutter app uses a `com.example` placeholder, which the stores don't accept. Replace it with your own identifier, such as `com.yourcompany.yourapp`, in both places. The [`app setup`](#set-up-your-app) command does this for you. The identifier must match the app you created in App Store Connect and Play Console.

To publish with a different identifier than the one in your app's files, set it in `scloud.yaml`:

scloud.yaml

```
project:  projectId: my-project  app:    identifiers:      ios: com.yourcompany.yourapp      android: com.yourcompany.yourapp
```

### Android release signing[​](#android-release-signing "Direct link to Android release signing")

Google Play only accepts builds signed with your app's upload key. Serverpod Cloud stores that key and passes it to each Android build through these environment variables:

Variable

Value

`ANDROID_KEYSTORE_PATH`

The path of the upload keystore file

`ANDROID_KEYSTORE_PASSWORD`

The password of the keystore

`ANDROID_KEY_ALIAS`

The alias of the upload key

`ANDROID_KEY_PASSWORD`

The password of the upload key

Your app's Gradle build file must read these variables and sign release builds with them. A new Flutter app signs release builds with the debug key instead, which Google Play rejects.

Add a `release` signing config to `android/app/build.gradle.kts` that reads the variables, and use it for release builds:

android/app/build.gradle.kts

```
android {    // ...    val isServerpodCloudBuild = System.getenv("SERVERPOD_APP_BUILD") != null    signingConfigs {        if (isServerpodCloudBuild) {            create("release") {                storeFile = file(System.getenv("ANDROID_KEYSTORE_PATH"))                storePassword = System.getenv("ANDROID_KEYSTORE_PASSWORD")                keyAlias = System.getenv("ANDROID_KEY_ALIAS")                keyPassword = System.getenv("ANDROID_KEY_PASSWORD")            }        }    }    buildTypes {        release {            signingConfig = if (isServerpodCloudBuild) {                signingConfigs.getByName("release")            } else {                signingConfigs.getByName("debug")            }        }    }}
```

Serverpod Cloud sets `SERVERPOD_APP_BUILD` on its builds, so release builds on your computer keep using the debug key. Apps created with `serverpod create` in Serverpod 4.1.2 or later already include this setup.

The `app doctor` command checks that your release build type doesn't sign with the debug key alone, and that your Gradle build file names all four variables. You can read them in any way Gradle supports, such as `providers.environmentVariable("ANDROID_KEY_ALIAS")` or, in a Groovy `build.gradle`, `System.getenv('ANDROID_KEY_ALIAS')`.

### iOS export compliance[​](#ios-export-compliance "Direct link to iOS export compliance")

App Store Connect asks whether each build uses encryption, because apps that use some kinds of encryption need export compliance documentation. Until a build answers it, App Store Connect holds the build and your testers can't install it.

Answer it once in your app's `ios/Runner/Info.plist`, inside the top-level `<dict>`. If your app uses no encryption, or only encryption that is exempt, such as HTTPS calls to your server, set `ITSAppUsesNonExemptEncryption` to `false`:

ios/Runner/Info.plist

```
<key>ITSAppUsesNonExemptEncryption</key><false/>
```

If your app uses encryption that isn't exempt, set it to `<true/>` and provide the documentation in App Store Connect. Apple's [ITSAppUsesNonExemptEncryption reference](https://developer.apple.com/documentation/bundleresources/information-property-list/itsappusesnonexemptencryption) explains which encryption is exempt.

### App icon[​](#app-icon "Direct link to App icon")

A new Flutter app has the Flutter logo as its icon. Testers see this icon on their home screen, and the stores show it on your app's listing. The `app doctor` command warns while your app still has it.

Replace the icon files on each platform:

-   **Android:** The `ic_launcher.png` files in the `mipmap-*` folders of `android/app/src/main/res`.
-   **iOS:** The images in `ios/Runner/Assets.xcassets/AppIcon.appiconset`.

Each platform needs the icon in several sizes. A package such as [flutter\_launcher\_icons](https://pub.dev/packages/flutter_launcher_icons) creates every size for both platforms from one image.

## Limits[​](#limits "Direct link to Limits")

-   **Platforms:** App publishing builds for iOS and Android only.
-   **Monthly builds:** Your plan sets how many times you can publish each project per month. A publish counts once one of its builds succeeds, however many platforms it builds for, so a publish where every build fails doesn't count. The count resets on the first of each month, in UTC.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments): how to deploy the server your app talks to.
-   [scloud.yaml schema](/cloud/reference/scloud-yaml-schema): the project configuration file the `app` commands read.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/app-publishing.md)

[

Previous

Scale to zero

](/cloud/concepts/scale-to-zero)[

Next

Use Redis for PubSub and caching

](/cloud/guides/redis)

-   [What app publishing does](#what-app-publishing-does)
-   [Connect the stores](#connect-the-stores)
-   [Set up your app](#set-up-your-app)
-   [Check your app with app doctor](#check-your-app-with-app-doctor)
-   [Publish your app](#publish-your-app)
    -   [Dart defines](#dart-defines)
-   [Follow your builds](#follow-your-builds)
-   [Setup requirements](#setup-requirements)
    -   [Flutter version](#flutter-version)
    -   [App identifiers](#app-identifiers)
    -   [Android release signing](#android-release-signing)
    -   [iOS export compliance](#ios-export-compliance)
    -   [App icon](#app-icon)
-   [Limits](#limits)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/database"
}
```

**Output:**
```
  Database | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Database

Most Serverpod apps need to persist data (user accounts, orders, session state). Serverpod Cloud can provision and run a managed PostgreSQL database alongside your project, so you don't have to set up or maintain Postgres yourself. When the database is enabled, Cloud handles provisioning, connection details for your server, migrations on every deploy, and backups. Direct access from tools like `psql` or a GUI client is opt-in and requires a database user that you create yourself.

The managed database runs on PostgreSQL 17 with TLS required, connection pooling on by default, and autoscaling compute.

## Enable the database[​](#enable-the-database "Direct link to Enable the database")

The database is opt-in. You choose whether to enable it when you create the project, in one of two ways:

-   **With `serverpod cloud launch`.** It checks your server config for a `database` section and presets the database switch on the Console's **New project** page. You can change it there before you create the project.
-   **With `serverpod cloud project create`.** Pass `--enable-db`, or `--no-enable-db` if your project doesn't use a database. The flag is **required**: it has no default, so you must pass one.

Once a project is created with the database enabled, the database is provisioned automatically and made available to your server on the next deploy.

## How your server connects[​](#how-your-server-connects "Direct link to How your server connects")

When the database is enabled, your deployed Serverpod server receives its connection details as environment variables, injected by Cloud:

Variable

What it holds

`SERVERPOD_DATABASE_HOST`

The database host

`SERVERPOD_DATABASE_PORT`

The port (5432 by default)

`SERVERPOD_DATABASE_NAME`

The database name

`SERVERPOD_DATABASE_USER`

The server's database user

`SERVERPOD_DATABASE_REQUIRE_SSL`

Always `true`; TLS is required

`SERVERPOD_PASSWORD_database`

The server's database password

Your server reads these through Serverpod's standard configuration. You don't write them into `config/production.yaml` or `passwords.yaml`; Cloud supplies them at runtime. The server's password is managed by the platform and never exposed to you.

## Migrations run on every deploy[​](#migrations-run-on-every-deploy "Direct link to Migrations run on every deploy")

Cloud applies pending migrations from your project's `migrations/` directory when it deploys your server.

If a migration fails to apply, the server logs `Failed to apply database migrations.` Check the server logs with `serverpod cloud log`, then fix the migration in your project and redeploy. For a step-by-step walkthrough, see [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy).

To undo a migration that already applied, create a forward migration that reverses it. Revert the model change, run `serverpod create-migration`, and redeploy. If the command stops because data would be lost, add `--force`. The forward migration changes the schema only. It does not restore data.

## Backups[​](#backups "Direct link to Backups")

Cloud can back up the managed database on demand or on a schedule, and restore it to any snapshot in one step. See [Database backups](/cloud/concepts/database-backups) for how to set up scheduled backups, take manual snapshots, and restore.

## Access the database directly[​](#access-the-database-directly "Direct link to Access the database directly")

You can connect to the managed database from your machine, a GUI client, or `psql` for inspection and debugging. This is independent of how your server connects.

The steps:

1.  Run `serverpod cloud db connection` to print the host, port, and database name.
2.  Run `serverpod cloud db user create <username>` to create a database user. It can read and write data, but it can't create or change tables. The password is shown **once**, so save it.
3.  Connect from your client with the host, port, database, your username, and the saved password.

Both commands need to know which project you're working with. From a project directory that's been linked (any project created with `serverpod cloud launch` is linked automatically), the project ID is picked up from `scloud.yaml`. From anywhere else, pass `-p your-project-id`.

If you lose the password, run `serverpod cloud db user reset-password <username>` to reset it. The new password is also shown only once.

Any PostgreSQL-compatible client works. A few popular options:

-   [Postico](https://eggerapps.at/postico/), a focused PostgreSQL client for macOS
-   [pgAdmin](https://www.pgadmin.org/), the official open-source admin tool
-   [DBeaver](https://dbeaver.io/), cross-platform and free for personal use
-   [DataGrip](https://www.jetbrains.com/datagrip/), JetBrains' database IDE
-   `psql`, the standard PostgreSQL command-line client
-   A PostgreSQL VS Code extension if you prefer to stay in your editor

warning

Session settings can carry over between direct connections, because they go through a connection pool. A `SET` from one connection, such as a change to `search_path`, can still apply the next time you connect as the same user. Use `SET LOCAL` inside a transaction, so the setting ends with the transaction.

## Reset the database[​](#reset-the-database "Direct link to Reset the database")

The `serverpod cloud db wipe` command deletes all tables, all data, and all applied migrations from the managed database. It asks for confirmation by default.

```
serverpod cloud db wipe
```

After a wipe, your server will error on its next request because the schema is gone. Redeploy with `serverpod cloud deploy` to reapply migrations and bring the database back into a working state.

Use this when you want to start clean during development. **Do not wipe a production database.**

## Security[​](#security "Direct link to Security")

The managed database is built so you don't have to think about credentials in your code or your repo:

-   **TLS is required for all connections.** Cloud sets `SERVERPOD_DATABASE_REQUIRE_SSL` to `true` for your server, and the same applies to direct connections from `psql` or a GUI client.
-   **The server's password is managed by the platform.** It's never written into your repo and never shown to you. Your server reads it from the injected environment at runtime.
-   **Direct access uses separate database users that you create.** The server connects as its own user, not as one you create with `serverpod cloud db user create`. Revoking or rotating a direct-access password doesn't affect the server.

## Performance[​](#performance "Direct link to Performance")

The managed database includes infrastructure features you'd otherwise wire up yourself:

-   **Connection pooling is on by default.** The connection details returned by `serverpod cloud db connection` point at a pooled endpoint, so short-lived connections from many clients don't exhaust Postgres connection slots.
-   **Compute autoscales.** The database scales compute up and down within bounds set by your plan, so you don't need to provision for peak traffic up front.

## Related[​](#related "Direct link to Related")

-   [CLI reference: `db` command](/cloud/reference/cli/commands/db) for all `db` subcommands and options.
-   [Deployments](/cloud/concepts/deployments) for the deploy lifecycle.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/database.md)

[

Previous

Custom domains

](/cloud/concepts/custom-domains)[

Next

Database backups

](/cloud/concepts/database-backups)

-   [Enable the database](#enable-the-database)
-   [How your server connects](#how-your-server-connects)
-   [Migrations run on every deploy](#migrations-run-on-every-deploy)
-   [Backups](#backups)
-   [Access the database directly](#access-the-database-directly)
-   [Reset the database](#reset-the-database)
-   [Security](#security)
-   [Performance](#performance)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/cdn"
}
```

**Output:**
```
  Content delivery and caching | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Content delivery and caching

Serverpod Cloud runs a CDN, a content delivery network, in front of every app's web server. Whatever your app marks as cacheable is served from an edge server near each visitor, whether it is a Flutter web build, a Jaspr site, or plain static files. Visitors get fast loads wherever they are, and your server does less work. Caching stays off until your app opts in, and every successful deploy clears the CDN's copies so a new build reaches visitors right away.

## How caching works[​](#how-caching-works "Direct link to How caching works")

Your app's `Cache-Control` header decides, per response, where a file may be cached and for how long. There are three layers:

-   **The visitor's browser:** Keeps its own copy of a file for up to the `max-age` you set. No deploy can clear it, so keep this lifetime short.
-   **The CDN at the edge:** Stores cacheable files for up to `s-maxage`, or `max-age` when `s-maxage` is not set. Every successful deploy clears it, and it refills on its own: the first request for a file at each edge location fetches it from your server and stores it back. There is no manual purge command. To clear the edge on demand, deploy again.
-   **Your server:** Serves everything else: responses marked `no-cache`, `private`, or `no-store`, responses with no cache header, responses that set a cookie, and all calls from your Flutter app to your endpoints. Every request for these reaches your server. For `no-cache`, the CDN may keep a copy, but it checks with your server before serving it.

What the common header patterns do at each layer:

`Cache-Control`

CDN at the edge

Visitor's browser

`no-cache, private` (`FlutterRoute` default)

Never stores it

Stores it, but checks with your server on every load

None (`StaticRoute` and `SpaRoute` default)

Never stores it

Decides on its own, using browser heuristics

`public, max-age=60, s-maxage=86400` (recommended)

Serves it for up to a day, cleared on every deploy

Uses it for up to a minute

`no-cache, public, s-maxage=86400`

Stores it, but checks with your server on every request

Stores it, but checks with your server on every load

Those checks are cheap: for an unchanged file, your server answers with a small 304 Not Modified response instead of the file itself. The last pattern keeps content fresh on every request and saves bandwidth, but your server still handles every request, so it does not reduce load the way `max-age` does. Whichever route you use, the CDN stores nothing under the defaults, so opting in works the same way for every stack.

## Enable caching for your app[​](#enable-caching-for-your-app "Direct link to Enable caching for your app")

To make content cacheable, set a `cacheControlFactory` on the route that serves it: the `FlutterRoute` for a Flutter web app, the `SpaRoute` for another framework's single-page app, or a `StaticRoute.directory` for plain files. The factory returns the `Cache-Control` header for each file the route serves. Routes you write yourself work the same way: the CDN only reads the header on a response, however your code produces it. The recommended header is `public, max-age=60, s-maxage=86400`, shown here on a `FlutterRoute`:

```
pod.webServer.addRoute(  FlutterRoute(    Directory('web/app'),    cacheControlFactory: (_, _) => CacheControlHeader(      publicCache: true,      maxAge: 60,      sMaxAge: 86400,    ),  ),);
```

Each directive plays a part:

-   The `public` directive lets both the browser and the CDN store the file.
-   The `max-age=60` directive sets the browser lifetime to one minute, short enough that a visitor picks up a new deploy almost immediately.
-   The `s-maxage=86400` directive sets the CDN lifetime to one day. The deploy purge keeps the edge fresh, so this longer lifetime is mainly a safety net. If a purge ever fails, your deploy still succeeds, and the cached copies expire on their own within a day.

There is one exception. The `FlutterRoute` always serves the `index.html` fallback with `no-cache, private`, whatever factory you set, so visitors pick up a new build's entry page right away.

For a simpler setup, the `StaticRoute.public` and `StaticRoute.publicImmutable` factories return common header shapes without a custom closure. Any of the three routes accepts them, including the `FlutterRoute` above. They do not set a separate CDN lifetime, so the browser and the CDN share one `max-age`:

```
cacheControlFactory: StaticRoute.public(maxAge: const Duration(minutes: 1)),
```

warning

Flutter's build uses fixed file names with no content hashes, so a long browser `max-age` can leave a visitor on an old build after you deploy. Keep the browser lifetime short and let the deploy purge handle the edge.

Caching more aggressively takes cache busting, where each asset URL includes a hash of the file's content, so a new build gets new URLs and old cached copies are never requested again. The web server supports this for static files, and hashed assets can use `publicImmutable` with a long lifetime, because a file at a hashed URL never changes. Flutter's build does not produce hashed names, so for a Flutter build that means post-processing the build output yourself, and the short browser lifetime above is the simpler choice. See the framework [Static files](/concepts/web-server/static-files) guide for the full `cacheControlFactory` and cache-busting reference.

## Verify caching is working[​](#verify-caching-is-working "Direct link to Verify caching is working")

To confirm the CDN is serving a file, request it a few times and read the `age` response header. It reports how many seconds the edge has held its copy of the file:

```
curl -s -o /dev/null -D - https://my-app.serverpod.space/main.dart.js
```

The `-o /dev/null` discards the body and `-D -` prints the response headers. A cached file answers like this:

```
cache-control: public, max-age=60, s-maxage=86400date: Mon, 20 Jul 2026 08:03:47 GMTage: 26
```

How to read the responses:

-   **No `age` on the first request:** The edge had no copy yet and fetched the file from your server.
-   **An `age` that goes up with each request while `date` stays the same:** The edge is serving its stored copy, and those requests never reach your server.
-   **No `age` at all:** The response does not opt in to caching (either default), or the request was a HEAD request. The CDN does not cache HEAD requests, so use GET, not `curl -I`.
-   **An `age` that resets shortly after a deploy:** The purge cleared the edge, and the new build is being cached.

## Cost and limits[​](#cost-and-limits "Direct link to Cost and limits")

-   **No separate charge:** The CDN is part of Serverpod Cloud. Serving from the edge takes static traffic off your server, leaving it more capacity for your endpoint calls.
-   **Nothing to turn on:** It is active for every project. Your cache headers are the only switch.
-   **Isolated per app:** Cached files are tied to your app's hostnames, so the CDN never serves another app's content to your visitors, even when two apps serve a file at the same path.
-   **No usage limits:** Cached traffic is not capped.
-   **Every hostname covered:** The CDN serves any [custom domains](/cloud/concepts/custom-domains) attached to your project, and the deploy purge clears them too.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments): the deploy that clears the cache.
-   [Custom domains](/cloud/concepts/custom-domains): the CDN covers your custom domains too.
-   [Static files](/concepts/web-server/static-files): the framework reference for `cacheControlFactory` and cache busting.
-   [Single-page apps](/concepts/web-server/single-page-apps): serving another framework's single-page app with `SpaRoute`.
-   [Flutter web apps](/concepts/web-server/flutter-web): serving a Flutter build from the framework web server.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/cdn.md)

[

Previous

Personal access tokens

](/cloud/concepts/personal-access-tokens)[

Next

Deployment hooks

](/cloud/concepts/deployment-hooks)

-   [How caching works](#how-caching-works)
-   [Enable caching for your app](#enable-caching-for-your-app)
-   [Verify caching is working](#verify-caching-is-working)
-   [Cost and limits](#cost-and-limits)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: websearch**

**Input:**
```json
{
  "query": "Serverpod Cloud support Serverpod 3.x project deploy version requirement",
  "numResults": 5
}
```

**Output:**
```
{
  "search_id": "search_1311c95c954841c2c736d423b20d4212",
  "results": [
    {
      "url": "https://docs.serverpod.dev/deployments/deploy-to-serverpod-cloud",
      "title": "Deploy to Serverpod Cloud | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nDeploy to Serverpod Cloud\n\nServerpod Cloud is the recommended way to host a Serverpod server. It is a fully managed platform built and maintained by the Serverpod team, designed specifically for Serverpod apps. You deploy in minutes with zero configuration, and there is no VM setup, container configuration, or infrastructure to orchestrate yourself.\ninfo\nYour first project includes a one-month free trial, with no credit card required.\nCloud manages the production infrastructure for you:\n* An optional production-grade Postgres database, with migrations applied automatically on each deploy.\n* Networking, load balancing, and custom domains with TLS certificates.\n* Server instances (podlets) with predictable pricing. See Cloud plans for what each plan includes.\n* A secure key manager for your app secrets.\n\nDeploy from the terminal ​\n\nYou deploy with the Serverpod CLI:\n1. Run serverpod cloud launch . It installs the Cloud CLI if needed. If you aren't signed in, it opens your browser so you can sign in.\n2. For a new project, the Cloud Console opens so you can create it. The database setting is pre-filled from your server's config.\n3. When prompted, select the custom passwords from config/passwords.yaml to copy to Cloud. The command then deploys your server.\n4. Set any other secrets (API keys, OAuth credentials) with serverpod cloud password set . Then run serverpod cloud deploy so the server picks them up.\nSee the Serverpod Cloud documentation for the full walkthrough, including secrets, custom domains, and logs.\nTo run the server yourself instead, see Custom hosting .\nEdit this page\nPrevious Model reference Next Choosing a strategy"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/getting-started/launch",
      "title": "Deploy your first app | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deploy your first app\n\nGet your Serverpod app live on Cloud in a few minutes.\n\nBefore you start ​\n\nYou need:\n* The Serverpod Cloud CLI set up and authenticated. See Set up the Cloud CLI .\n* A Serverpod project on your machine. See Creating a new project in the Serverpod installation guide.\n\nLaunch your project ​\n\nFrom your project's root directory:\nserverpod cloud launch\nIt creates a Cloud project and ships its first version in these steps:\n1. Choose the project. If your account has no projects, the command asks \"Open the browser and create a new Serverpod Cloud project?\" Press Enter to accept. If you already have projects, it lists them, with a last option to create a new project in the browser.\n2. Create the project in the Console. If you chose to create a new project, the Console's New project page opens. The project ID is pre-filled from your pubspec name (for example, my-app ), and the database is switched on if your server config has a database section. Change either if you need to. Pick a plan (see Cloud plans ), click Launch Project , and return to the terminal. The project ID becomes part of your default URL ( <project-id>.serverpod.space ).\n3. Pre-deploy hooks. The command adds serverpod generate as a pre-deploy hook, plus serverpod run flutter_build if your server's pubspec.yaml defines that script. See Deployment hooks for details.\n4. Custom passwords. If config/passwords.yaml has custom passwords, the command asks which ones to copy to Cloud. Passwords from the production and shared sections are preselected. Set the rest later with serverpod cloud password set .\nThe command then writes a scloud.yaml linking subsequent commands to the project, uploads your code, and deploys.\n\nWatch the deployment ​\n\nThe deployment runs in three stages. The terminal updates each one as it progresses:\nUpload successful. Cloud build successful. Rollout successful. 🚀\nWhen you see the rocket on Rollout , your app is live. The command then prints your project ID and the URLs your project is reachable at:\nYour Serverpod Cloud project ID is: my-app When the server has started, you can access it at: Web:      my-app.serverpod.space/ API:      my-app.api.serverpod.space/ Insights: my-app.insights.serverpod.space/\n\nOpen your app ​\n\nIn your browser, open the Web URL the command printed:\nmy-app.serverpod.space/\nYour Flutter web app loads at the root. If the app wasn't built before the upload, a Flutter web app not built page loads instead. Projects created with the website option show a landing page at the root, with the Flutter web app under /app .\n\nWhat you've done ​\n\nYou've created a Cloud project and shipped its first version. From here:\n* Every change you make ships with serverpod cloud deploy . See Deployments for the full deploy lifecycle.\n* To use your own domain instead of <project>.serverpod.space , see Custom domains .\nEdit this page\nPrevious Set up the Cloud CLI Next Deployments"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/concepts/deployments",
      "title": "Deployments | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deployments\n\nWhen you ship a code change to Serverpod Cloud, serverpod cloud deploy builds and rolls out a new version of your server. Cloud switches traffic automatically to the latest successful deploy, keeping the previous one live if a build fails.\n\nDeploy your app ​\n\ninfo\nIf this is the first time you're deploying this project to Cloud, follow Deploy your first app first. It walks through serverpod cloud launch , which creates the project before the first deploy.\nDeploy your project to Cloud:\nserverpod cloud deploy\nThe CLI packages your project, uploads it, and waits for the new version to go live. Once the deployment is live, your project is reachable at its default URLs:\n* Web: https://<project-id>.serverpod.space/\n* API: https://<project-id>.api.serverpod.space/\n* Insights: https://<project-id>.insights.serverpod.space/\nTo use your own URL instead, see Custom domains .\nOther flags:\n* -v ( --verbose ): detailed output.\n* --dart-version : override the Dart SDK used at build time.\n* --concurrency=<N> : how many files are zipped in parallel during packaging (default 5 ).\nTo regenerate code or run other tasks before each deploy, configure a pre-deploy hook. See Deployment hooks .\n\nCheck deployment status ​\n\nWatch the latest deployment as it runs:\nserverpod cloud status deployment show\nThe command tracks the deployment through its three lifecycle stages and updates each line as it progresses. When complete:\nTracking my-app deployment 4583d0a1-3d0a-400e-a9a5-9880da6abc94 (Press Ctrl+C to exit) Upload successful. Cloud build successful. Rollout successful. 🚀\nThe three stages are Upload (your project package reaches Cloud), Cloud build (Cloud builds the container), and Rollout (Cloud prepares the infrastructure and the new version starts serving requests).\nList recent deployments:\nserverpod cloud status deployment list\nThe list shows deploy IDs alongside status and timestamps:\n# | Project | Deploy Id                            | Status  | Started (local)     | Finished (local)    | Info --+---------+--------------------------------------+---------+---------------------+---------------------+----------------------------------- 0 | my-app  | 4583d0a1-3d0a-400e-a9a5-9880da6abc94 | SUCCESS | 2026-06-03 13:41:21 | 2026-06-03 13:46:08 | 1 | my-app  | 73e66b41-64fc-4920-b6ef-4918cc6ceca1 | FAILURE | 2026-06-02 15:19:37 | 2026-06-02 15:20:34 | User build FAILURE - see build log\nInspect a specific deployment by its ID:\nserverpod cloud status deployment show < deployment-id >\nStream the build log for a deployment that failed during the build stage:\nserverpod cloud build log\n\nValidate before deploying ​\n\nA wet run performs every step except the deployment itself, leaving the running app untouched:\nserverpod cloud deploy --wet-run\nPreview the file tree that will be uploaded, with ignored files marked:\nserverpod cloud deploy --show-files\nCombine the two flags to inspect what will be uploaded without deploying:\nserverpod cloud deploy --wet-run --show-files\nSave the package to a local zip (useful for CI inspection or air-gapped environments):\nserverpod cloud deploy --output deployment.zip --wet-run\n\n...\n\nTroubleshooting ​\n\nBuild failure. Stream the build log and look for lines beginning with ERROR: or FAILED: :\nserverpod cloud build log\nCommon causes are missing dependencies in pubspec.yaml or compile errors in your code.\nPackage resolution failure. Update your pubspec.yaml (run dart pub get locally to verify), then redeploy.\nFor a step-by-step walkthrough, see Recover from a failed deploy .\n\nRelated ​\n\n* Deployment hooks for pre- and post-deploy automation.\n* Private dependencies for private package access during the build.\n* Ship non-Dart files with your server for shipping static assets like configuration and templates.\n* Deploy from CI with GitHub Actions for shipping every push.\nEdit this page\nPrevious Deploy your first app Next Logs"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/deploy",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "scloud deploy\n\nscloud deploy packages your project, uploads it to Serverpod Cloud, and waits for the new version to go live. Run it from the directory containing scloud.yaml (typically your project root or server directory) or pass --project-dir .\nTo validate the build without touching the running app, use scloud deploy --wet-run (optionally with --show-files to preview the upload). To follow an in-flight deploy, run scloud status deployment show .\nFor the full deploy lifecycle, pre-deploy hooks, and how to recover from a failed deploy, see Deployments and Recover from a failed deploy .\n\nUsage ​\n\nDeploy a Serverpod project to the cloud. Usage: scloud deploy [arguments] -h, --help                     Print this usage information. -p, --project (mandatory)      The ID of the project. Can be passed as the first argument. Can be omitted for existing projects that are linked (see the \"project link\" command). -c, --concurrency=<integer>    Number of concurrent files processed when zipping the project. (defaults to \"5\") --wet-run                  Perform every step except the deployment, leaving the hosted application untouched. Local files may still be modified. --show-files               Display the file tree that will be uploaded. --redeploy                 Redeploy the currently running build with the latest variables and secrets. Skips zipping and uploading the project. -o, --output                   Save the deployment zip file to the specified path. Must end with .zip --[no-]await               Await the deployment to finish while showing status progression. (defaults to on) --dart-version             Overrides the Dart SDK version to use for building the project. Run \"scloud help\" to see global options. Examples Deploy your project to the cloud $ scloud deploy Preview the file tree that will be uploaded $ scloud deploy --show-files The output shows files that will be included in the deployment, as well as files that are ignored (marked with \"(ignored)\"). This is useful for verifying that your .gitignore and .scloudignore files are working as expected. You can combine it with --wet-run to preview the file tree without actually deploying: $ scloud deploy --wet-run --show-files Save the deployment zip file locally $ scloud deploy --output deployment.zip --wet-run Save the deployment zip and still upload it (unless --wet-run is set) $ scloud deploy --output deployment.zip Redeploy the currently running build with the latest variables and secrets $ scloud deploy --redeploy See the full documentation at: docs.serverpod.dev/cloud/reference/cli/commands/deploy\nEdit this page\nPrevious db Next domain"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud",
      "title": "Introduction | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Introduction\n\nServerpod Cloud is a managed hosting platform for Serverpod apps with predictable pricing. You deploy your app with the Serverpod Cloud CLI or via CI/CD, and use the web console for account setup, billing, and project dashboards.\nWith the Cloud CLI set up , launch your first project with one command. No Dockerfile, no container config, no infrastructure setup:\nserverpod cloud launch\n\nWhat Serverpod Cloud manages ​\n\n* Runtime and scaling. Your app runs on a production runtime that scales as traffic grows.\n\n...\n\n* Pub/sub and caching. Supported through the Serverpod framework with a third-party Redis service you connect yourself. See Use Redis for PubSub and caching for the typical setup.\n\nWhere to go next ​\n\n* Set up the Cloud CLI to get the CLI ready and authenticate it.\n* Deploy your first app for a guided first deploy.\nEdit this page\nNext Set up the Cloud CLI"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/deployment/deploying-your-application",
      "title": "Deploying your application | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deploying your application\n\nServerpod Cloud makes it easy to deploy your Serverpod applications with a single command. You can also perform dry runs to validate your deployment package without actually deploying it.\n\nGenerating code before deployment ​\n\nBefore deploying your application, you should always generate your code to ensure all your models and endpoints are up to date:\nserverpod generate\n\nStandard deployment ​\n\nTo deploy your application to Serverpod Cloud:\nscloud deploy\nThe CLI will:\n1. Package your application\n2. Upload it to Serverpod Cloud\n3. Start the deployment process"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/get-started/deployment",
      "title": "Deploy your app | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nDeploy your app\n\nYour recipe app runs locally. The last step is to put it online. The recommended path is Serverpod Cloud , which hosts your server and database with zero configuration.\n\nDeploy to Serverpod Cloud ​\n\nFrom your project's root folder, run:\n$ serverpod cloud launch\nThe command walks you through these steps:\n1. If the Serverpod Cloud CLI isn't installed yet, serverpod cloud installs it first.\n2. If you aren't signed in, your browser opens so you can sign in.\n\n...\n\n5. The command deploys your server along with the web build of your app.\nThe first upload includes your Flutter web build and can exceed the default timeout on a slower connection. If the upload times out, retry with a higher limit, for example, serverpod cloud launch --timeout 600s .\nIf you didn't select geminiApiKey , set the key as a secret. Then redeploy so the server picks it up:\n$ serverpod cloud password set geminiApiKey \"your-gemini-api-key\" $ serverpod cloud deploy\nWhenever you make changes later, redeploy with:\n$ serverpod cloud deploy\nSee the Serverpod Cloud documentation for the full walkthrough, including custom domains, logs, and your free trial.\n\nOther deployment options ​\n\nPrefer to host the server yourself? See Custom hosting for running on a server cluster, a serverless platform, or your own machine.\n\nWhat you've built ​\n\nYou've built and deployed a full-stack app with Flutter and Serverpod:\n* A custom endpoint that calls an external API from the server.\n* A type-safe data model shared between the server and the Flutter app.\n* Persistent storage with the database."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/launch",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "scloud launch\n\nscloud launch is the front door for new projects: it links your local server to a Serverpod Cloud project and deploys for the first time. You pick one of your projects, or create a new one in the Console with the project ID and database setting pre-filled from your project. The command then adds pre-deploy hooks, offers to copy custom passwords from config/passwords.yaml , and deploys.\nOnce your project is linked, you typically switch to scloud deploy for subsequent updates. For non-interactive project creation (no prompts), use scloud project create and pass the settings as flags.\nSee Deploy your first app for the full walkthrough.\n\nUsage ​\n\nCommon command to launch and deploy Serverpod Cloud projects. If there already is a Serverpod Cloud project near the current directory it will redeploy the project (upload, build, and rollout in the cloud). Otherwise it will guide you through setting up a new Serverpod Cloud project. Usage: scloud launch [arguments] -h, --help                       Print this usage information. -p, --project                    The ID of the project. --[no-]pre-deploy-scripts    Set up pre-deploy scripts. (defaults to on) --dart-version               Overrides the Dart SDK version to use for building the project. -u, --[no-]utc                   Display timestamps in UTC timezone instead of local. Set SERVERPOD_CLOUD_DISPLAY_UTC=true to make UTC the default for all commands. Deployment options -c, --concurrency=<integer>      Number of concurrent files processed when zipping the project. (defaults to \"5\") --wet-run                    Perform every step except the deployment, leaving the hosted application untouched. Local files and the cloud project setup may still be modified. --show-files                 Display the file tree that will be uploaded. -o, --output                     Save the deployment zip file to the specified path. Must end with .zip --[no-]await                 Await the deployment to finish while showing status progression. (defaults to on) Run \"scloud help\" to see global options. See the full documentation at: docs.serverpod.dev/cloud/reference/cli/commands/launch\nEdit this page\nPrevious help Next log"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/quickstart",
      "title": "quickstart | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.1.0 Copy as Markdown\nOn this page\n\nQuickstart\n\nBuild and deploy a full-stack Flutter and Serverpod app, hosted on the web, in 10–15 minutes. We have tested the default setup with Antigravity, Cursor, and Claude Code, but most agentic editors will work.\n\nPrerequisites ​\n\nServerpod is tested on Mac, Windows, and Linux. Before you can install Serverpod, you need to have Flutter installed. Serverpod 4 requires Flutter 3.44.4 or later, which includes Dart 3.12.2.\ninfo\nCheck your Flutter installation by running the following command in your terminal:\n$ flutter doctor\nNew projects use an embedded PostgreSQL that Serverpod downloads and runs for you, so no database setup is needed.\n\n...\n\nDeploy the app to the cloud ​\n\nDeploy your web app and backend to Serverpod Cloud , a fully managed platform built by the Serverpod team. Your first project includes a one-month free trial, with no credit card required.\nCreate your Cloud account and create a project on the Serverpod Cloud Console . Enable the database when you create the project if your server uses one. Then launch your app:\n$ serverpod cloud launch\nThis links your project to Cloud and deploys your backend along with the web build of your app.\nAfter the first launch, you redeploy any changes by running serverpod cloud launch again.\ntip\nIn the Serverpod Cloud Console , open your project and use the Logs , Sessions , and Metrics tabs to see what your server is doing."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/3.4.0/get-started/deployment",
      "title": "Deploying Serverpod | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 3.4.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 3.4.0 Copy as Markdown\nOn this page\n\nDeploying Serverpod\n\nServer requirements ​\n\nServerpod is written in Dart and compiles to native code, allowing it to run on any platform supported by the Dart tooling .\nMany users prefer to deploy Serverpod using Docker. The project includes a basic Dockerfile that you can use to build a Docker image, which can then be run on any Docker-compatible platform.\nFor non-Docker deployments, you'll need to compile the Dart code and manually copy your assets and configuration files to the server. This manual step is necessary since asset bundling is not yet supported by Dart .\n\nServer configuration ​\n\nBy default Serverpod is active on three ports:\n* 8080 : The main port for the server - this is where the generated client will connect to.\n* 8081 : The port for connecting with the Serverpod Insights tooling. You may want to restrict which IP addresses can connect to this port.\n* 8082 : The built in webserver is running on this port.\nYou will also need to configure the database connection in the config/production.yaml file and securely provide the config/passwords.yaml file to the server.\n\nHealth checks ​\n\n...\n\nDeploying with Serverpod Cloud ​\n\nServerpod Cloud is a managed service that allows you to deploy your Serverpod applications without having to worry about the underlying infrastructure.\nServerpod Cloud is currently in private beta. Request access by filling out this form . Once you have access, you can deploy your Serverpod applications to the cloud in just a few minutes and with zero configuration.\n\nOther deployment options ​\n\nCheck out choosing a deployment strategy for more information on how to deploy your Serverpod application to other platforms.\nEdit this page\nPrevious Working with the database Next Overview\n* Server requirements\n* Server configuration\n* Health checks\n* Deploying with Serverpod Cloud"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 20.4s)

_Thinking:_

Key questions remaining:
1. Is Serverpod 3.4.7 project deployable to Cloud? Docs say Serverpod CLI 4.0+ required. But `scloud` is standalone, and Cloud can build a 3.x project if Dart 3.8? There's a statement in the 3.4.0 docs about Cloud being in private beta. Current Cloud may require Serverpod 4? Let me check the "Private dependencies"/"recover from failed deploy" for framework version. Or search "serverpod cloud serverpod 3.4 compatibility".

Let me check the cloud "launch" prereq: "A Serverpod project on your machine. See Creating a new project". The Cloud CLI's version independent. The deployed server uses your pubspec dependencies, so 3.4.7 should build. But there may be a minimum version guard. Search.

2. App/web: In standard new Serverpod project, `web/app` is at server root? Actually template: `server/web/app`? In Serverpod 3 the Flutter web build is copied to `server/web/app`, and the server serves it. Cloud's "Web" URL serves the Flutter web app at the root. Hmm, docs say "Your Flutter web app loads at the root" but our server's `FlutterRoute(appDir), '/app/*'` and static index at `/`. Need to check how Cloud maps. I believe Cloud's web URL proxies to the webServer (port 8082) or to the api server's web routes? Actually in Serverpod Cloud, the web address routes to the server's web server (which includes `pod.webServer` routes). Wait, Serverpod 3 merged web server into the api server? In Serverpod 3, `webServer` is a separate server on 8082. Cloud may route through it. In Serverpod 4, there's only one server (web server integrated). Hmm.

Important: Cloud docs "Your Flutter web app loads at the root" likely assumes Serverpod 4's default Flutter web route at `/` from `web/app`. In 3.x template, the web server serves `web/pages/` static and the Flutter app is at... Let me look at the actual default `server.dart` in Serverpod 3.4 templates. I recall in Serverpod 3.4, `server.dart` includes:

```dart
pod.webServer.addRoute(StaticRoute.directory(Directory('web/')), '/');
```
Hmm not sure.

Our project explicitly serves index.html at `/` (a placeholder?) and Flutter app at `/app/*`. That means Cloud Web URL root shows `web/pages/index.html`, not the Flutter app. If Cloud expects root, we need to change. Let me read `web/pages/index.html` and check how Cloud serves. Also check Flutter web `getServerUrl` assets config: Flutter's config.json is served at `/app/assets/assets/config.json` — but Cloud auto-sets SERVER_URL for app builds. For Flutter web hosted under `/app`, the config is fetched? Let's check the flutter project's config.json and `getServerUrl` behavior.

Also jaspr: it has hardcoded localhost URL. Jaspr is separate from the server. Cloud can host a "preconfigured website", but for a Jaspr app, we'd build it and put it in `server/web/jaspr` and serve via SpaRoute? Or use Cloud's static hosting? Cloud "web" is a preconfigured website for Flutter web app. Hmm. Need to understand `web` directory handling in Cloud. Let me read the "Deploy your first app" note: "Projects created with the website option show a landing page at the root, with the Flutter web app under /app." So Cloud supports two options: website or plain. Our server already serves Flutter at /app and index at root. We could host Jaspr at root (replace index.html) and Flutter at /app — that matches "website option". So building Jaspr into `web/` and serving at root could work.

Wait, but with `jaspr build`, output goes to `build/jaspr` and is static (with server? jaspr mode client). We can copy to `namma_quiz_server/web/` and serve. Need to set base href and API URL at build time. Better: keep a single web (Jaspr) plus Flutter at /app.

Let me read the Flutter build script/windows, jaspr config, and the web/pages/index.html.

3. Redis: `session.messages` across multiple podlets requires Redis. So plan: Upstash in EU-CENTRAL-1, set env vars + `redis` password. Also note Redis enable on dev false. On Cloud, set enabled true via env. Good.

4. Database: managed Postgres 17, migrations auto-applied. Good. Need `production.yaml` maybe not needed since Cloud injects DB env. Cloud supplies `SERVERPOD_DATABASE_*` env, which Serverpod reads (in 3.x? These env var overrides are a Serverpod 4 feature maybe; docs say "Your server reads these through Serverpod's standard configuration"). Need to check if 3.4.7 supports env var overrides `SERVERPOD_DATABASE_HOST`. This is critical. Search docs "configuration environment variables SERVERPOD_DATABASE_HOST" for 3.4. Env var overrides were added in Serverpod 3.x? Let me check.

5. Dart version: 3.8 default, project constraint ^3.8.0 fine.

6. Scale-to-zero: Starter plan always scales to zero. For real-time live quizzes, scale-to-zero is a problem: server wakes on requests; open streams keep it running. But lobby waiting? A streaming connection after wake keeps it running. First player connecting gets 4-6s delay. For a live quiz, probably choose Growth with min podlets 1. Also multiple podlets: real-time stream messages via Redis. But there might be an issue: game state in DB is fine. `createStream` uses message central; Redis handles pub/sub. Good.

7. Existing `bin/main.dart` seeds default quiz with `creatorId: 1` — on every cold start; fine but no user id 1 may violate FK. Check model definitions for FK and creatorId. Let me read models.

8. Auth: JWT keys auto-provisioned by Cloud (Auth category includes serverpod_auth_idp_server keys). Email IDP verification codes are only logged. For production, need an email provider; plan for it (SMTP or Resend) via password + package? Currently only logs. Flag as issue.

9. Serverpod version upgrade? The Cloud CLI 4.0 prerequisite is for the CLI, not the project. But there might be a minimum project version. Let me search "cloud" "serverpod 3" or check the launch guide requirements. Actually likely Serverpod Cloud supports 3.x projects via `scloud` standalone. But the launch command adds `serverpod generate` pre-deploy hook which will use local Serverpod CLI; on Cloud build they may run `dart pub get`. Hmm.

Given the plan, the safest recommendation: upgrade to Serverpod 4.x before deploying (since Cloud docs and tooling target 4.x, 3.4 no longer maintained, and 4.x has env-var config + integrated web server). But that is a bigger migration. Alternatively, deploy 3.4.7 with standalone `scloud` if supported. I should verify whether Cloud accepts 3.x.

Let me search.

**Tool: websearch**

**Input:**
```json
{
  "query": "\"Serverpod Cloud\" \"3.4\" OR \"Serverpod 3\" deploy compatibility minimum version",
  "numResults": 6
}
```

**Output:**
```
{
  "search_id": "search_aa75d904da2923f7ff9fb0c9b3b154e7",
  "results": [
    {
      "url": "https://docs.serverpod.dev/3.4.0/get-started/deployment",
      "title": "Deploying Serverpod | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 3.4.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 3.4.0 Copy as Markdown\nOn this page\n\nDeploying Serverpod\n\nServer requirements ​\n\nServerpod is written in Dart and compiles to native code, allowing it to run on any platform supported by the Dart tooling .\nMany users prefer to deploy Serverpod using Docker. The project includes a basic Dockerfile that you can use to build a Docker image, which can then be run on any Docker-compatible platform.\nFor non-Docker deployments, you'll need to compile the Dart code and manually copy your assets and configuration files to the server. This manual step is necessary since asset bundling is not yet supported by Dart .\n\n...\n\nDeploying with Serverpod Cloud ​\n\nServerpod Cloud is a managed service that allows you to deploy your Serverpod applications without having to worry about the underlying infrastructure.\nServerpod Cloud is currently in private beta. Request access by filling out this form . Once you have access, you can deploy your Serverpod applications to the cloud in just a few minutes and with zero configuration.\n\nOther deployment options ​\n\nCheck out choosing a deployment strategy for more information on how to deploy your Serverpod application to other platforms.\nEdit this page\nPrevious Working with the database Next Overview"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/deployment/dart-sdk-versions",
      "title": "Dart SDK versions | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Dart SDK versions\n\nServerpod Cloud builds your server with one of a fixed set of Dart SDK versions. This page lists the supported versions and shows how to select the one your deploy uses.\n\nSupported versions ​\n\n* Dart 3.8 (default)\n* Dart 3.9\n* Dart 3.10\n* Dart 3.11\n* Dart 3.12\n* Dart 3.13\n\nHow the version is selected ​\n\nThe scloud deploy command reads the Dart SDK version from the first of these sources that sets one:\n1. The --dart-version flag.\n2. The dartSdk field in scloud.yaml .\n3. The dart entry in a .tool-versions file, in the project directory first and then the workspace root.\n4. The environment.sdk constraint in pubspec.yaml .\nEvery source accepts an exact version or a pub-style version constraint, such as 3.10 , ^3.9.0 , or >=3.9.0 <4.0.0 . Serverpod Cloud builds with the highest supported version the constraint allows. If the constraint allows no supported version, the deploy fails with an error that lists the supported versions.\nWhen no source sets a version, your server builds with Dart 3.8.\n\n...\n\nWithout any of the sources above, the SDK constraint in your pubspec.yaml decides:\npubspec.yaml\nenvironment : sdk : \">=3.9.0 <4.0.0\"\nThis example builds with the highest supported version, since the constraint allows all of them from 3.9 up.\n\nRelated documentation ​\n\n* scloud.yaml schema - The dartSdk field and how scloud commands preserve it.\n* Deployments - Deploy operations, status checks, and package validation.\n* scloud deploy - The deploy command and its flags.\nEdit this page\nPrevious Recover from a failed deploy Next Private dependencies"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/deployments/deploy-to-serverpod-cloud",
      "title": "Deploy to Serverpod Cloud | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nDeploy to Serverpod Cloud\n\nServerpod Cloud is the recommended way to host a Serverpod server. It is a fully managed platform built and maintained by the Serverpod team, designed specifically for Serverpod apps. You deploy in minutes with zero configuration, and there is no VM setup, container configuration, or infrastructure to orchestrate yourself.\ninfo\nYour first project includes a one-month free trial, with no credit card required.\nCloud manages the production infrastructure for you:\n* An optional production-grade Postgres database, with migrations applied automatically on each deploy.\n* Networking, load balancing, and custom domains with TLS certificates.\n* Server instances (podlets) with predictable pricing. See Cloud plans for what each plan includes.\n* A secure key manager for your app secrets.\n\nDeploy from the terminal ​\n\nYou deploy with the Serverpod CLI:\n1. Run serverpod cloud launch . It installs the Cloud CLI if needed. If you aren't signed in, it opens your browser so you can sign in.\n2. For a new project, the Cloud Console opens so you can create it. The database setting is pre-filled from your server's config.\n3. When prompted, select the custom passwords from config/passwords.yaml to copy to Cloud. The command then deploys your server.\n4. Set any other secrets (API keys, OAuth credentials) with serverpod cloud password set . Then run serverpod cloud deploy so the server picks them up.\nSee the Serverpod Cloud documentation for the full walkthrough, including secrets, custom domains, and logs.\nTo run the server yourself instead, see Custom hosting .\nEdit this page\nPrevious Model reference Next Choosing a strategy"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/deployment/deploying-your-application",
      "title": "Deploying your application | Serverpod",
      "publish_date": null,
      "excerpts": [
        "On this page\n\nDeploying your application\n\nServerpod Cloud makes it easy to deploy your Serverpod applications with a single command. You can also perform dry runs to validate your deployment package without actually deploying it.\n\nGenerating code before deployment ​\n\nBefore deploying your application, you should always generate your code to ensure all your models and endpoints are up to date:\nserverpod generate\n\nStandard deployment ​\n\nTo deploy your application to Serverpod Cloud:\nscloud deploy\nThe CLI will:"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/concepts/deployments",
      "title": "Deployments | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deployments\n\nWhen you ship a code change to Serverpod Cloud, serverpod cloud deploy builds and rolls out a new version of your server. Cloud switches traffic automatically to the latest successful deploy, keeping the previous one live if a build fails.\n\nDeploy your app ​\n\ninfo\nIf this is the first time you're deploying this project to Cloud, follow Deploy your first app first. It walks through serverpod cloud launch , which creates the project before the first deploy.\nDeploy your project to Cloud:\nserverpod cloud deploy\nThe CLI packages your project, uploads it, and waits for the new version to go live. Once the deployment is live, your project is reachable at its default URLs:\n* Web: https://<project-id>.serverpod.space/\n* API: https://<project-id>.api.serverpod.space/\n* Insights: https://<project-id>.insights.serverpod.space/\nTo use your own URL instead, see Custom domains .\nOther flags:\n* -v ( --verbose ): detailed output.\n* --dart-version : override the Dart SDK used at build time.\n* --concurrency=<N> : how many files are zipped in parallel during packaging (default 5 ).\nTo regenerate code or run other tasks before each deploy, configure a pre-deploy hook. See Deployment hooks .\n\nCheck deployment status ​"
      ]
    },
    {
      "url": "https://github.com/serverpod/serverpod/blob/main/CHANGELOG.md",
      "title": "serverpod/CHANGELOG.md at main · serverpod/serverpod · GitHub",
      "publish_date": null,
      "excerpts": [
        "serverpod/serverpod — CHANGELOG.md\n\n* Page: GitHub code file\n* URL: github.com/serverpod/serverpod/blob/main/CHANGELOG.md\n* Repository: serverpod/serverpod\n* Path: CHANGELOG.md\n* Ref: main\n* Lines: 1301\n\n4.1.0-beta.3\n\n* feat: Adds support for custom target entrypoints in runner commands. (@mathis6787)\n* fix: Stops the runner on quit when serverpod start spawned it.\n\n...\n\n* perf: Improves file uploader performance by using streamed uploads instead of buffered uploads.\n* perf: Speeds up deserialization of shared and module models by ~x3.\n* perf: Speeds up SQLite operations from ~1.1x to ~55x.\n* chore: Adds a Serverpod Cloud deploy workflow to the project template\nAlso includes all fixes from 4.0.3 and 4.0.4. Version 4.1.0-beta.2 was skipped due to a packaging issue.\n\n4.1.0-beta.1\n\n...\n\n3.4.0\n\nServerpod 3.4 comes with two long-awaited features: shared models between server and client and allowing caching any type of object to the local/Redis cache. It also brings two new Identity Providers (Facebook and Microsoft), a complete revamp to the cloud storage system, ignore conflicts on inserts and row-level locking on the database, shell completion support to the CLI and more improvements to the developer experience.\n\nCore\n\n...\n\n3.3.0\n\nServerpod 3.3 brings a lot of new features and improvements to the framework, including two new identity providers (GitHub and Anonymous), virtual host routing, a robust Kubernetes-ready monitoring system, JSON key aliases and enum properties on models, and several improvements to logging.\nThe Anonymous IDP is currently experimental and can not be completely used yet due to the missing support for account linking. The missing parts will be added in the next releases.\n\n...\n\n3.0.0\n\nServerpod 3 is a major overhaul of the authentication system and the web server.\n\nReworked web server\n\nServerpod 3 introduces a fully reworked web server with improved performance, additional features, and increased extensibility. Built on top of the Relic framework, it provides a more robust and flexible foundation for building web applications.\nKey improvements include:\n\n...\n\n* fix: Improved error message if port is in use when starting server.\n* chore: Bumps vm_service version to support latest version.\n\n1.2.0\n\nThis is a summary of the new features in version 1.2.0. For the full list, please refer to the commits on Github. Instructions for updating from 1.1 of Serverpod is available in our documentation here.\n\nMain new features and fixes"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/deploy",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "scloud deploy\n\nscloud deploy packages your project, uploads it to Serverpod Cloud, and waits for the new version to go live. Run it from the directory containing scloud.yaml (typically your project root or server directory) or pass --project-dir .\nTo validate the build without touching the running app, use scloud deploy --wet-run (optionally with --show-files to preview the upload). To follow an in-flight deploy, run scloud status deployment show .\nFor the full deploy lifecycle, pre-deploy hooks, and how to recover from a failed deploy, see Deployments and Recover from a failed deploy .\n\nUsage ​\n\nDeploy a Serverpod project to the cloud. Usage: scloud deploy [arguments] -h, --help                     Print this usage information. -p, --project (mandatory)      The ID of the project. Can be passed as the first argument. Can be omitted for existing projects that are linked (see the \"project link\" command)."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud",
      "title": "Introduction | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Serverpod Cloud is a managed hosting platform for Serverpod apps with predictable pricing. You deploy your app with the Serverpod Cloud CLI or via CI/CD, and use the web console for account setup, billing, and project dashboards.\nWith the Cloud CLI set up , launch your first project with one command. No Dockerfile, no container config, no infrastructure setup:\nserverpod cloud launch\n\nWhat Serverpod Cloud manages ​\n\n...\n\n* Pub/sub and caching. Supported through the Serverpod framework with a third-party Redis service you connect yourself. See Use Redis for PubSub and caching for the typical setup.\n\nWhere to go next ​\n\n* Set up the Cloud CLI to get the CLI ready and authenticate it.\n* Deploy your first app for a guided first deploy.\nEdit this page\nNext Set up the Cloud CLI\n* What Serverpod Cloud manages\n* Where to go next\nCopyright © 2026 Serverpod authors."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/3.4.0/deployments/deployment-strategy",
      "title": "Choosing deployment strategy | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 3.4.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 3.4.0 Copy as Markdown\nOn this page\n\nChoosing deployment strategy\n\nThere are different options for hosting Serverpod. The minimal requirements are a single server or a serverless managed platform like Google Cloud Run and a Postgres database. Which setup you choose depends on the requirements of your architecture.\nThe main two options are running Serverpod on a cluster of servers or on a serverless platform."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/reference/cli/commands/launch",
      "title": "Serverpod",
      "publish_date": null,
      "excerpts": [
        "scloud launch\n\nscloud launch is the front door for new projects: it links your local server to a Serverpod Cloud project and deploys for the first time. You pick one of your projects, or create a new one in the Console with the project ID and database setting pre-filled from your project. The command then adds pre-deploy hooks, offers to copy custom passwords from config/passwords.yaml , and deploys.\nOnce your project is linked, you typically switch to scloud deploy for subsequent updates. For non-interactive project creation (no prompts), use scloud project create and pass the settings as flags.\nSee Deploy your first app for the full walkthrough.\n\nUsage ​\n\nCommon command to launch and deploy Serverpod Cloud projects. If there already is a Serverpod Cloud project near the current directory it will redeploy the project (upload, build, and rollout in the cloud). Otherwise it will guide you through setting up a new Serverpod Cloud project. Usage: scloud launch [arguments] -h, --help                       Print this usage information. -p, --project                    The ID of the project. --[no-]pre-deploy-scripts    Set up pre-deploy scripts. (defaults to on) --dart-version               Overrides the Dart SDK version to use for building the project. -u, --[no-]utc                   Display timestamps in UTC timezone instead of local. Set SERVERPOD_CLOUD_DISPLAY_UTC=true to make UTC the default for all commands. Deployment options -c, --concurrency=<integer>      Number of concurrent files processed when zipping the project. (defaults to \"5\") --wet-run                    Perform every step except the deployment, leaving the hosted application untouched. Local files and the cloud project setup may still be modified. --show-files                 Display the file tree that will be uploaded. -o, --output                     Save the deployment zip file to the specified path. Must end with .zip --[no-]await                 Await the deployment to finish while showing status progression. (defaults to on) Run \"scloud help\" to see global options. See the full documentation at: docs.serverpod.dev/cloud/reference/cli/commands/launch\nEdit this page\nPrevious help Next log"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/guides/recover-from-a-failed-deploy"
}
```

**Output:**
```
  Recover from a failed deploy | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Recover from a failed deploy

When a deployment to Serverpod Cloud fails, use this guide to identify the cause, fix the problem, and deploy again. A failed deployment does not replace the currently running version. Serverpod Cloud switches traffic only after a successful deployment. If a previous version was live, it remains live.

## Before you start[​](#before-you-start "Direct link to Before you start")

Ensure you have:

-   The Serverpod Cloud CLI set up and authenticated. See [Set up the Cloud CLI](/cloud/getting-started/installation).
-   A Serverpod Cloud project with at least one deploy attempt.

## Confirm the failed deployment[​](#confirm-the-failed-deployment "Direct link to Confirm the failed deployment")

List recent deployments to identify the failed attempt:

```
serverpod cloud status deployment list
```

A failed deploy shows `FAILURE` in the Status column and a reason in the Info column. For example:

```
# | Project | Deploy Id                            | Status  | Started (local)     | Finished (local)    | Info--+---------+--------------------------------------+---------+---------------------+---------------------+-----------------------------------0 | my-app  | 73e66b41-64fc-4920-b6ef-4918cc6ceca1 | FAILURE | 2026-06-15 15:19:37 | 2026-06-15 15:20:34 | User build FAILURE - see build log
```

Copy the deployment ID so you can inspect the logs for that specific attempt.

## Inspect the build logs[​](#inspect-the-build-logs "Direct link to Inspect the build logs")

Build-time errors appear only in the build log. Start by retrieving the latest build log:

```
serverpod cloud build log
```

To inspect a specific deployment, pass its sequence number (`0` is the latest) or deployment UUID from `serverpod cloud status deployment list`:

```
serverpod cloud build log 3serverpod cloud build log 73e66b41-64fc-4920-b6ef-4918cc6ceca1
```

For long logs, redirect the output to a file or search for error messages:

```
serverpod cloud build log > build-log.txtserverpod cloud build log | grep ERROR
```

## Diagnose and fix the failure[​](#diagnose-and-fix-the-failure "Direct link to Diagnose and fix the failure")

Find the symptom that best matches your deployment status or logs, then expand the corresponding section.

**A pre-deploy script failed**

A script in your `scloud.yaml` under `project.scripts.pre_deploy` exited with a non-zero status, so the CLI stopped before uploading your project.

To fix:

1.  Run the failing command locally to reproduce the error.
2.  Fix script logic, file paths, or missing local environment variables.

See [Deployment hooks](/cloud/concepts/deployment-hooks) for the failure semantics and the [scloud.yaml schema](/cloud/reference/scloud-yaml-schema#pre_deploy) for the accepted formats.

**The CLI reported a send timeout**

The CLI reports `Send Timeout. Please check your internet connection and try again`. The upload stalled for longer than the CLI's timeout (60 seconds by default), so nothing was built. This commonly occurs on slower connections or first deploys containing large assets.

Increase the upload timeout and redeploy:

```
serverpod cloud deploy --timeout 120s
```

If the problem persists, check your network connection and retry later.

**The deployment failed to resolve dependencies**

Serverpod Cloud cannot resolve packages declared in `pubspec.yaml`.

To fix:

1.  Run `dart pub get` locally.
2.  Resolve version conflicts, missing packages, or private dependency configuration issues.

For private packages, see [Private dependencies](/cloud/reference/private-dependencies).

**The build failed with compilation errors**

Lines starting with `ERROR:` or `FAILED:` in the build log often indicate a Dart compilation error, missing import, or missing dependency. Fix the relevant code or dependency and redeploy.

**The build succeeded, but a database migration failed**

The build succeeded, but pending schema changes in `migrations/` failed to apply.

To fix:

1.  View the runtime server logs to find the exact database error:
    
    ```
    serverpod cloud log
    ```
    
2.  Look for `Failed to apply database migrations`. Common causes are duplicate columns or malformed SQL.
    
3.  Correct the migration locally.
    

**The build succeeded, but the server crashed on startup**

The CLI reports `Rollout failed.`, and the Info column shows `Deployment failed: the new version did not become healthy and did not roll out.`

To fix:

1.  Check the runtime server logs:
    
    ```
    serverpod cloud log
    ```
    
2.  Look for `Unhandled exception:` and inspect the stack trace.
    

If the error is `Bad state: FutureCalls is not initialized.`, your server is trying to schedule a future call, which isn't supported on the Starter plan. To use future calls, [upgrade to the Growth or Enterprise plan](https://serverpod.dev/cloud) and redeploy.

## Redeploy and verify[​](#redeploy-and-verify "Direct link to Redeploy and verify")

Once the issue is resolved locally, re-run the deployment and monitor the rollout:

```
serverpod cloud deployserverpod cloud status deployment show
```

When **Rollout** reports success, Cloud switches traffic to the new version.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments) for the deploy lifecycle and `serverpod cloud deploy --wet-run` to validate before shipping.
-   [Logs](/cloud/concepts/logs) for the build-log and runtime-log surfaces.
-   [Deployment hooks](/cloud/concepts/deployment-hooks) for pre- and post-deploy hook failure semantics.
-   [Database](/cloud/concepts/database) for the migration model and how to reverse a schema change.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/guides/recover-from-a-failed-deploy.md)

[

Previous

Deploy from CI with GitHub Actions

](/cloud/guides/deploy-from-ci-with-github-actions)[

Next

Migrate a self-hosted database

](/cloud/guides/migrate-a-self-hosted-database)

-   [Before you start](#before-you-start)
-   [Confirm the failed deployment](#confirm-the-failed-deployment)
-   [Inspect the build logs](#inspect-the-build-logs)
-   [Diagnose and fix the failure](#diagnose-and-fix-the-failure)
-   [Redeploy and verify](#redeploy-and-verify)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem namma_quiz_server\\config -Force | Select-Object Name; Write-Output \"---\"; Get-Content namma_quiz_server\\config\\generator.yaml; Write-Output \"---INDEX---\"; Get-Content namma_quiz_server\\web\\pages\\index.html -TotalCount 30; Write-Output \"---JASPR---\"; Get-ChildItem namma_quiz_jaspr -Force | Select-Object Name"
}
```

**Output:**
```

Name                 
----                 
development.yaml     
generator.yaml       
production.yaml      
staging.yaml         
test.yaml            
---
type: server

client_package_path: ../namma_kahoot_client
server_test_tools_path: test/integration/test_tools
---INDEX---
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Namma Quiz | Real-Time Trivia</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <div class="background-blobs">
        <div class="blob blob-1"></div>
        <div class="blob blob-2"></div>
    </div>

    <div class="container">
        <h1>Namma Quiz</h1>
        <p>Real-time trivia for everyone. Join with a PIN or host your own session.</p>

        <div class="join-form">
            <input type="number" id="pinInput" placeholder="Game PIN" max="999999">
            <button onclick="joinGame()">Enter</button>
        </div>

        <div style="margin: 24px 0; opacity: 0.5;">OR</div>

        <div class="actions">
            <a href="/app" class="btn btn-primary">Open App (Player)</a>
            <a href="/app?role=host" class="btn btn-secondary">Host a Game</a>
        </div>

---JASPR---
lib                  
web                  
.gitignore           
analysis_options.yaml
pubspec.yaml         
README.md            



```

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_jaspr\\lib\\providers\\client_provider.dart"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\client_provider.dart</path>
<type>file</type>
<content>
1: import 'package:jaspr_riverpod/jaspr_riverpod.dart';
2: import '../../../namma_quiz_client/lib/namma_kahoot_client.dart';
3: 
4: // Since this is purely a client-side SPA in Jaspr, we connect to the local server
5: final client = Client('http://localhost:8080/');
6: 
7: final clientProvider = Provider<Client>((ref) {
8:   return client;
9: });

(End of file - total 9 lines)
</content>
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 13.3s)

_Thinking:_

Notes:
- No passwords.yaml file in config. That means JWT/auth keys aren't set? `JwtConfigFromPasswords` gets passwords from `config/passwords.yaml` (development) or env on Cloud. Cloud auto-provisions auth passwords. Locally absent → maybe defaults/generated? Let me check .gitignore and client package config. Also check the server models and client config.

- The jaspr import is a relative path into another package (`../../../namma_quiz_client/lib/...`) — that's bad and likely won't compile in Cloud or standalone. Actually in a workspace, it may resolve via path? Relative imports outside lib are illegal in Dart packages (analyzer error "import of a file outside the package"). Hmm, maybe it works in a workspace? No—Dart allows relative imports only within the package's lib? It can import relative files in the same package; outside is not allowed for a package's public API but the compiler might allow. Anyway, needs fixing to `package:namma_kahoot_client/namma_kahoot_client.dart`.

- Jaspr `client_provider.dart` hardcodes localhost. Needs SERVER_URL from environment. For a client-side SPA built by jaspr, use `const String.fromEnvironment('SERVER_URL')` and for web also fetch `/app/assets/assets/config.json`? Simpler: configure via pre-deploy build using `--dart-define` or generate config. Since we plan deployment on Cloud, SERVER_URL is not auto-set for the web server; only for app publishing (mobile). For Flutter web, the server's config.json route exists at `/app/assets/assets/config.json` which the client fetches (`getServerUrl`). Wait, `getServerUrl` in serverpod_flutter fetches `assets/assets/config.json`? Let me check. Actually in the Flutter app, `getServerUrl` checks `String.fromEnvironment('SERVER_URL')` then `assets/config.json`. The server route `/app/assets/assets/config.json` returns apiUrl. And the build script sets `--base-href /app/`. Good.

But Cloud's web URL: `webServer` is proxied at the web host. Need to verify whether Cloud routes to `webServer` port or apiServer's web routes. In Serverpod 3, web server is separate, exposed on 8082, and Cloud's Web URL likely maps to `webServer`. Their docs: "Cloud hosts both your backend and a preconfigured website for your Flutter web app." So yes, web URL -> webServer. Good.

- Cloud `SERVERPOD_DATABASE_*` env support in Serverpod 3.4.7: Need to confirm. Search Serverpod docs for config env vars. Let me fetch the configuration docs (4.1 and 3.4). Also check the changelog for "environment variables" support.

- Also check `config/passwords.yaml` requirement locally. `.gitignore`.

- Models: check `.spy.yaml` for serverOnly fields etc.

Let me look.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-Content namma_quiz_server\\.gitignore; Write-Output \"---MODELS---\"; Get-ChildItem namma_quiz_server\\lib\\src\\models\\kahoot\\*.yaml | ForEach-Object { Write-Output (\"### \" + $_.Name); Get-Content $_.FullName }"
}
```

**Output:**
```
# Files and directories created by pub
.dart_tool/
.packages

# Conventional directory for build outputs
build/

# Ignore the flutter web app directory
web/app

# Directory created by dartdoc
doc/api/

# Passwords file
config/passwords.yaml

# Firebase service account key for Firebase auth
config/firebase_service_account_key.json
---MODELS---
### game_event.spy.yaml
class: GameEvent
fields:
  eventType: String # 'PLAYER_JOINED', 'QUESTION_STARTED', 'ANSWER_RECEIVED', 'SHOW_LEADERBOARD'
  dataJson: String # Additional data encoded as JSON strings
### game_session.spy.yaml
class: GameSession
table: game_sessions
fields:
  pin: String
  quizId: int
  hostId: int
  status: String # 'lobby', 'active', 'finished'
  currentQuestionIndex: int
  startTime: DateTime?
indexes:
  game_session_pin_idx:
    fields: pin
    unique: true
### player.spy.yaml
class: Player
table: players
fields:
  gameSessionId: int
  name: String
  score: int
indexes:
  player_game_session_idx:
    fields: gameSessionId
### question.spy.yaml
class: Question
table: questions
fields:
  quizId: int
  text: String
  options: List<String>
  correctOptionIndex: int
  timeLimitSeconds: int
  orderIndex: int
indexes:
  question_quiz_idx:
    fields: quizId
### quiz.spy.yaml
class: Quiz
table: quizzes
fields:
  title: String
  creatorId: int
  description: String?
  createdAt: DateTime
indexes:
  quiz_creator_idx:
    fields: creatorId

```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem namma_quiz_flutter\\web, namma_quiz_flutter\\assets -Recurse -File -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName; Write-Output \"---\"; Get-Content namma_quiz_flutter\\pubspec.yaml; Write-Output \"---JASPRWEB---\"; Get-ChildItem namma_quiz_jaspr\\web -Recurse -File | Select-Object -ExpandProperty FullName"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\favicon.png
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\index.html
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\manifest.json
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\icons\Icon-192.png
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\icons\Icon-512.png
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\icons\Icon-maskable-192.png
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\web\icons\Icon-maskable-512.png
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\assets\config.json
---
name: namma_kahoot_flutter
description: A new Flutter project with Serverpod.

# The following line prevents the package from being accidentally published to
# pub.dev using `pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 1.0.0+1

environment:
  sdk: '^3.8.0'
  flutter: '^3.32.0'

dependencies:
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.5
  flutter:
    sdk: flutter
  flutter_riverpod: ^3.3.1
  namma_kahoot_client:
    path: ../namma_kahoot_client
  serverpod_auth_idp_flutter: 3.4.7
  serverpod_flutter: 3.4.7

dev_dependencies:
  flutter_lints: '>=3.0.0 <7.0.0'
  flutter_test:
    sdk: flutter

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages
  assets:
    - assets/config.json
dependency_overrides:
  flutter_secure_storage: ^10.0.0

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
---JASPRWEB---
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\web\favicon.ico
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\web\index.html
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\web\main.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\web\images\logo.svg
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\web\styles\main.css

```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/concepts/server-fundamentals/configuration"
}
```

**Output:**
```
  Configuration | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/concepts/server-fundamentals/configuration)

-   [Next](/next/concepts/server-fundamentals/configuration)
-   [4.1.0](/concepts/server-fundamentals/configuration)
-   [4.0.0](/4.0.0/concepts/server-fundamentals/configuration)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/)
-   [Get Started](/installation)
    
    -   [Installation](/installation)
    -   [Quickstart](/quickstart)
    -   [How it works](/how-it-works)
-   [Build your first app](/get-started/creating-endpoints)
    
-   [Serverpod Academy](/serverpod-academy)
-   [Tutorials](/tutorials/fundamentals)
    
-   [Support & community](/support)
-   [Concepts](/concepts/server-fundamentals/your-serverpod-project)
    
    -   [Server fundamentals](/concepts/server-fundamentals/your-serverpod-project)
        
        -   [Your Serverpod project](/concepts/server-fundamentals/your-serverpod-project)
        -   [Running your server](/concepts/server-fundamentals/running-your-server)
        -   [Configuration](/concepts/server-fundamentals/configuration)
        -   [Modules](/concepts/server-fundamentals/modules)
    -   [Endpoints & APIs](/concepts/endpoints-and-apis)
        
    -   [Data & the database](/concepts/data-and-the-database/models)
        
    -   [Authentication](/concepts/authentication/get-started)
        
    -   [Web server](/concepts/web-server/overview)
        
    -   [Scheduling](/concepts/scheduling/overview)
        
    -   [Operations](/concepts/operations/overview)
        
    -   [Testing](/concepts/testing/get-started)
        
    -   [CLI](/concepts/cli/introduction)
        
    -   [Lookups](/concepts/lookups/configuration-reference)
        
-   [Deploy](/deployments/deploy-to-serverpod-cloud)
    
-   [Tools](/tools/insights)
    
-   [Upgrading](/upgrading)
    
-   [Roadmap & contributions](/contribute)
-   [Changelog](https://pub.dev/packages/serverpod/changelog)
-   [Serverpod Cloud](/cloud)

Version: 4.1.0Copy as Markdown

On this page

# Configuration

Configuration decides what your server listens on, which database and Redis (an in-memory store Serverpod can use for pub/sub and caching) it connects to, and how it behaves in each run mode, so the same code runs locally, in staging, and in production without edits. Serverpod reads configuration from three sources: the `config/<run-mode>.yaml` files, environment variables, and a `ServerpodConfig` Dart object passed to the `Serverpod` constructor. Environment variables override matching keys in the YAML files, and a Dart object replaces both.

With no configuration at all, Serverpod falls back to built-in defaults, so you can start with nothing and add configuration as you need it.

## How configuration works[​](#how-configuration-works "Direct link to How configuration works")

The YAML files and environment variables combine, and the Dart configuration object replaces both:

-   **YAML files** (`config/development.yaml`, `config/staging.yaml`, `config/production.yaml`, `config/test.yaml`): the baseline configuration, one file per run mode.
-   **Environment variables**: override matching YAML values, useful for per-deployment settings and secrets.
-   **Dart configuration object**: a `ServerpodConfig` passed to the `Serverpod` constructor. When you pass one, the server ignores `config/<run-mode>.yaml` and the `SERVERPOD_*` configuration variables. Command-line options such as `--mode` still override its values.

To adjust the loaded configuration instead of replacing it, pass a `configOverride` function to the `Serverpod` constructor. It receives the configuration from the sources above, and returns the one the server uses.

For every available option, its environment variable, config-file key, and default, see the [Configuration reference](/concepts/lookups/configuration-reference).

### Defaults[​](#defaults "Direct link to Defaults")

If no YAML config files exist, no environment variables are configured, and no Dart config is supplied, the server runs with this built-in default: the API server on port 8080 at `localhost`.

```
ServerpodConfig(  apiServer: ServerConfig(    port: 8080,    publicHost: 'localhost',    publicPort: 8080,    publicScheme: 'http',  ),);
```

## Run modes[​](#run-modes "Direct link to Run modes")

The server always runs in one of four run modes: `development` (the default), `test`, `staging`, or `production`. The run mode is selected with the `--mode` argument when the server starts, and it decides what the server loads:

-   The matching `config/<run-mode>.yaml` file.
-   The matching section of the [passwords file](#manage-secrets), merged with its `shared` section.

The `test` mode is used by the [test tools](/concepts/testing/get-started), which start the server against `config/test.yaml`. The other modes separate your local setup from your deployed environments. See [Running your server](/concepts/server-fundamentals/running-your-server#choose-a-run-mode) for how to pass `--mode` through `serverpod start`.

Run modes configure the server side. Your Flutter app picks the matching server address per environment on its own; see [Point the client at each environment](/concepts/endpoints-and-apis#point-the-client-at-each-environment).

## Configure with YAML files[​](#configure-with-yaml-files "Direct link to Configure with YAML files")

The `config` directory at the root of the server project holds one file per run mode, created with your project. The server loads the file named after the run mode it starts in: `config/development.yaml` is used when running in the `development` run mode. This is the scaffolded development file for a project named `myproject`, with comments and optional keys removed:

config/development.yaml

```
apiServer:  port: 8080  publicHost: localhost  publicPort: 8080  publicScheme: httpinsightsServer:  port: 8081  publicHost: localhost  publicPort: 8081  publicScheme: httpwebServer:  port: 8082  publicHost: localhost  publicPort: 8082  publicScheme: httpdatabase:  host: localhost  port: 8090  name: myproject  user: postgres  dataPath: .serverpod/development/pgdataredis:  enabled: false  host: localhost  port: 8091maxRequestSize: 524288sessionLogs:  persistentEnabled: true  consoleEnabled: true  consoleLogFormat: text
```

The three server blocks configure Serverpod's three servers: the API server your app talks to, the [Insights](/tools/insights) server used by Serverpod's tooling, and the [web server](/concepts/web-server/overview) for serving web content. Redis is optional and ships disabled; see [Redis](/concepts/operations/redis) for how to enable it and connect a client. The `sessionLogs` block controls how session logs are stored and printed; see [Logging](/concepts/operations/logging). Keys not in the scaffolded file cover future calls, websocket ping intervals, and more; see the [Configuration reference](/concepts/lookups/configuration-reference) for the full list with defaults.

### Database backends[​](#database-backends "Direct link to Database backends")

Serverpod supports both PostgreSQL and SQLite as database backends. A server that does not use a database leaves the `database` section out of every run mode file. Its models then can't use `table`, and `serverpod create-migration` won't create migrations.

warning

All run modes must use the same database backend, and either all of them or none of them configure a database: `serverpod generate` fails otherwise. This also keeps your development environment consistent with production.

#### PostgreSQL[​](#postgresql "Direct link to PostgreSQL")

New projects run an embedded PostgreSQL in the `development` and `test` run modes. When `dataPath` is set, the server boots and manages a PostgreSQL in that directory before connecting, so there is no separate database to install or start. The embedded database is for local development and testing only; in production, connect to an external PostgreSQL by omitting `dataPath`:

```
database:  host: localhost  port: 8090  name: database_name  user: postgres  maxConnectionCount: 10
```

The external PostgreSQL must be version 16 or later.

Set the database password in `passwords.yaml` (`database`) or through `SERVERPOD_PASSWORD_database`.

#### SQLite[​](#sqlite "Direct link to SQLite")

```
database:  filePath: server.db
```

No database password is required when using SQLite. SQLite doesn't support persistent session logs. `persistentEnabled` still defaults to `true`, so the server warns at startup until you set it to `false`. Console logging is on by default only in `development`. To see session logs in other run modes, set `consoleEnabled`. See [Configure logging](/concepts/operations/logging#configure-logging).

## Configure in Dart[​](#configure-in-dart "Direct link to Configure in Dart")

To configure Serverpod in Dart, pass an instance of the `ServerpodConfig` class to the `Serverpod` constructor, normally inside the `run` function in your `server.dart` file. When you configure this way, `apiServer` is the one field you must provide.

```
Serverpod(  args,  config: ServerpodConfig(    apiServer: ServerConfig(      port: 8080,      publicHost: 'localhost',      publicPort: 8080,      publicScheme: 'http',    ),    insightsServer: ServerConfig(      port: 8081,      publicHost: 'localhost',      publicPort: 8081,      publicScheme: 'http',    ),    webServer: ServerConfig(      port: 8082,      publicHost: 'localhost',      publicPort: 8082,      publicScheme: 'http',    ),  ),);
```

## Manage secrets[​](#manage-secrets "Direct link to Manage secrets")

Secrets are declared in the `config/passwords.yaml` file. Serverpod's API reads them with `getPassword`, so this page uses *secret* and *password* interchangeably. The file has a `shared` section, applied in all run modes, and one section per run mode:

config/passwords.yaml

```
shared:  stripeApiKey: 'sk_test_123...'development:  database: 'development_password'  redis: 'development_password'  serviceSecret: 'development_service_secret'  twilioApiKey: 'dev_twilio_key'production:  database: 'production_password'  redis: 'production_password'  serviceSecret: 'production_service_secret'  twilioApiKey: 'prod_twilio_key'
```

You can also provide any secret through [environment variables](#via-environment-variables).

### Built-in secrets[​](#built-in-secrets "Direct link to Built-in secrets")

The following table shows the built-in secrets that Serverpod uses for its core functionality. These can be configured either through environment variables or by adding the corresponding key in a run-mode or `shared` section of the passwords file. They are separate from any custom secrets you define.

Environment variable

Passwords file

Default

Description

SERVERPOD\_PASSWORD\_database

database

\-

The password for the database.

SERVERPOD\_PASSWORD\_serviceSecret

serviceSecret

\-

The token used to connect with Insights. Must be at least 20 characters.

SERVERPOD\_PASSWORD\_redis

redis

\-

The password for the Redis server.

Each built-in secret also has a dedicated environment variable: `SERVERPOD_DATABASE_PASSWORD`, `SERVERPOD_SERVICE_SECRET`, and `SERVERPOD_REDIS_PASSWORD`. All environment variables override the passwords file, and the `SERVERPOD_PASSWORD_*` form wins when both are set.

### Secrets for first-party packages[​](#secrets-for-first-party-packages "Direct link to Secrets for first-party packages")

For secrets related to first-party Serverpod packages, see their respective documentation:

-   **Cloud storage**: see [File uploads](/concepts/endpoints-and-apis/file-uploads) for Google Cloud Storage, AWS S3, and Cloudflare R2 secrets, and [Custom cloud storage](/concepts/endpoints-and-apis/custom-cloud-storage) for local disk.
-   **Authentication**: see [Storing Secrets](/concepts/authentication/setup#storing-secrets) on the Authentication setup page.

### Custom secrets[​](#custom-secrets "Direct link to Custom secrets")

Add your own keys to the passwords file the same way, under `shared` or a run-mode section, as `stripeApiKey` and `twilioApiKey` are in the example above.

#### Via environment variables[​](#via-environment-variables "Direct link to Via environment variables")

You can also define custom secrets using environment variables with the `SERVERPOD_PASSWORD_` prefix. For example, `SERVERPOD_PASSWORD_myApiKey` becomes available as `myApiKey`: the prefix is stripped. These variables override same-named entries in the passwords file and, like the `shared` section, apply in all run modes.

```
export SERVERPOD_PASSWORD_stripeApiKey=sk_test_123...
```

### Access secrets in code[​](#access-secrets-in-code "Direct link to Access secrets in code")

Secrets are only available on the server. They are never sent to or accessible from your Flutter app.

Inside an endpoint, read a secret from the [`Session`](/concepts/endpoints-and-apis/sessions) through the `passwords` map:

```
Future<void> processPayment(Session session, PaymentData data) async {  final stripeApiKey = session.passwords['stripeApiKey'];  // Use the API key to make requests to Stripe.}
```

The same value is available from `session.serverpod.getPassword('stripeApiKey')`.

Outside of a request, for example during startup in your server's `run` function, read it from the `Serverpod` instance with `getPassword`:

```
// `pod` is the Serverpod instance created in run().final stripeApiKey = pod.getPassword('stripeApiKey');
```

This works for built-in and custom secrets alike, whether they come from the passwords file or an environment variable.

### Secrets in production[​](#secrets-in-production "Direct link to Secrets in production")

A new project's `.gitignore` excludes `config/passwords.yaml` and credential files such as `config/firebase_service_account_key.json`, so secrets are not committed by default. Keep production secrets out of source control.

In production, set secrets through `SERVERPOD_PASSWORD_*` environment variables, or your host's secret manager, rather than a checked-in passwords file.

### Passwords on Serverpod Cloud[​](#passwords-on-serverpod-cloud "Direct link to Passwords on Serverpod Cloud")

On [Serverpod Cloud](/cloud), you set the values that `getPassword` reads from the command line, with `serverpod cloud password set`, instead of editing a passwords file. See [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars) for the full reference.

## Configure code generation[​](#configure-code-generation "Direct link to Configure code generation")

Serverpod uses a `generator.yaml` file to configure code generation. Place this file in the `config` directory of your server project.

For every `generator.yaml` option, its type and default, see the [Configuration reference](/concepts/lookups/configuration-reference#code-generation). The sections below explain the options you set most often.

### Package types[​](#package-types "Direct link to Package types")

The `type` field determines how Serverpod treats your package:

-   **server**: A standard Serverpod application (default).
-   **module**: A reusable module that can be imported by other Serverpod projects.
-   **internal**: Used only by Serverpod's own framework packages; you will not use this.

For modules, you can also specify a `nickname`:

```
type: modulenickname: auth
```

### Client package path[​](#client-package-path "Direct link to Client package path")

By default, Serverpod expects the client package to be located at `../[project_name]_client`. You can customize this:

```
client_package_path: ../my_custom_client
```

### Test tools generation[​](#test-tools-generation "Direct link to Test tools generation")

Fresh projects include this line in `generator.yaml`, which generates the integration test tools:

```
server_test_tools_path: test/integration/test_tools
```

Delete the line to stop generating test tools. See the [testing documentation](/concepts/testing/get-started) for how the test tools are used.

### Module dependencies[​](#module-dependencies "Direct link to Module dependencies")

Declare module dependencies and optionally assign nicknames for easier reference:

```
modules:  serverpod_auth_core:    nickname: auth  my_custom_module:    nickname: custom
```

This allows you to reference module classes as `module:auth:AuthUser` in your model files. See the [modules documentation](/concepts/server-fundamentals/modules) for more information.

### Shared packages[​](#shared-packages "Direct link to Shared packages")

Shared packages let you define models that can be imported by both server and client code. They depend only on `serverpod_serialization` and are safe to use across your full stack. Configure them in `generator.yaml`:

```
shared_packages:  - ../my_shared_package  - ../another_shared_package
```

Models and the protocol file are generated in each shared package's own directory when you run `serverpod generate` from your server project. See the [shared packages documentation](/concepts/data-and-the-database/models/shared-packages) for setup, usage, and restrictions.

### Custom serializable classes[​](#custom-serializable-classes "Direct link to Custom serializable classes")

Register custom classes for use in your models:

```
extraClasses:  - package:my_shared_package/my_shared_package.dart:CustomClass  - package:my_shared_package/my_shared_package.dart:AnotherCustomClass
```

See the [serialization documentation](/concepts/data-and-the-database/models/custom-serialization) for implementing custom serializable classes.

### Experimental features[​](#experimental-features "Direct link to Experimental features")

Experimental features are off by default and opted into per project with the `experimental_features` key. The current one is `databaseSync`, which enables [`database: sync`](/concepts/data-and-the-database/database/client-side-database#sync-tables-with-the-server) on table models; `all` enables every available feature:

```
experimental_features:  databaseSync: true
```

The `--experimental-features databaseSync` command line flag does the same for a single run.

The `experimental_features` key only affects code generation. Experimental runtime APIs are on `pod.experimental` instead: `shutdownTasks` to [run code on shutdown](/concepts/server-fundamentals/running-your-server#run-code-on-shutdown), and `submitDiagnosticEvent` for [exception monitoring](/concepts/operations/exception-monitoring).

warning

Experimental features may change or be removed in future versions.

## Related[​](#related "Direct link to Related")

-   [Configuration reference](/concepts/lookups/configuration-reference): every option with its environment variable, config key, and default.
-   [Running your server](/concepts/server-fundamentals/running-your-server): how the server starts and how `--mode` is passed.
-   [Database connection](/concepts/data-and-the-database/database/connection): connecting to your database in depth.
-   [Redis](/concepts/operations/redis): enabling Redis, the password, and connecting a GUI.
-   [Configure HTTP calls](/concepts/endpoints-and-apis/configure-http-calls): the API server's response headers and CORS defaults.

[Edit this page](https://github.com/serverpod/serverpod_docs/tree/main/versioned_docs/version-4.1.0/06-concepts/01-server-fundamentals/03-configuration.md)

[

Previous

Running your server

](/concepts/server-fundamentals/running-your-server)[

Next

Modules

](/concepts/server-fundamentals/modules)

-   [How configuration works](#how-configuration-works)
    -   [Defaults](#defaults)
-   [Run modes](#run-modes)
-   [Configure with YAML files](#configure-with-yaml-files)
    -   [Database backends](#database-backends)
-   [Configure in Dart](#configure-in-dart)
-   [Manage secrets](#manage-secrets)
    -   [Built-in secrets](#built-in-secrets)
    -   [Secrets for first-party packages](#secrets-for-first-party-packages)
    -   [Custom secrets](#custom-secrets)
    -   [Access secrets in code](#access-secrets-in-code)
    -   [Secrets in production](#secrets-in-production)
    -   [Passwords on Serverpod Cloud](#passwords-on-serverpod-cloud)
-   [Configure code generation](#configure-code-generation)
    -   [Package types](#package-types)
    -   [Client package path](#client-package-path)
    -   [Test tools generation](#test-tools-generation)
    -   [Module dependencies](#module-dependencies)
    -   [Shared packages](#shared-packages)
    -   [Custom serializable classes](#custom-serializable-classes)
    -   [Experimental features](#experimental-features)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 5.7s)

_Thinking:_

This is 4.1 docs. Need to check 3.4 config env var support: `SERVERPOD_DATABASE_HOST` was introduced when? Let's fetch the 3.4.0 config reference. Also check `SERVERPOD_REDIS_HOST` env overrides in 3.4. The docs 3.4 may have "Environment variables" section. Let me fetch the versioned 3.4 config page.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/3.4.0/concepts/server-fundamentals/configuration"
}
```

**Error:**
```
StatusCode: non 2xx status code (404 GET https://docs.serverpod.dev/3.4.0/concepts/server-fundamentals/configuration)
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/3.4.0/concepts/lookups/configuration-reference"
}
```

**Error:**
```
StatusCode: non 2xx status code (404 GET https://docs.serverpod.dev/3.4.0/concepts/lookups/configuration-reference)
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 9.4s)

_Thinking:_

Let me check the docs structure for 3.4. Perhaps https://docs.serverpod.dev/3.4.0/concepts/configuration or /3.4.0/concepts/server-fundamentals/... Let me search.

Alternatively check the Serverpod changelog for SERVERPOD_DATABASE_HOST. The env config support likely came in 4.0. Let's check the GitHub code at tag 3.4.7 for `SERVERPOD_DATABASE_HOST`. Use webfetch to raw GitHub search? Can't search GitHub code without auth. But can fetch `https://raw.githubusercontent.com/serverpod/serverpod/3.4.7/packages/serverpod/lib/src/config.dart`? Let me try. Actually config parsing in serverpod 3 is `ServerpodConfig` with `fromJson`? The env var support might be in `packages/serverpod/lib/src/config/serverpod_config.dart` or `config.dart`. Let's fetch directory listing via GitHub API? Could use `https://api.github.com/repos/serverpod/serverpod/contents/packages/serverpod/lib/src?ref=3.4.7`. Let's try web fetch.

Actually simpler: search web "SERVERPOD_DATABASE_HOST" serverpod 3.4. Or check changelog for "environment variables" in 4.0. Let me fetch the 4.0 changelog section. But the key decision: if 3.4 doesn't support env var DB config, Cloud deployment would need config/production.yaml with database host hardcoded (which Cloud doesn't provide as a static host), impossible. So either upgrade to 4.x or use `configOverride` to read env vars. Actually in 3.4, I recall Serverpod 3.0 added "environment variable overrides" for config (`SERVERPOD_DATABASE_HOST`, etc.)? Hmm. Serverpod 2 had `SERVERPOD_` env overrides? I think yes: Serverpod has supported `SERVERPOD_DATABASE_HOST`, `SERVERPOD_REDIS_HOST`, `SERVERPOD_API_SERVER_PORT` for a long time (maybe since 1.x). Let me verify with 3.4 docs page paths.

Let me get the 3.4 docs sitemap or search.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/3.4.0/sitemap.xml"
}
```

**Error:**
```
StatusCode: non 2xx status code (404 GET https://docs.serverpod.dev/3.4.0/sitemap.xml)
```

**Tool: websearch**

**Input:**
```json
{
  "query": "Serverpod \"SERVERPOD_DATABASE_HOST\" environment variable configuration",
  "numResults": 5
}
```

**Output:**
```
{
  "search_id": "search_0e21028a86e0d9797aa9216b988b00af",
  "results": [
    {
      "url": "https://docs.serverpod.dev/concepts/lookups/configuration-reference",
      "title": "Configuration reference | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConfiguration reference\n\nEvery configuration option Serverpod's core library reads. Options come from three sources: the config/<run-mode>.yaml files, environment variables, and the ServerpodConfig Dart object. Environment variables override the YAML files. If you pass a ServerpodConfig to the Serverpod constructor, the server ignores the YAML files and environment variables. Command-line options such as --mode still override the values in your ServerpodConfig . For how to choose between them, see Configuration .\n\nRun options ​\n\nSet the run mode, server role, and boot behavior. Declare each per run mode in the matching config/<mode>.yaml , or as an environment variable.\n* Environment variable | Command line option | Config file option | Default | Description\n* SERVERPOD_RUN_MODE | --mode | N/A | development | Configures the mode of the server instance. Valid options are development , staging , production and test .\n* SERVERPOD_SERVER_ID | --server-id | serverId | default | Configures the id of the server instance.\n\n...\n\nServer and services ​\n\nPorts, hosts, and connection settings for the API, Insights, and web servers, the database, Redis, session logs, and future calls, plus a few options that exist only on the Dart config object or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n\n...\n\n* SERVERPOD_WEB_SERVER_SPA_CACHE_CONTROL | N/A | - | The Cache-Control header for SpaRoute responses without a cacheControlFactory . Never applies to the fallback file. See Single-page apps .\n* SERVERPOD_WEB_SERVER_FLUTTER_CACHE_CONTROL | N/A | - | The Cache-Control header for FlutterRoute responses without a cacheControlFactory . See Flutter web .\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n\n...\n\nDart-only options ​\n\nThese options have no environment variable or config-file key. Set them on the ServerpodConfig Dart object passed to the Serverpod constructor.\n* ServerpodConfig field | Default | Description\n* healthCheckInterval | 1m | How often the server collects health metrics. Set to zero to disable health checks.\n* experimentalDiagnosticHandlerTimeout | 30s | The timeout for diagnostic event handlers .\n\nPassword environment variables ​\n\nSecrets are read from config/passwords.yaml and can be overridden per secret through environment variables; see Manage secrets . Two forms exist, and when both are set for the same secret, the SERVERPOD_PASSWORD_* form wins:\n* Environment variable | Overrides passwords-file key\n* SERVERPOD_PASSWORD_<name> | Any secret; the prefix is stripped ( SERVERPOD_PASSWORD_database → database ).\n* SERVERPOD_DATABASE_PASSWORD | database\n* SERVERPOD_SERVICE_SECRET | serviceSecret\n* SERVERPOD_REDIS_PASSWORD | redis"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud/concepts/database",
      "title": "Database | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Database\n\nMost Serverpod apps need to persist data (user accounts, orders, session state). Serverpod Cloud can provision and run a managed PostgreSQL database alongside your project, so you don't have to set up or maintain Postgres yourself. When the database is enabled, Cloud handles provisioning, connection details for your server, migrations on every deploy, and backups. Direct access from tools like psql or a GUI client is opt-in and requires a database user that you create yourself.\nThe managed database runs on PostgreSQL 17 with TLS required, connection pooling on by default, and autoscaling compute.\n\nEnable the database ​\n\nThe database is opt-in. You choose whether to enable it when you create the project, in one of two ways:\n* With serverpod cloud launch . It checks your server config for a database section and presets the database switch on the Console's New project page. You can change it there before you create the project.\n* With serverpod cloud project create . Pass --enable-db , or --no-enable-db if your project doesn't use a database. The flag is required : it has no default, so you must pass one.\nOnce a project is created with the database enabled, the database is provisioned automatically and made available to your server on the next deploy.\n\nHow your server connects ​\n\nWhen the database is enabled, your deployed Serverpod server receives its connection details as environment variables, injected by Cloud:\n* Variable | What it holds\n* SERVERPOD_DATABASE_HOST | The database host\n* SERVERPOD_DATABASE_PORT | The port (5432 by default)\n* SERVERPOD_DATABASE_NAME | The database name\n* SERVERPOD_DATABASE_USER | The server's database user\n* SERVERPOD_DATABASE_REQUIRE_SSL | Always true ; TLS is required\n* SERVERPOD_PASSWORD_database | The server's database password\nYour server reads these through Serverpod's standard configuration. You don't write them into config/production.yaml or passwords.yaml ; Cloud supplies them at runtime. The server's password is managed by the platform and never exposed to you.\n\n...\n\nSecurity ​\n\nThe managed database is built so you don't have to think about credentials in your code or your repo:\n* TLS is required for all connections. Cloud sets SERVERPOD_DATABASE_REQUIRE_SSL to true for your server, and the same applies to direct connections from psql or a GUI client.\n* The server's password is managed by the platform. It's never written into your repo and never shown to you. Your server reads it from the injected environment at runtime.\n* Direct access uses separate database users that you create. The server connects as its own user, not as one you create with serverpod cloud db user create . Revoking or rotating a direct-access password doesn't affect the server."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/data-and-the-database/database/connection",
      "title": "Connection | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConnection\n\nThe connection details and password for the database live in the config directory of your server package, and Serverpod connects using them when the server starts. For local development, no setup is needed by default: the server runs an embedded PostgreSQL and manages it for you. This page is for connecting to a database you run yourself: a local or Docker Postgres, a remote server, or a managed instance such as Cloud SQL or RDS.\n\nConnection details ​\n\nEach environment configuration contains a database keyword that specifies the connection details. For your development build you can find the connection details in the config/development.yaml file.\n... database : host : localhost port : 8090 name : <YOUR_PROJECT_NAME > user : postgres ...\n\n...\n\nConfigure connection pool size ​\n\nBy default, Serverpod uses a connection pool with a maximum of 10 connections to the database. You can customize this limit using the maxConnectionCount setting:\n... database : host : localhost port : 8090 name : <YOUR_PROJECT_NAME > user : postgres maxConnectionCount : 20 ...\nTo allow unlimited connections, set maxConnectionCount to 0 or a negative value. You can also configure this setting via the environment variable SERVERPOD_DATABASE_MAX_CONNECTION_COUNT .\nOn SQLite, this setting controls the number of read-only transactions that can run concurrently. Only one write transaction can run at a time."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/server-fundamentals/configuration",
      "title": "Configuration | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.1.0 Copy as Markdown\nOn this page\n\nConfiguration\n\nConfiguration decides what your server listens on, which database and Redis (an in-memory store Serverpod can use for pub/sub and caching) it connects to, and how it behaves in each run mode, so the same code runs locally, in staging, and in production without edits. Serverpod reads configuration from three sources: the config/<run-mode>.yaml files, environment variables, and a ServerpodConfig Dart object passed to the Serverpod constructor. Environment variables override matching keys in the YAML files, and a Dart object replaces both.\nWith no configuration at all, Serverpod falls back to built-in defaults, so you can start with nothing and add configuration as you need it.\n\nHow configuration works ​\n\nThe YAML files and environment variables combine, and the Dart configuration object replaces both:\n* YAML files ( config/development.yaml , config/staging.yaml , config/production.yaml , config/test.yaml ): the baseline configuration, one file per run mode.\n* Environment variables : override matching YAML values, useful for per-deployment settings and secrets.\n* Dart configuration object : a ServerpodConfig passed to the Serverpod constructor. When you pass one, the server ignores config/<run-mode>.yaml and the SERVERPOD_* configuration variables. Command-line options such as --mode still override its values.\nTo adjust the loaded configuration instead of replacing it, pass a configOverride function to the Serverpod constructor. It receives the configuration from the sources above, and returns the one the server uses.\nFor every available option, its environment variable, config-file key, and default, see the Configuration reference .\n\nDefaults ​\n\nIf no YAML config files exist, no environment variables are configured, and no Dart config is supplied, the server runs with this built-in default: the API server on port 8080 at localhost .\nServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , ) ;\n\nRun modes ​\n\n...\n\ndevelopment : database : 'development_password' redis : 'development_password' serviceSecret : 'development_service_secret' twilioApiKey : 'dev_twilio_key' production : database : 'production_password' redis : 'production_password' serviceSecret : 'production_service_secret' twilioApiKey : 'prod_twilio_key'\nYou can also provide any secret through environment variables .\n\nBuilt-in secrets ​\n\nThe following table shows the built-in secrets that Serverpod uses for its core functionality. These can be configured either through environment variables or by adding the corresponding key in a run-mode or shared section of the passwords file. They are separate from any custom secrets you define.\n* Environment variable | Passwords file | Default | Description\n* SERVERPOD_PASSWORD_database | database | - | The password for the database.\n* SERVERPOD_PASSWORD_serviceSecret | serviceSecret | - | The token used to connect with Insights. Must be at least 20 characters.\n* SERVERPOD_PASSWORD_redis | redis | - | The password for the Redis server.\nEach built-in secret also has a dedicated environment variable: SERVERPOD_DATABASE_PASSWORD , SERVERPOD_SERVICE_SECRET , and SERVERPOD_REDIS_PASSWORD . All environment variables override the passwords file, and the SERVERPOD_PASSWORD_* form wins when both are set.\n\nSecrets for first-party packages ​"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/next/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Configurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\nConfiguration options for the server ​\n\n...\n\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket\n* SERVERPOD_DATABASE_MAX_CONNECTION_COUNT | database.maxConnectionCount | 10 | The maximum number of connections in the database pool. Set to 0 or a negative value for unlimited connections.\n\n...\n\nDefault ​\n\nIf no yaml config files exist, no environment variables are configured and no dart config file is supplied this default configuration will be used.\nServerpodConfig (  \n   apiServer : ServerConfig (  \n     port : 8080 ,  \n     publicHost : 'localhost' ,  \n     publicPort : 8080 ,  \n     publicScheme : 'http' ,  \n ) ,  \n ) ;\n\nCode generation configuration ​"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/3.3.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Configurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\nConfiguration options for the server ​\n\n...\n\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket\n* SERVERPOD_DATABASE_MAX_CONNECTION_COUNT | database.maxConnectionCount | 10 | The maximum number of connections in the database pool. Set to 0 or a negative value for unlimited connections.\n\n...\n\nConfig file example ​\n\nThe config file should be named after the run mode you start the server in and it needs to be placed inside the config directory in the root of the server project. As an example, you have the config/development.yaml that will be used when running in the development run mode.\n\n...\n\nDart config object example ​\n\nTo configure Serverpod in Dart you simply pass an instance of the ServerpodConfig class to the Serverpod constructor. This config will override any environment variables or config files present. The Serverpod constructor is normally used inside the run function in your server.dart file. At a minimum, the apiServer has to be provided."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.3.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.3.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.3.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.8.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.8.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.8.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket\n* SERVERPOD_REDIS_HOST | redis.host | - | The host address of the Redis server\n* SERVERPOD_REDIS_PORT | redis.port | - | The port number for the Redis server\n\n...\n\nDart config object example ​\n\nTo configure Serverpod in Dart you simply pass an instance of the ServerpodConfig class to the Serverpod constructor. This config will override any environment variables or config files present. The Serverpod constructor is normally used inside the run function in your server.dart file. At a minimum, the apiServer has to be provided."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.9.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.9.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.9.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket\n* SERVERPOD_REDIS_HOST | redis.host | - | The host address of the Redis server\n* SERVERPOD_REDIS_PORT | redis.port | - | The port number for the Redis server\n\n...\n\nDart config object example ​\n\nTo configure Serverpod in Dart you simply pass an instance of the ServerpodConfig class to the Serverpod constructor. This config will override any environment variables or config files present. The Serverpod constructor is normally used inside the run function in your server.dart file. At a minimum, the apiServer has to be provided."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.6.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.6.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.6.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n* SERVERPOD_DATABASE_HOST | database.host | - | The host address of the database\n* SERVERPOD_DATABASE_PORT | database.port | - | The port number for the database connection\n* SERVERPOD_DATABASE_NAME | database.name | - | The name of the database\n* SERVERPOD_DATABASE_USER | database.user | - | The user name for database authentication\n* SERVERPOD_DATABASE_SEARCH_PATHS | database.searchPaths | - | The search paths used for all database connections\n* SERVERPOD_DATABASE_REQUIRE_SSL | database.requireSsl | false | Indicates if SSL is required for the database\n* SERVERPOD_DATABASE_IS_UNIX_SOCKET | database.isUnixSocket | false | Specifies if the database connection is a Unix socket\n* SERVERPOD_REDIS_HOST | redis.host | - | The host address of the Redis server\n* SERVERPOD_REDIS_PORT | redis.port | - | The port number for the Redis server\n* SERVERPOD_REDIS_USER | redis.user | - | The user name for Redis authentication\n* SERVERPOD_REDIS_ENABLED | redis.enabled | false | Indicates if Redis is enabled\n* SERVERPOD_MAX_REQUEST_SIZE | maxRequestSize | 524288 | The maximum size of requests allowed in bytes"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 10.8s)

_Thinking:_

Confirmed: env var overrides exist in 3.3, so 3.4.7 supports `SERVERPOD_DATABASE_*`, `SERVERPOD_REDIS_*`, etc. Good.

Now key remaining issue: production.yaml "database" required to exist for Cloud to detect database? The database section exists. Cloud overrides host etc. Good. Also `requireSsl: true` for production. Cloud sets it.

But `config/production.yaml` has `publicHost: api.examplepod.com`. Does Serverpod Cloud override public host? Cloud provides its own URL; the server needs to know its public host to generate config (e.g., `AppConfigRoute` returns api URL). How does Cloud handle `publicHost`? In Serverpod Cloud, the server runs with `--mode=production` and the `SERVERPOD_API_SERVER_PUBLIC_HOST` env probably set? Let me check Cloud custom domains docs / maybe "the server automatically gets the URL". Search docs. Actually, in the launch guide, it says default URLs are `<project>.serverpod.space`, API `<project>.api.serverpod.space`. The server config's publicHost must be set to that. Does Cloud set SERVERPOD_API_SERVER_PUBLIC_HOST? Likely yes. Let me check via search of Cloud docs on "SERVERPOD_API_SERVER_PUBLIC_HOST" or "publicHost". Let me fetch custom domains and maybe deployment config.

Also: Cloud web URL serves the Flutter app at root — in Serverpod 4, web server may be part of api? Wait in 4.x config still has webServer. So Cloud Web maps webServer.

Also, the app's `/app` route: If Cloud's Web host serves `webServer` on port 8082, then our root `web/pages/index.html` (Jaspr or landing) works and `/app/*` Flutter works. The docs's "Flutter web app loads at the root" is about new projects whose template serves Flutter at `/`; but our setup can differ. Still need to verify that Cloud's Web URL maps to web server. Read "Deploy your first app" says Web URL. And the CDN doc mentions "Flutter web build, a Jaspr site, or plain static files" — so yes, Cloud serves the web server.

Now check `config/production.yaml` publicHost: Cloud likely rewrites public host. Search.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/custom-domains"
}
```

**Output:**
```
  Custom domains | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Custom domains

When you're ready to ship your project to real users, you might want it reachable at `yourapp.com` rather than the `*.serverpod.space` defaults. Custom domains attach a domain you own to your project's web, API, or Insights surface, with automatic TLS and DNS-based verification.

Every Serverpod Cloud project gets default domains automatically. A project named `my-app` is reachable at:

Service

Default domain

Web

`https://my-app.serverpod.space/`

API

`https://my-app.api.serverpod.space/`

Insights

`https://my-app.insights.serverpod.space/`

## Attach a custom domain[​](#attach-a-custom-domain "Direct link to Attach a custom domain")

A custom domain points at one of the three surfaces:

-   `web`: a Flutter web app or other content served by Serverpod's web server
-   `api`: Serverpod endpoints your Flutter app or other clients call
-   `insights`: the Serverpod Insights app (typically on a separate subdomain like `insights.example.com`)

Attach the domain to your project, specifying the target surface:

```
serverpod cloud domain attach example.com --target web
```

After attaching, the CLI prints DNS records to add at your registrar. For an apex domain like `example.com`, two records are needed:

```
Custom domain attached successfully!Complete the setup by adding the records to your DNS configuration┌────────────────────────────────────────────────────────────────────────────────┐│ Record type | Domain name | Value                                              ││ ------------+-------------+--------------------------------------------------- ││ ANAME       | example.com | my-app.api.serverpod.space                         ││ TXT         | example.com | scloud-verify=cbe1f5cc-f176-4183-8142-e0585ad15999 ││                                                                                │└────────────────────────────────────────────────────────────────────────────────┘
```

Each row corresponds to one record to add at your registrar:

-   **ANAME (or ALIAS)**: points the domain at the Serverpod Cloud surface
-   **TXT**: carries a verification token that Serverpod Cloud uses to confirm ownership

Plain CNAMEs aren't valid at the zone apex, which is why ANAME or ALIAS is required there. [Cloudflare](https://www.cloudflare.com/), [Route 53](https://aws.amazon.com/route53/), and [DNSimple](https://dnsimple.com/) all support ANAME or ALIAS records.

For a subdomain like `api.example.com`, a single CNAME record is enough:

```
Custom domain attached successfully!Complete the setup by adding the records to your DNS configuration┌────────────────────────────────────────────────────────────┐│ Record type | Domain name     | Value                      ││ ------------+-----------------+--------------------------- ││ CNAME       | api.example.com | my-app.api.serverpod.space ││                                                            │└────────────────────────────────────────────────────────────┘
```

## Verify the domain[​](#verify-the-domain "Direct link to Verify the domain")

DNS changes typically propagate within a few minutes but can take up to 24 hours. Once propagation completes, Serverpod Cloud verifies the domain automatically.

To force a verification attempt without waiting:

```
serverpod cloud domain verify example.com
```

A successful verification triggers TLS certificate provisioning, which usually completes within the hour. Certificates are renewed automatically.

Once the domain is active, point your client at the new URL:

```
final client = Client('https://api.example.com');
```

## List custom domains[​](#list-custom-domains "Direct link to List custom domains")

Show the domains attached to a project, with their target surface and verification status:

```
serverpod cloud domain list
```

## Detach a custom domain[​](#detach-a-custom-domain "Direct link to Detach a custom domain")

Remove a custom domain from a project. The CLI prompts for confirmation before removing:

```
serverpod cloud domain detach example.com
```

## Troubleshooting[​](#troubleshooting "Direct link to Troubleshooting")

**Verification fails.** DNS records may be missing or still propagating. Confirm the records are in place at your registrar, then wait up to 24 hours and retry with `serverpod cloud domain verify <domain>`.

**Can't attach the domain.** The domain is already attached to another project. Detach it from that project first.

**TLS certificate errors.** TLS provisioning is still in progress. It usually completes within an hour of successful verification.

## Related[​](#related "Direct link to Related")

-   [CLI reference: `domain` command](/cloud/reference/cli/commands/domain)

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/custom-domains.md)

[

Previous

Passwords, secrets, and environment variables

](/cloud/concepts/passwords-secrets-env-vars)[

Next

Database

](/cloud/concepts/database)

-   [Attach a custom domain](#attach-a-custom-domain)
-   [Verify the domain](#verify-the-domain)
-   [List custom domains](#list-custom-domains)
-   [Detach a custom domain](#detach-a-custom-domain)
-   [Troubleshooting](#troubleshooting)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: websearch**

**Input:**
```json
{
  "query": "Serverpod Cloud publicHost SERVERPOD_API_SERVER_PUBLIC_HOST automatically configured serverpod.space",
  "numResults": 5
}
```

**Output:**
```
{
  "search_id": "search_2e5959f1ffec9c35e18d1eca3b6b0907",
  "results": [
    {
      "url": "https://docs.serverpod.dev/concepts/lookups/configuration-reference",
      "title": "Configuration reference | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConfiguration reference\n\nEvery configuration option Serverpod's core library reads. Options come from three sources: the config/<run-mode>.yaml files, environment variables, and the ServerpodConfig Dart object. Environment variables override the YAML files. If you pass a ServerpodConfig to the Serverpod constructor, the server ignores the YAML files and environment variables. Command-line options such as --mode still override the values in your ServerpodConfig . For how to choose between them, see Configuration .\n\nRun options ​\n\nSet the run mode, server role, and boot behavior. Declare each per run mode in the matching config/<mode>.yaml , or as an environment variable.\n* Environment variable | Command line option | Config file option | Default | Description\n\n...\n\nServer and services ​\n\nPorts, hosts, and connection settings for the API, Insights, and web servers, the database, Redis, session logs, and future calls, plus a few options that exist only on the Dart config object or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n\n...\n\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/server-fundamentals/configuration",
      "title": "Configuration | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.1.0 Copy as Markdown\nOn this page\n\nConfiguration\n\nConfiguration decides what your server listens on, which database and Redis (an in-memory store Serverpod can use for pub/sub and caching) it connects to, and how it behaves in each run mode, so the same code runs locally, in staging, and in production without edits. Serverpod reads configuration from three sources: the config/<run-mode>.yaml files, environment variables, and a ServerpodConfig Dart object passed to the Serverpod constructor. Environment variables override matching keys in the YAML files, and a Dart object replaces both.\nWith no configuration at all, Serverpod falls back to built-in defaults, so you can start with nothing and add configuration as you need it.\n\nHow configuration works ​\n\nThe YAML files and environment variables combine, and the Dart configuration object replaces both:\n* YAML files ( config/development.yaml , config/staging.yaml , config/production.yaml , config/test.yaml ): the baseline configuration, one file per run mode.\n\n...\n\nDefaults ​\n\nIf no YAML config files exist, no environment variables are configured, and no Dart config is supplied, the server runs with this built-in default: the API server on port 8080 at localhost .\nServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , ) ;\n\nRun modes ​"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/next/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Configurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\nConfiguration options for the server ​\n\n...\n\n* SERVERPOD_APPLY_REPAIR_MIGRATION | --apply-repair-migration | applyRepairMigration | false | Configures if repair migrations should be applied when the server starts.\nThese can be separately declared for each run mode in the corresponding yaml file ( development.yaml , staging.yaml , production.yaml and testing.yaml ) or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n\n...\n\nConfig file example ​\n\nThe config file should be named after the run mode you start the server in and it needs to be placed inside the config directory in the root of the server project. As an example, you have the config/development.yaml that will be used when running in the development run mode.\napiServer :  \n port : 8080  \n publicHost :  localhost  \n publicPort : 8080  \n publicScheme :  http  \n   \n insightsServer :  \n port : 8081  \n publicHost :  localhost  \n publicPort : 8081  \n publicScheme :  http  \n   \n webServer :  \n port : 8082  \n publicHost :  localhost  \n publicPort : 8082  \n publicScheme :  http"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.3.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.3.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.3.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n\n...\n\nConfig file example ​\n\nThe config file should be named after the run mode you start the server in and it needs to be placed inside the config directory in the root of the server project. As an example, you have the config/development.yaml that will be used when running in the development run mode.\napiServer : port : 8080 publicHost : localhost publicPort : 8080 publicScheme : http insightsServer : port : 8081 publicHost : localhost publicPort : 8081 publicScheme : http webServer : port : 8082 publicHost : localhost publicPort : 8082 publicScheme : http database : host : localhost port : 8090 name : database_name user : postgres redis : enabled : false host : localhost port : 8091 maxRequestSize : 524288 sessionLogs : persistentEnabled : true consoleEnabled : true\n\nPasswords file example ​\n\n...\n\nServerpod ( args , Protocol ( ) , Endpoints ( ) , config : ServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , insightsServer : ServerConfig ( port : 8081 , publicHost : 'localhost' , publicPort : 8081 , publicScheme : 'http' , ) , webServer : ServerConfig ( port : 8082 , publicHost : 'localhost' , publicPort : 8082 , publicScheme : 'http' , ) , ) , ) ;\n\nDefault ​\n\nIf no yaml config files exist, no environment variables are configured and no dart config file is supplied this default configuration will be used.\nServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , ) ;\nEdit this page\nPrevious Migrations Next Caching"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.6.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.6.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.6.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\nConfiguration options for the server ​\n\nThese can be separately declared for each run mode in the corresponding yaml file ( development.yaml , staging.yaml , production.yaml and testing.yaml ) or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n\n...\n\nConfig file example ​\n\nThe config file should be named after the run mode you start the server in and it needs to be placed inside the config directory in the root of the server project. As an example, you have the config/development.yaml that will be used when running in the development run mode.\napiServer : port : 8080 publicHost : localhost publicPort : 8080 publicScheme : http insightsServer : port : 8081 publicHost : localhost publicPort : 8081 publicScheme : http webServer : port : 8082 publicHost : localhost publicPort : 8082 publicScheme : http database : host : localhost port : 8090 name : database_name user : postgres redis : enabled : false host : localhost port : 8091 maxRequestSize : 524288 sessionLogs : persistentEnabled : true consoleEnabled : true"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/3.4.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 3.4.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 3.4.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_APPLY_REPAIR_MIGRATION | --apply-repair-migration | applyRepairMigration | false | Configures if repair migrations should be applied when the server starts.\nThese can be separately declared for each run mode in the corresponding yaml file ( development.yaml , staging.yaml , production.yaml and testing.yaml ) or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.9.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.9.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.9.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\n...\n\n* SERVERPOD_APPLY_REPAIR_MIGRATION | --apply-repair-migration | applyRepairMigration | false | Configures if repair migrations should be applied when the server starts.\nThese can be separately declared for each run mode in the corresponding yaml file ( development.yaml , staging.yaml , production.yaml and testing.yaml ) or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n\n...\n\nDart config object example ​\n\nTo configure Serverpod in Dart you simply pass an instance of the ServerpodConfig class to the Serverpod constructor. This config will override any environment variables or config files present. The Serverpod constructor is normally used inside the run function in your server.dart file. At a minimum, the apiServer has to be provided."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/deployments/deploy-to-serverpod-cloud",
      "title": "Deploy to Serverpod Cloud | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Deploy to Serverpod Cloud\n\nServerpod Cloud is the recommended way to host a Serverpod server. It is a fully managed platform built and maintained by the Serverpod team, designed specifically for Serverpod apps. You deploy in minutes with zero configuration, and there is no VM setup, container configuration, or infrastructure to orchestrate yourself.\ninfo\nYour first project includes a one-month free trial, with no credit card required.\nCloud manages the production infrastructure for you:\n\n...\n\nYou deploy with the Serverpod CLI:\n1. Run serverpod cloud launch . It installs the Cloud CLI if needed. If you aren't signed in, it opens your browser so you can sign in.\n2. For a new project, the Cloud Console opens so you can create it. The database setting is pre-filled from your server's config.\n3. When prompted, select the custom passwords from config/passwords.yaml to copy to Cloud. The command then deploys your server.\n4. Set any other secrets (API keys, OAuth credentials) with serverpod cloud password set . Then run serverpod cloud deploy so the server picks them up.\nSee the Serverpod Cloud documentation for the full walkthrough, including secrets, custom domains, and logs.\nTo run the server yourself instead, see Custom hosting .\nEdit this page\nPrevious Model reference Next Choosing a strategy"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/2.8.0/concepts/configuration",
      "title": "Configurations | Serverpod",
      "publish_date": null,
      "excerpts": [
        "This is documentation for Serverpod 2.8.0 , which is no longer actively maintained.\nFor up-to-date documentation, see the latest version (4.0.0).\nVersion: 2.8.0 Copy as Markdown\nOn this page\n\nConfigurations\n\nServerpod can be configured in a few different ways. The minimum required settings to provide is the configuration for the API server. If no settings are provided at all, the default settings for the API server are used.\n\nConfiguration options ​\n\nThere are three different ways to configure Serverpod: with environment variables, via yaml config files, or by supplying the dart configuration object to the Serverpod constructor. The environment variables take precedence over the yaml configurations but both can be used simultaneously. The dart configuration object will override any environment variable or config file. The tables show all available configuration options provided in the Serverpod core library.\n\nConfiguration options for the server ​\n\nThese can be separately declared for each run mode in the corresponding yaml file ( development.yaml , staging.yaml , production.yaml and testing.yaml ) or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n* SERVERPOD_INSIGHTS_SERVER_PORT | insightsServer.port | - | The port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST | insightsServer.publicHost | - | The public host address of the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_PORT | insightsServer.publicPort | - | The public port number for the Insights server\n* SERVERPOD_INSIGHTS_SERVER_PUBLIC_SCHEME | insightsServer.publicScheme | - | The public scheme (http/https) for the Insights server\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n\n...\n\nConfig file example ​\n\nThe config file should be named after the run mode you start the server in and it needs to be placed inside the config directory in the root of the server project. As an example, you have the config/development.yaml that will be used when running in the development run mode.\napiServer : port : 8080 publicHost : localhost publicPort : 8080 publicScheme : http insightsServer : port : 8081 publicHost : localhost publicPort : 8081 publicScheme : http webServer : port : 8082 publicHost : localhost publicPort : 8082 publicScheme : http database : host : localhost port : 8090 name : database_name user : postgres redis : enabled : false host : localhost port : 8091 maxRequestSize : 524288 sessionLogs : persistentEnabled : true consoleEnabled : true consoleLogFormat : json futureCallExecutionEnabled : true futureCall : concurrencyLimit : 5 scanInterval : 2000"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/cloud",
      "title": "Introduction | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Serverpod Cloud is a managed hosting platform for Serverpod apps with predictable pricing. You deploy your app with the Serverpod Cloud CLI or via CI/CD, and use the web console for account setup, billing, and project dashboards.\nWith the Cloud CLI set up , launch your first project with one command. No Dockerfile, no container config, no infrastructure setup:\nserverpod cloud launch\n\nWhat Serverpod Cloud manages ​\n\n* Runtime and scaling. Your app runs on a production runtime that scales as traffic grows.\n* Networking and TLS. Encrypted endpoints, certificates, and load balancing work without configuration.\n* Managed Postgres (optional). Cloud can provision a production-grade Postgres database with automatic migrations and backups.\n* File storage . Cloud provisions a private and a public storage with every project, ready for the files your app uploads at runtime.\n* Secrets and environment variables . Manage sensitive values through the Cloud CLI. Values are encrypted where applicable.\n* Custom domains . Attach your own domain. TLS certificates are provisioned and renewed. Cloud hosts both your backend and a preconfigured website for your Flutter web app.\n\n...\n\n* Pub/sub and caching. Supported through the Serverpod framework with a third-party Redis service you connect yourself. See Use Redis for PubSub and caching for the typical setup.\n\nWhere to go next ​\n\n* Set up the Cloud CLI to get the CLI ready and authenticate it.\n* Deploy your first app for a guided first deploy.\nEdit this page\nNext Set up the Cloud CLI"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 29.3s)

_Thinking:_

I have enough to write a deployment plan. But a few more project checks:

- The client package pubspec may need `serverpod_serialization` only; no issue.
- Check that `.fvmrc` pins SDK. FVM could conflict with Cloud's dart version selection. It uses pubspec constraint if no `.tool-versions`. `.fvmrc` isn't read by Cloud. Fine.
- Check `pubspec.yaml` workspace lists `namma_kahoot_client` etc., but actual dirs are `namma_quiz_client` etc. That's a bug — `dart pub get` at root would fail. Wait: workspace root pubspec references `namma_kahoot_client`, `namma_kahoot_server`, `namma_kahoot_jaspr`, but directories are `namma_quiz_*`. This means the workspace config is broken. The server's pubspec has `resolution: workspace`, which requires the root workspace to include the server. So `dart pub get` in server would fail? Let me verify. Also client package name is namma_kahoot_client. Directory rename might be in progress. This is a deployment blocker: Cloud builds the server from the workspace root? The scloud.yaml goes in the server dir; the upload includes workspace packages. The root pubspec is inconsistent → build fails.

Let me run `dart --version` and `dart pub get --dry-run`? That might modify things. I can run `dart pub get`? It may write .dart_tool. Avoid modifying. But checking `dart analyze` might be heavy. Let's check git status to see if the dirs were renamed recently. Also list client pubspec.

Also note `namma_quiz_server/pubspec.yaml` description name is `namma_kahoot_server`, and root workspace lists `namma_kahoot_server` (wrong path). So yes broken.

Let me check git status and client pubspec quickly, plus whether `namma_kahoot_client` path maybe exists as junction? `Get-ChildItem` showed only namma_quiz_*. Confirm.

Also check for `.scloudignore`/`scloud.yaml` (none). And CI config.

Let me also verify Serverpod CLI version installed and whether `scloud` is available, and Dart/Flutter versions. This informs actionable steps.

**Tool: bash**

**Input:**
```json
{
  "command": "git status --short; Write-Output \"---LOG---\"; git log --oneline -5; Write-Output \"---TOOLS---\"; dart --version 2>&1; flutter --version 2>&1 | Select-Object -First 2; serverpod --version 2>&1; scloud --version 2>&1"
}
```

**Output:**
```
---LOG---
7c8f868 chore: refactor project structure to Namma Quiz
64152fd chore: refactored app name from Namma Kahoot to Namma Quiz
a3a10c8 chore: added "built with jaspr" badge from the package and removed the manually svg badge
e169d7e Merge branch 'main' of https://github.com/KeerthiVasan-ai/namma_kahoot
c618185 chore : added README.md
---TOOLS---
Dart SDK version: 3.13.5 (stable) (Tue Sep 29 01:00:52 2026 -0700) on "windows_x64"
  ╔════════════════════════════════════════════════════════════════════════════╗
  ║ A new version of Flutter is available!                                     ║
serverpod : The term 'serverpod' is not recognized as the name of a cmdlet, function, script file, or operable 
program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:167
+ ... 1; flutter --version 2>&1 | Select-Object -First 2; serverpod --versi ...
+                                                         ~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (serverpod:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
 
scloud : The term 'scloud' is not recognized as the name of a cmdlet, function, script file, or operable program. 
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:193
+ ... &1 | Select-Object -First 2; serverpod --version 2>&1; scloud --versi ...
+                                                            ~~~~~~
    + CategoryInfo          : ObjectNotFound: (scloud:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
 

```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-Content namma_quiz_client\\pubspec.yaml; Write-Output \"---FVM---\"; Get-Content .fvmrc; Write-Output \"---CI---\"; Get-ChildItem .github -Recurse -File -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName"
}
```

**Output:**
```
name: namma_kahoot_client
description: Starting point for a Serverpod client.

environment:
  sdk: '^3.8.0'

resolution: workspace

dependencies:
  serverpod_auth_idp_client: 3.4.7
  serverpod_client: 3.4.7
---FVM---
{
  "flutter": "3.41.1"
}
---CI---

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 25.5s)

_Thinking:_

Wait git status is empty? It printed nothing for status, so clean. The latest commit "refactor project structure to Namma Quiz" renamed directories but the root workspace paths are still `namma_kahoot_*`. That's a real bug. Let me verify `dart pub get` fails. Running it could modify `.dart_tool` and `pubspec.lock` but that's acceptable? It's a read-ish operation but writes. We shouldn't modify without need, but verifying a build blocker is valuable. We can check `Get-ChildItem` for `namma_kahoot_*` (likely none). The root pubspec clearly references nonexistent dirs. So deployment will fail.

Also note `.fvmrc` Flutter 3.41.1 (Dart maybe 3.11?). But local Dart 3.13.5 outside FVM. Cloud uses pubspec `^3.8.0`, which allows highest supported (3.13?) per docs: supported up to 3.13. But Serverpod 3.4.7 may not support Dart 3.13. Serverpod 3.4.7's constraint is `sdk: ^3.8.0`, so Dart 3.13 is allowed. Cloud defaults to highest ≤ constraint → 3.13. That could be fine, but the lockfile? Cloud build likely runs `dart pub get`; workspace resolution. Serverpod 3.4.7 with Dart 3.13 might have issues (e.g., analyzer). But to be safe, pin dartSdk to 3.8 or 3.9 in scloud.yaml for 3.4.7. Flutter 3.41.1 ships Dart 3.11? Let's see: Flutter 3.41 ~ Dart 3.11. But local installed Dart is 3.13.5. Hmm. Cloud's Flutter not used for server build (only app publishing). For the Flutter web build script, pre-deploy runs locally (not on Cloud) per hooks — actually `serverpod run flutter_build` in pre_deploy runs locally before upload, so it uses local Flutter (FVM 3.41.1). Cloud build compiles the server with chosen Dart.

The plan should include pinning `dartSdk: "3.8"`? But 3.8 is default only if no constraint; our constraint `^3.8.0` selects highest supported 3.13. Might be OK but risky for Serverpod 3.4.7. Better pin to 3.8 or the version Serverpod 3.4.7 was tested with (3.8). I'll recommend pinning `dartSdk: "3.8"` in scloud.yaml unless upgrading to 4.x.

But wait: package `serverpod_auth_idp_server 3.4.7` requires Dart ^3.8.0; works on 3.13 probably.

Now, is Serverpod 3.4.7 deployable to Cloud at all? The Cloud CLI prerequisite is "Serverpod CLI version 4.0 or later", but the deployed app can likely be 3.x since Cloud just builds the Dart project. However, `serverpod cloud launch` adds a pre-deploy `serverpod generate` hook; that runs locally using your installed Serverpod CLI (which would be 4.x if using serverpod 4). Running `serverpod generate` from 4.x CLI on a 3.4.7 project might fail or alter generated code. But you can use standalone `scloud` (no serverpod CLI) and skip hooks or set pre_deploy manually. Still, Cloud runtime may have compatibility details.

Given the docs' project-wide 4.x emphasis and 3.4 EOL, I should present two options: (A) upgrade server to 4.x (recommended), or (B) deploy 3.4.7 as-is with pinned Dart 3.8 and standalone scloud. But is 3.4.7 actually supported by Cloud runtime? Serverpod Cloud's runtime is the Serverpod framework runtime; the app brings its own package. It likely works. But auth passwords auto-provisioned names differ between 3 and 4? Cloud docs mention "Auth (passwords for serverpod_auth_idp_server)" — 3.4.7 uses serverpod_auth_idp_server, same. Good.

Let me check if there's a strict "minimum supported serverpod version" in cloud docs. Search "minimum" on cloud pages? Let me fetch the log/deployment page or CLI project create. Maybe not documented. I'll note the uncertainty and recommend verifying with `scloud deploy --wet-run` early.

Now, more critical production-readiness issues in code to flag in the plan:

1. Workspace path mismatch (root pubspec) — blocker.
2. `getPassword` / JWT keys: Cloud auto-provisions keys, okay. Locally no passwords.yaml means JWT signing key missing? `JwtConfigFromPasswords()` probably reads `jwtHmacSha256Key` and `jwtP256PrivateKey`; without them it throws at startup. Maybe dev has generated passwords? No file. So local server may already fail; Cloud will supply. Fine, but note.
3. Email verification codes only logged → registration won't work for real users. Need an email provider (Resend/SendGrid/SMTP) and use `serverpod email`? Serverpod 3 has `serverpod_auth_idp_server` with email. Plan: implement `sendRegistrationVerificationCode` / `sendPasswordResetCode` with an email service + secret.
4. Jaspr hardcoded `http://localhost:8080` and invalid relative import → web client will point to localhost in production. Must parameterize and fix import.
5. Flutter web `getServerUrl`: served config at `/app/assets/assets/config.json` returns `pod.config.apiServer.apiUrl` built from `publicHost`/`publicPort`. Need Cloud to inject API public host, or hardcode via build dart-define. Also build with `--base-href /app/ --wasm`; Cloud's Web host should serve at `/app`. Need to ensure the Flutter web app's config route path matches: `getServerUrl` from serverpod_flutter looks at `assets/config.json`? Let me check the actual implementation in the installed package to ensure the route. It's `assets/config.json` in the app bundle → fetched from `/app/assets/config.json`. But the route is `/app/assets/assets/config.json` (double assets) — probably because `getServerUrl` uses `Uri.base.resolve('assets/config.json')`? Hmm. Let me inspect the serverpod_flutter package source. But whatever, the route exists explicitly. We should verify.

Actually maybe `getServerUrl()` fetches `assets/assets/config.json` (Serverpod's standard). Let me check quickly in pub cache. `flutter pub deps` no. Search in `%LOCALAPPDATA%\Pub\Cache`. Let me grep.

6. `session.messages` / Redis: Must enable Redis on Cloud via Upstash TLS (Frankfurt). Without Redis and with >1 podlet, real-time events won't reach all clients. Also `createStream` requires Redis when multiple servers; with one podlet, in-memory works. Starter/Growth min 1. But autoscaling could spin up multiple podlets. Use Redis. Also note Redis is required for reliable redirect/caching. Plan.
7. `startTime` in DB and time-based scoring using server clock — multi-podlet clocks are same; fine. Not a deployment issue.
8. `Quiz.creatorId = 1` seeding each start: if FK constraints? Models don't define FK relations (just int), so no constraint. Fine. But seeding runs on every cold start and only if quizzes empty. Acceptable, but better as a migration/seed script; and `createSession` after `pod.start()` in production with scale-to-zero okay. Also if DB not ready? fine.
9. Security: `createGame(quizId, hostId)` trusts client; `submitAnswer` can be called multiple times per player per question (no unique answer record) → cheating and score inflation. For production launch, add answers table with unique(playerId, questionId) and validate host identity. Also no auth checks on host endpoints. This is both product and security. Deployment plan should include hardening before public launch.
10. Data: no FK indexes? indexes exist. `player.name` no unique per game. Fine.
11. `showLeaderboard` / `finishGame` ordering; fine.

12. `config/production.yaml` currently `redis.enabled: false` — Cloud env `SERVERPOD_REDIS_ENABLED=true` overrides. Also `database` host examplepod — overridden by cloud env. `publicHost` examplepod — does Cloud override? This is important for `AppConfigRoute` returning correct API URL and for auth redirect URLs. Cloud likely sets `SERVERPOD_API_SERVER_PUBLIC_HOST` automatically (it must, to serve correct URLs). But local config `api.examplepod.com` would be wrong if not. I need to confirm. Let me search docs or Cloud code. Maybe the Cloud console project page shows "Environment" injection list. Search "SERVERPOD_API_SERVER_PUBLIC_HOST" cloud. The prior search didn't show cloud-specific. Let me inspect serverpod_cloud repo docs raw markdown for "publicHost" or "SERVERPOD_API". Use GitHub search via webfetch to GitHub API code search needs auth. But raw docs are at https://raw.githubusercontent.com/serverpod/serverpod_cloud/main/docs/docs/cloud_docs/... Could fetch and grep? We can use webfetch to the deployments doc and look for "public". Let me fetch the raw markdown for deployments page, then search. Actually the rendered page said "Configure what's included" and got truncated. Let me fetch the raw file and look.

Also, the web server route in Flutter: `AppConfigRoute` requires `pod.config.apiServer` with correct public host. Another approach: use relative URL for web client? Serverpod Client requires absolute URL. Or build Flutter web with `--dart-define=SERVER_URL=https://<project>.api.serverpod.space` (getServerUrl picks dart-define first). That avoids relying on publicHost injection. For mobile app publishing, Cloud auto-sets SERVER_URL. For Jaspr, inject at build. That's robust. We can also set `SERVERPOD_API_SERVER_PUBLIC_HOST` variable ourselves to the default/custom domain. That's straightforward: `serverpod cloud variable set SERVERPOD_API_SERVER_PUBLIC_HOST "namma-quiz.api.serverpod.space"`, plus port/scheme. But if Cloud already does it, no harm (overrides same value). Plan should include verifying/setting.

Let me fetch raw deployments doc for env override info.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://raw.githubusercontent.com/serverpod/serverpod_cloud/main/docs/docs/cloud_docs/concepts/deployments.md"
}
```

**Error:**
```
StatusCode: non 2xx status code (404 GET https://raw.githubusercontent.com/serverpod/serverpod_cloud/main/docs/docs/cloud_docs/concepts/deployments.md)
```

**Tool: bash**

**Input:**
```json
{
  "command": "$p = Join-Path $env:LOCALAPPDATA 'Pub\\Cache\\hosted\\pub.dev'; Get-ChildItem $p -Directory -Filter 'serverpod_flutter-*' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName"
}
```

**Output:**
```
(no output)
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 9.0s)

_Thinking:_

Pub cache path maybe `%LOCALAPPDATA%\Pub\Cache` or `%APPDATA%\Pub\Cache`. Let me find. Also the raw doc path has `docs/docs/cloud_docs/concepts/deployments.md` per edit link—but 404 maybe branch is `main` and repo private? The docs said github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs. Try master. Not critical.

Let me grep for getServerUrl in pub cache.

**Tool: bash**

**Input:**
```json
{
  "command": "$roots = @(\"$env:LOCALAPPDATA\\Pub\\Cache\", \"$env:APPDATA\\Pub\\Cache\", \"$env:USERPROFILE\\AppData\\Local\\Pub\\Cache\"); foreach ($r in $roots) { if (Test-Path $r) { Write-Output $r; Get-ChildItem $r -Directory -Filter 'serverpod_flutter-*' | Select-Object -ExpandProperty FullName } }"
}
```

**Output:**
```
(no output)
```

**Tool: grep**

**Input:**
```json
{
  "pattern": "getServerUrl|assets/config.json|assets/assets/config.json",
  "include": "*.dart",
  "path": "D:\\StudioProjects\\NammaFlutter\\namma-quiz"
}
```

**Output:**
```
Found 3 matches
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\server.dart:
  Line 44:     '/app/assets/assets/config.json',


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\main.dart:
  Line 28:   // Otherwise, the server URL is fetched from the assets/config.json file or

  Line 30:   final serverUrl = await getServerUrl();

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 12.6s)

_Thinking:_

Pub cache not present? Maybe FVM. Let me find `serverpod_flutter` anywhere under user profile quickly using glob? Use PowerShell Get-ChildItem on common pub cache: `C:\Users\Keerthivasan\AppData\Local\Pub\Cache\hosted\pub.dev`. Test path.

Actually not critical. The route `/app/assets/assets/config.json` strongly suggests `getServerUrl` fetches `assets/assets/config.json` relative to base href `/app/`. Standard Serverpod template for Flutter web uses:

```dart
pod.webServer.addRoute(
  StaticRoute.file(File('web/app/index.html')), '/app/*' ...
```

Hmm.

Let me focus. I have enough for a robust plan. But the user asked "plan for it" — they want a deployment plan, likely a written plan, not necessarily code changes. Given the instruction to be concise but this is a planning task, a structured plan is appropriate. Should I create a file? They said "plan for it", not "write a plan file". I should answer in chat with a concrete plan, including blockers found in the repo, ordered phases, commands, env vars, and risks.

Before writing, check `.scloudignore` and whether `.gitignore` would exclude needed files. Cloud respects `.gitignore` and `.scloudignore`; `web/app` is gitignored but built in pre_deploy and must be uploaded. If `.gitignore` excludes `web/app`, will `scloud deploy --show-files` include it? Docs say "This is useful for verifying your .gitignore and .scloudignore files are working as expected" and files can be "ignored" → ignored files are NOT uploaded. So `# Ignore the flutter web app directory web/app` means the built Flutter web app will NOT be uploaded unless `.scloudignore` re-includes it or the deploy runs the build on Cloud. This is a critical gotcha. In Serverpod 3 template, `web/app` is gitignored because it's generated. For Cloud, the pre-deploy hook builds it locally, but packaging respects `.gitignore`, so it'd be excluded. Hmm, does scloud use .gitignore to exclude? Yes likely. The deploy docs mention `.gitignore` and `.scloudignore` both. You can add a negation in `.scloudignore`? `.scloudignore` probably supports `!web/app/**`. Need to verify. Or move the Flutter build output somewhere not gitignored. Alternatively, Cloud may have a build step for Flutter web? For Serverpod 4, the template includes a `cloud` deploy workflow; their `flutter_build` script copies into `web/app`, and they probably adjusted `.gitignore` or `.scloudignore` accordingly. Let me check the "Ship non-Dart files" guide and deployments "Configure what's included" section (truncated earlier). Fetch the deployments page for the inclusion rules. Also check `.scloudignore` syntax.

Let me fetch deployments page again and look at "Configure what's included".

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/concepts/deployments#configure-whats-included"
}
```

**Output:**
```
  Deployments | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Deployments

When you ship a code change to Serverpod Cloud, `serverpod cloud deploy` builds and rolls out a new version of your server. Cloud switches traffic automatically to the latest successful deploy, keeping the previous one live if a build fails.

## Deploy your app[​](#deploy-your-app "Direct link to Deploy your app")

info

If this is the first time you're deploying this project to Cloud, follow [Deploy your first app](/cloud/getting-started/launch) first. It walks through `serverpod cloud launch`, which creates the project before the first deploy.

Deploy your project to Cloud:

```
serverpod cloud deploy
```

The command also takes these flags:

-   `-v` (`--verbose`): Shows detailed output.
-   `--dart-version`: Overrides the Dart SDK used at build time.
-   `--concurrency=<N>`: Sets how many files are zipped in parallel during packaging (default `5`).

The CLI packages your project, uploads it, and waits for the new version to go live. Once the deployment is live, your project is reachable at its default URLs:

-   Web: `https://<project-id>.serverpod.space/`
-   API: `https://<project-id>.api.serverpod.space/`
-   Insights: `https://<project-id>.insights.serverpod.space/`

To use your own URL instead, see [Custom domains](/cloud/concepts/custom-domains).

note

Your web content is served through a [CDN](/cloud/concepts/cdn). Each successful deploy clears its cached copies, so the new version is served without waiting for the old copies to expire.

To regenerate code or run other tasks before each deploy, configure a pre-deploy hook. See [Deployment hooks](/cloud/concepts/deployment-hooks).

## Check deployment status[​](#check-deployment-status "Direct link to Check deployment status")

Watch the latest deployment as it runs:

```
serverpod cloud status deployment show
```

The command tracks the deployment through its three lifecycle stages and updates each line as it progresses. When complete:

```
Tracking my-app deployment 4583d0a1-3d0a-400e-a9a5-9880da6abc94(Press Ctrl+C to exit)Upload successful.Cloud build successful.Rollout successful. 🚀
```

The three stages are **Upload** (your project package reaches Cloud), **Cloud build** (Cloud builds the container), and **Rollout** (Cloud prepares the infrastructure and the new version starts serving requests).

List recent deployments:

```
serverpod cloud status deployment list
```

The list shows deploy IDs alongside status and timestamps:

```
# | Project | Deploy Id                            | Status  | Started (local)     | Finished (local)    | Info--+---------+--------------------------------------+---------+---------------------+---------------------+-----------------------------------0 | my-app  | 4583d0a1-3d0a-400e-a9a5-9880da6abc94 | SUCCESS | 2026-06-03 13:41:21 | 2026-06-03 13:46:08 |1 | my-app  | 73e66b41-64fc-4920-b6ef-4918cc6ceca1 | FAILURE | 2026-06-02 15:19:37 | 2026-06-02 15:20:34 | User build FAILURE - see build log
```

Inspect a specific deployment by its ID:

```
serverpod cloud status deployment show <deployment-id>
```

Stream the build log for a deployment that failed during the build stage:

```
serverpod cloud build log
```

## Validate before deploying[​](#validate-before-deploying "Direct link to Validate before deploying")

A wet run performs every step except the deployment itself, leaving the running app untouched:

```
serverpod cloud deploy --wet-run
```

Preview the file tree that will be uploaded, with ignored files marked:

```
serverpod cloud deploy --show-files
```

Combine the two flags to inspect what will be uploaded without deploying:

```
serverpod cloud deploy --wet-run --show-files
```

Save the package to a local zip (useful for CI inspection or air-gapped environments):

```
serverpod cloud deploy --output deployment.zip --wet-run
```

## Configure what's included[​](#configure-whats-included "Direct link to Configure what's included")

A `.scloudignore` file in your project root controls which files are packaged. The syntax mirrors `.gitignore`.

By default, every file ignored by `.gitignore` is also excluded from the deployment. To include files that `.gitignore` excludes, prefix the pattern with `!` in your `.scloudignore`:

.scloudignore

```
# Exclude a specific file/specific_file.txt# Exclude all log files*.log# Exclude a directory and its contents/large_dir/# Include generated code, even if ignored by .gitignore!lib/src/generated/
```

The Serverpod Cloud CLI may generate intermediate files under `.scloud/` directories. In a workspace project, the CLI adds this pattern to the workspace root's `.gitignore` for you. In any other project, add it yourself so the files stay out of version control:

.gitignore

```
# scloud deployment generated files should not be committed to git**/.scloud/
```

Verify your ignore patterns:

```
serverpod cloud deploy --wet-run --show-files
```

## Troubleshooting[​](#troubleshooting "Direct link to Troubleshooting")

**Build failure.** Stream the build log and look for lines beginning with `ERROR:` or `FAILED:`:

```
serverpod cloud build log
```

Common causes are missing dependencies in `pubspec.yaml` or compile errors in your code.

**Package resolution failure.** Update your `pubspec.yaml` (run `dart pub get` locally to verify), then redeploy.

For a step-by-step walkthrough, see [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy).

## Related[​](#related "Direct link to Related")

-   [Deployment hooks](/cloud/concepts/deployment-hooks) for pre- and post-deploy automation.
-   [Private dependencies](/cloud/reference/private-dependencies) for private package access during the build.
-   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files) for shipping static assets like configuration and templates.
-   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions) for shipping every push.
-   [Content delivery and caching](/cloud/concepts/cdn) for how the CDN caches your web content and clears it on every deploy.
-   [Scale to zero](/cloud/concepts/scale-to-zero) for how an idle project stops its server and starts it again on the next request.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/concepts/deployments.md)

[

Previous

Deploy your first app

](/cloud/getting-started/launch)[

Next

Logs

](/cloud/concepts/logs)

-   [Deploy your app](#deploy-your-app)
-   [Check deployment status](#check-deployment-status)
-   [Validate before deploying](#validate-before-deploying)
-   [Configure what's included](#configure-whats-included)
-   [Troubleshooting](#troubleshooting)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/cloud/guides/ship-non-dart-files"
}
```

**Output:**
```
  Ship non-Dart files with your server | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/)

-   [Next](/next)
-   [4.1.0](/)
-   [4.0.0](/4.0.0)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/cloud)
-   [Get started](/cloud/getting-started/installation)
    
    -   [Set up the Cloud CLI](/cloud/getting-started/installation)
    -   [Deploy your first app](/cloud/getting-started/launch)
-   [Concepts](/cloud/concepts/deployments)
    
    -   [Deployments](/cloud/concepts/deployments)
    -   [Logs](/cloud/concepts/logs)
    -   [Passwords, secrets, and environment variables](/cloud/concepts/passwords-secrets-env-vars)
    -   [Custom domains](/cloud/concepts/custom-domains)
    -   [Database](/cloud/concepts/database)
    -   [Database backups](/cloud/concepts/database-backups)
    -   [Personal access tokens](/cloud/concepts/personal-access-tokens)
    -   [Content delivery and caching](/cloud/concepts/cdn)
    -   [Deployment hooks](/cloud/concepts/deployment-hooks)
    -   [Storage](/cloud/concepts/storage)
    -   [Scale to zero](/cloud/concepts/scale-to-zero)
    -   [App publishing](/cloud/concepts/app-publishing)
-   [Guides](/cloud/guides/redis)
    
    -   [Use Redis for PubSub and caching](/cloud/guides/redis)
    -   [Ship non-Dart files with your server](/cloud/guides/ship-non-dart-files)
    -   [Deploy from CI with GitHub Actions](/cloud/guides/deploy-from-ci-with-github-actions)
    -   [Recover from a failed deploy](/cloud/guides/recover-from-a-failed-deploy)
    -   [Migrate a self-hosted database](/cloud/guides/migrate-a-self-hosted-database)
-   [Reference](/cloud/reference/dart-sdk-versions)
    
-   [Serverpod Framework](/)

Copy as Markdown

On this page

# Ship non-Dart files with your server

Bundle non-Dart files (configuration, templates, CSV data, binary blobs) with your server code on Cloud. Place them in an `assets/` folder at the project root and read them with `./assets/<path>` at runtime.

## Before you start[​](#before-you-start "Direct link to Before you start")

-   A Serverpod server project on disk (alongside `lib/` and `bin/`).
-   The Serverpod Cloud CLI set up and authenticated. See [Set up the Cloud CLI](/cloud/getting-started/installation).

## Add files to your project[​](#add-files-to-your-project "Direct link to Add files to your project")

Place files in an `assets/` folder at the root of your server project, alongside `lib/` and `bin/`:

```
my_server/├── assets/│   ├── config/│   │   └── settings.json│   ├── templates/│   │   └── email_template.html│   └── data/│       └── initial_data.csv├── lib/├── bin/└── pubspec.yaml
```

Then deploy:

```
serverpod cloud deploy
```

Cloud zips your project directory and includes every file that isn't excluded from the deploy package (see [Control what gets uploaded](#control-what-gets-uploaded) below). The `assets/` name is the Serverpod naming convention for this folder. You can call it anything, but the rest of this guide assumes `assets/`.

To preview which files Cloud will upload before deploying:

```
serverpod cloud deploy --wet-run --show-files
```

## Read an asset at runtime[​](#read-an-asset-at-runtime "Direct link to Read an asset at runtime")

Use Dart's `dart:io` library and a path relative to the server's working directory:

```
import 'dart:io';Future<String> readSettings() async {  final file = File('./assets/config/settings.json');  return file.readAsString();}
```

The path is relative to the directory the server runs from, not to the source file. Use `./assets/<path>` everywhere; absolute paths break across local and deployed environments.

For binary data (images, PDFs, archives), use `readAsBytes()` instead of `readAsString()`.

## Read common file types[​](#read-common-file-types "Direct link to Read common file types")

### Load JSON configuration[​](#load-json-configuration "Direct link to Load JSON configuration")

Parse a JSON file into a `Map` on startup or per request:

```
import 'dart:io';import 'dart:convert';Future<Map<String, dynamic>> loadConfig() async {  final file = File('./assets/config/app_config.json');  final contents = await file.readAsString();  return jsonDecode(contents) as Map<String, dynamic>;}
```

### Render a template[​](#render-a-template "Direct link to Render a template")

Read an HTML or text template, then interpolate values:

```
import 'dart:io';Future<String> loadWelcomeEmail({required final String name}) async {  final template = await File('./assets/templates/welcome_email.html').readAsString();  return template.replaceAll('{{name}}', name);}
```

### Read CSV data[​](#read-csv-data "Direct link to Read CSV data")

For tabular data, read line by line:

```
import 'dart:io';Future<List<String>> readCsv() async {  return File('./assets/data/initial_data.csv').readAsLines();}
```

For more complex parsing, the [`csv` package](https://pub.dev/packages/csv) handles quoting and escaping.

## Control what gets uploaded[​](#control-what-gets-uploaded "Direct link to Control what gets uploaded")

Two files affect what's in the deployment:

-   **`.gitignore`.** Anything excluded here is also excluded from the deploy.
-   **`.scloudignore`.** Cloud-specific exclusions. Same syntax as `.gitignore`. Use the `!` prefix to opt files back in that `.gitignore` excluded.

Hidden files (those starting with `.`) are excluded by default. If you need them shipped, opt back in via `.scloudignore`. See [Deployments](/cloud/concepts/deployments) for the full picture of the deployment package.

tip

Asset files count toward your deployment package size. Large folders slow uploads and the Cloud build step. For files larger than a few megabytes that don't need to live in version control, consider an external object store and reading them from the network instead.

## Troubleshooting[​](#troubleshooting "Direct link to Troubleshooting")

**File not found at runtime.** The path is relative to the server's working directory, not to the source file. Use `./assets/<path>`. Verify the file is in the deployment with `serverpod cloud deploy --wet-run --show-files` before debugging at runtime.

**Asset missing from the deployment.** Check `.gitignore` and `.scloudignore`. Patterns like `*.json` exclude every `.json` file unless you opt them back in with `!assets/**`.

## Related[​](#related "Direct link to Related")

-   [Deployments](/cloud/concepts/deployments) for what's in the deployment package and how `.scloudignore` works.
-   [CLI reference: `deploy` command](/cloud/reference/cli/commands/deploy) for all deploy flags.

[Edit this page](https://github.com/serverpod/serverpod_cloud/tree/main/docs/docs/cloud_docs/guides/ship-non-dart-files.md)

[

Previous

Use Redis for PubSub and caching

](/cloud/guides/redis)[

Next

Deploy from CI with GitHub Actions

](/cloud/guides/deploy-from-ci-with-github-actions)

-   [Before you start](#before-you-start)
-   [Add files to your project](#add-files-to-your-project)
-   [Read an asset at runtime](#read-an-asset-at-runtime)
-   [Read common file types](#read-common-file-types)
    -   [Load JSON configuration](#load-json-configuration)
    -   [Render a template](#render-a-template)
    -   [Read CSV data](#read-csv-data)
-   [Control what gets uploaded](#control-what-gets-uploaded)
-   [Troubleshooting](#troubleshooting)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 13.5s)

_Thinking:_

Confirmed: `.gitignore` exclusion of `web/app` must be negated in `.scloudignore` (`!web/app/`). Also hidden files excluded by default.

Also note: `web/pages/index.html` is tracked; `web/static` - is it tracked? Let me check `namma_quiz_server/web` contents: only `pages/index.html` was listed in the earlier depth-2 find. The index references `/static/css/style.css`, but no static dir in repo? Let me check. `web` might only have pages. So the landing page CSS is missing (404). Also Flutter build output `web/app` is gitignored. And `web/app/index.html` doesn't exist locally, so the server logs warning. Deployment must build it.

Also `.scloudignore` should include `!web/app/` and maybe `!web/static/`. And `config/passwords.yaml` is gitignored, which is fine (Cloud secrets).

Now: Should I write plan as a markdown file? The user said "plan for it". In this environment, creating a deployment plan doc could be useful, but the guidelines say don't proactively create docs. I'll answer in chat with the plan. However, the plan is long; the user asked for planning, so detail is warranted. But system says "You MUST answer concisely with fewer than 4 lines of text ... unless user asks for detail." Planning inherently asks for detail. I'll provide a structured plan, moderately detailed but not bloated.

Wait—should I ask clarifying questions? Key decisions: Starter vs Growth, whether to upgrade to Serverpod 4, whether to host Jaspr, custom domain, email provider. I could present the plan with recommended choices and call out decisions. The question tool is available. But the user asked for a plan; I can give a plan with assumptions and a short list of decisions. I think a good approach: plan with phases, blockers, and ask 2-3 decision questions at the end. Actually to be helpful, maybe ask upfront? The instruction: "If the user asks how to approach something, do your best to answer their question first." So provide plan now.

Let me verify a couple more things to make the plan accurate:

1. Root workspace broken: I should confirm the dirs `namma_kahoot_*` don't exist. Already listing shows only `namma_quiz_*`. So yes.

2. Is the client package's path import in jaspr wrong? Let me read all jaspr lib files for `SERVER` usage. And check if `namma_quiz_jaspr` builds. Running `dart pub get` at root would fail due to workspace. We can note it.

3. Check `namma_quiz_server/web/static` existence. Also check `namma_quiz_server/lib/src/endpoints/admin_endpoint.dart` (may have auth). And auth endpoints.

4. Check the Flutter app UI uses `client` global and streaming; important for Redis/scale-to-zero. Quick grep for `gameStream`, `connectionTimeout`.

Let me gather in parallel.

**Tool: bash**

**Input:**
```json
{
  "command": "Write-Output \"---SERVER WEB TREE---\"; Get-ChildItem namma_quiz_server\\web -Recurse | Select-Object -ExpandProperty FullName; Write-Output \"---JASPR LIB---\"; Get-ChildItem namma_quiz_jaspr\\lib -Recurse -File | Select-Object -ExpandProperty FullName; Write-Output \"---ROOT DIRS---\"; Get-ChildItem -Directory | Select-Object -ExpandProperty Name"
}
```

**Output:**
```
---SERVER WEB TREE---
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\pages
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\static
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\pages\index.html
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\static\css
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\web\static\css\style.css
---JASPR LIB---
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\admin_dashboard.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\app.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\countdown_timer.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\home_page.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\host_dashboard.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\components\player_board.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\client_provider.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\game_provider.dart
---ROOT DIRS---
.idea
.vscode
namma_quiz_client
namma_quiz_flutter
namma_quiz_jaspr
namma_quiz_server

```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-Content namma_quiz_server\\lib\\src\\endpoints\\admin_endpoint.dart; Write-Output \"---AUTH---\"; Get-Content namma_quiz_server\\lib\\src\\auth\\email_idp_endpoint.dart -TotalCount 40; Get-Content namma_quiz_server\\lib\\src\\auth\\jwt_refresh_endpoint.dart -TotalCount 30"
}
```

**Output:**
```
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AdminEndpoint extends Endpoint {
  /// Create a new Quiz
  Future<Quiz> createQuiz(Session session, Quiz quiz) async {
    return await Quiz.db.insertRow(session, quiz);
  }

  /// Get all quizzes
  Future<List<Quiz>> getQuizzes(Session session) async {
    return await Quiz.db.find(session);
  }

  /// Get a single quiz by ID
  Future<Quiz?> getQuiz(Session session, int id) async {
    return await Quiz.db.findById(session, id);
  }

  /// Add a Question to a Quiz
  Future<Question> addQuestion(Session session, Question question) async {
    return await Question.db.insertRow(session, question);
  }

  /// Get questions for a quiz
  Future<List<Question>> getQuestionsForQuiz(Session session, int quizId) async {
    return await Question.db.find(
      session,
      where: (t) => t.quizId.equals(quizId),
      orderBy: (t) => t.orderIndex,
    );
  }

  /// Delete a Quiz
  Future<void> deleteQuiz(Session session, int quizId) async {
    // Delete questions first
    await Question.db.deleteWhere(session, where: (t) => t.quizId.equals(quizId));
    // Delete quiz
    await Quiz.db.deleteWhere(session, where: (t) => t.id.equals(quizId));
  }
}
---AUTH---
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {}
import 'package:serverpod_auth_idp_server/core.dart';

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
class JwtRefreshEndpoint extends RefreshJwtTokensEndpoint {}

```

**Tool: grep**

**Input:**
```json
{
  "pattern": "gameStream|connectionTimeout|streamingConnectionTimeout|Client\\(",
  "include": "*.dart",
  "path": "D:\\StudioProjects\\NammaFlutter\\namma-quiz"
}
```

**Output:**
```
Found 18 matches
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\generated\endpoints.dart:
  Line 593:         'gameStream': _i1.MethodStreamConnector(

  Line 594:           name: 'gameStream',

  Line 614:               ) => (endpoints['kahoot'] as _i5.KahootEndpoint).gameStream(


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\lib\src\protocol\client.dart:
  Line 331:   _i3.Stream<_i8.GameEvent> gameStream(

  Line 337:         'gameStream',

  Line 438:   Client(

  Line 445:     Duration? streamingConnectionTimeout,

  Line 446:     Duration? connectionTimeout,

  Line 459:          streamingConnectionTimeout: streamingConnectionTimeout,

  Line 460:          connectionTimeout: connectionTimeout,


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\client_provider.dart:
  Line 5: final client = Client('http://localhost:8080/');


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\lib\providers\game_provider.dart:
  Line 130:     _subscription = client.kahoot.gameStream(pin, isHost).listen((event) {


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\main.dart:
  Line 32:   client = Client(serverUrl)


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\test\integration\test_tools\serverpod_test_tools.dart:
  Line 765:   _i3.Stream<_i8.GameEvent> gameStream(

  Line 776:               method: 'gameStream',

  Line 782:               methodName: 'gameStream',


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\lib\src\endpoints\kahoot_endpoint.dart:
  Line 33:   Stream<GameEvent> gameStream(Session session, String pin, bool isHost) async* {


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\kahoot\providers\game_provider.dart:
  Line 132:     _subscription = client.kahoot.gameStream(pin, isHost).listen((event) {

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 12.6s)

_Thinking:_

One important hidden issue: AdminEndpoint has no authentication — anyone can create/delete quizzes. For a public deployment, that's dangerous. Plan: add auth checks (serverpod auth) or scope to admin.

Also `Quiz.creatorId` seeded = 1 but there's no user row in auth table (creatorId isn't a FK, fine).

Now, let me verify the workspace failure by running `dart pub get`? It would modify lockfile. Maybe run `dart pub get --dry-run`? Dart supports `--dry-run`? `dart pub get --dry-run` exists? Yes, `dart pub get --dry-run` (I think). Let me try in server dir; but resolution: workspace requires root. If root is broken, it errors. This confirms blocker. Also `dart analyze` may be too heavy. Let's run `dart pub get --dry-run` at root with timeout 120s.

Actually, `dart pub get --dry-run` will still resolve & maybe write? It says "Report what dependencies would change but don't change any". Use it.

Also, `serverpod` CLI not installed; `scloud` not installed. Plan includes install via `dart install serverpod_cloud_cli` and `dart install serverpod_cli`? For Serverpod 3, `dart pub global activate serverpod_cli 3.4.7` (the `serverpod` CLI). But Cloud CLI can be standalone.

Let me run the dry-run check.

**Tool: bash**

**Input:**
```json
{
  "command": "dart pub get --dry-run 2>&1",
  "workdir": "D:\\StudioProjects\\NammaFlutter\\namma-quiz",
  "timeout": 180000
}
```

**Output:**
```
dart : No workspace packages matching `namma_kahoot_client`.
At line:1 char:1
+ dart pub get --dry-run 2>&1
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (No workspace pa...kahoot_client`.:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
That was included in the workspace of `.\pubspec.yaml`.

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 24.1s)

_Thinking:_

Confirmed blocker. Good.

Now, decide the plan. Let me think about upgrade-to-4 question more. Serverpod 3.4.7 with Cloud:
- Cloud CLI works standalone (`dart install serverpod_cloud_cli`), doesn't require serverpod CLI.
- `launch` suggests pre_deploy `serverpod generate` and `serverpod run flutter_build`. If the local `serverpod` is 4.x, running `serverpod generate` on 3.4.7 project may use the 4.x CLI but depends on the project's serverpod version? The CLI invokes the project's generator via `dart run serverpod_cli`? Actually `serverpod generate` uses the globally installed CLI version. It would be 4.x and may generate incompatible code for 3.4.7. Better to install Serverpod CLI 3.4.7 (`dart pub global activate serverpod_cli 3.4.7`) and use `scloud` for deployment. However, Cloud docs say the Cloud CLI requires Serverpod CLI 4.0+ only if invoked via `serverpod cloud`; standalone scloud avoids that.
- Cloud runtime: Does it set `SERVERPOD_DATABASE_*` for 3.4.7? Yes, env overrides supported since 2.x. Auth auto-provisioned password names: `SERVERPOD_PASSWORD_<name>`; Cloud sets `serverpod_auth_idp_server` keys. In 3.4.7, the auth keys are `jwtHmacSha256Key`, `jwtP256PrivateKey`, `emailIdp`? Cloud docs say it auto-provisions "serverpod_auth_idp_server keys". Likely compatible.
- Future calls not used.
- Cloud provides file storage in 4.x; 3.4.7 uses serverpod_cloud_storage? Not used. Fine.
- Managed DB Postgres 17; Serverpod 3.4 supports PG 16+? 3.4 likely supports PG 16. PG 17 probably fine.
- Main concern: Cloud's runtime may assume Serverpod 4 config names (e.g., `SERVERPOD_WEB_SERVER_*`)? Those existed in 3.x too.

I'd recommend upgrading to Serverpod 4.x as a separate pre-deployment task because 3.4 is EOL; but it's a substantial migration (auth config, web server routes, `Serverpod` constructor, `serverpod_auth_idp` APIs). The safest short-term: deploy 3.4.7 first (if Cloud accepts it) to get live, then plan 4.x upgrade. But there is a risk Cloud's build uses Dart 3.13 incompatible with Serverpod 3.4.7. Pin `dartSdk: "3.8"` in scloud.yaml. Need `serverpod` 3.4.7's `sdk: ^3.8.0` allows 3.8.

Actually, would scloud's Cloud build use `pubspec.lock`? It likely runs `dart pub get` with the resolution. Dart 3.8 + lockfile generated by 3.13? Lockfile format is stable, but packages may require newer SDK. `serverpod 3.4.7` fine.

Another option: Serverpod 4 migration isn't strictly required. I'll present as "Option A (recommended for launch speed): stay on 3.4.7, pin Dart 3.8, use standalone scloud; Option B: upgrade to 4.1 before deploying (cleaner long-term, but code changes)". Given the user says "we are going to deploy it on serverpod cloud. plan for it", likely wants concrete steps. I'll recommend: first attempt 3.4.7 deployment (low lift) — but validate with `scloud deploy --wet-run` early. Actually `--wet-run` doesn't build in Cloud; it just packages. To truly validate, do the first deploy to a Starter/trial project and see. If build fails due to version, upgrade.

Hmm, but if Cloud's Cloud CLI 1.x requires Serverpod 4? The "installation" doc says "The Serverpod CLI, version 4.0 or later" — that's the CLI used to invoke cloud, but `scloud` standalone has no such requirement. Still, maybe the Cloud build detects `serverpod` version and requires >=4.0? Unlikely but possible. I'll flag "verify first deploy early; if Cloud rejects 3.4.7, upgrade".

Let me also consider the "web app at root" vs `/app`:
- Cloud Web URL → web server. Our root serves a custom landing page that links to `/app`. That's fine and matches "website option".
- The Flutter build script copies to `server/web/app` and base href `/app/`. Good.
- `AppConfigRoute` at `/app/assets/assets/config.json` needs correct API URL. The simplest robust fix: add `--dart-define=SERVER_URL=https://<project>.api.serverpod.space` to the `flutter build web` command in the pubspec script (or remove config dependency). But `getServerUrl` reads dart-define first. However, for local dev, the script isn't used. We can update the script to use `--dart-define=SERVER_URL=$API_URL`? Serverpod pubspec scripts don't interpolate env easily. Better: keep config route and ensure `publicHost` is right. Does Cloud override publicHost? Let me find out definitively. Maybe the Cloud runtime sets `SERVERPOD_API_SERVER_PUBLIC_HOST`; I can set it explicitly myself in Cloud variables as part of the plan, overriding examplepod.com. That guarantees it. Similarly set `SERVERPOD_WEB_SERVER_PUBLIC_HOST`, `SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST` and ports/schemes. But wait: if Cloud's public host includes the project ID and custom domains, setting variables is fine. For custom domain, update variable. For `AppConfigRoute`, only API URL matters. So set:
  - `SERVERPOD_API_SERVER_PUBLIC_HOST=<id>.api.serverpod.space`
  - `SERVERPOD_API_SERVER_PUBLIC_PORT=443`
  - `SERVERPOD_API_SERVER_PUBLIC_SCHEME=https`
  - similarly web/insights (not strictly needed, but for consistency and auth?)
This avoids relying on docs' unstated injection. But maybe Cloud already sets these to correct values and our static production.yaml would otherwise override? Env overrides YAML, so good.

Better yet, modify production.yaml publicHost to the real domain after project creation, so local builds and config route use it. But custom domain may change. Env vars are better. I'll include both: set env vars in Cloud and update production.yaml for non-Cloud use.

Jaspr:
- `client_provider.dart` imports `../../../namma_quiz_client/lib/namma_kahoot_client.dart` (relative) and hardcodes localhost. Fix to `package:namma_kahoot_client/namma_kahoot_client.dart` and use `const String.fromEnvironment('SERVER_URL', defaultValue: 'http://localhost:8080/')`. Then build with `jaspr build` and copy to server `web/` at root? Or serve Jaspr at `/` by replacing `web/pages/index.html`. But Jaspr is a SPA client that uses routes; needs its built files. Let's inspect `web/index.html` and `main.dart` for the Jaspr project. The user may want Jaspr UI live. Currently the server's root landing page is a simple HTML. The README says the web UI is Jaspr, but the server serves its own landing at root and Flutter at /app. Deployment plan should decide: host Jaspr at root (replace landing) or keep it separate. For a Kahoot platform with host dashboard, Jaspr likely has the host UI. Let me inspect Jaspr app routes to see. If Jaspr is the real web UI, we should build it into `server/web/` at root. But `jaspr build` output includes `index.html`, `main.dart.js`, assets. We can copy `build/jaspr/*` to `server/web/jaspr/` and add a `SpaRoute` at `/app2`? But root index.html is the current landing; we could keep the landing at root and host Jaspr at `/host` via SpaRoute. Simpler: keep root landing (links to Flutter) and add Jaspr at `/host`? The existing landing has "Host a Game" linking to `/app?role=host` (Flutter). So Jaspr is maybe unused/alternate. 

Let me inspect the Jaspr app.dart and main.dart to see intent. Also check Flutter routes. This determines effort.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-Content namma_quiz_jaspr\\web\\main.dart; Write-Output \"---APP---\"; Get-Content namma_quiz_jaspr\\lib\\components\\app.dart; Write-Output \"---INDEX---\"; Get-Content namma_quiz_jaspr\\web\\index.html -TotalCount 40; Write-Output \"---HOME---\"; Get-Content namma_quiz_jaspr\\lib\\components\\home_page.dart -TotalCount 60"
}
```

**Output:**
```
import 'package:jaspr/client.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import '../lib/components/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
---APP---
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'home_page.dart';
import 'host_dashboard.dart';
import 'player_board.dart';
import 'admin_dashboard.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'nk', [
      div(classes: 'shell', [
        Router(routes: [
          Route(path: '/', title: 'Namma Quiz', builder: (context, state) => const HomePage()),
          Route(path: '/play', title: 'Player - Namma Quiz', builder: (context, state) => const PlayerBoard()),
          Route(path: '/host', title: 'Host - Namma Quiz', builder: (context, state) => const HostDashboard()),
          Route(path: '/admin', title: 'Admin - Namma Quiz', builder: (context, state) => const AdminDashboard()),
        ]),
      ]),
    ]);
  }
}
---INDEX---
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Namma Quiz</title>
  <meta name="description" content="The Ultimate Real-Time Quiz Experience">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
  <link rel="stylesheet" href="styles/main.css">
  <script defer src="main.dart.js"></script>
</head>
<body>
  <div id="jaspr-root"></div>
</body>
</html>
---HOME---
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'scr on', [
      div(classes: 'hero-bg bg-pattern', [
        div(
          attributes: {'style': 'margin-bottom:16px;'},
          [
            div(
              attributes: {
                'style': 'font-size:42px;font-weight:900;color:#fff;text-shadow:2px 2px 4px rgba(0,0,0,0.3);',
              },
              [Component.text('Namma Quiz')],
            ),
          ],
        ),
        div(classes: 't-hero mb8', [Component.text('Quizzes for everyone.')]),
        div(
          classes: 't-sub mb16',
          attributes: {'style': 'font-size:15px;max-width:500px;margin:0 auto 24px;'},
          [Component.text('Real-time multiplayer quizzes �?" host, play, and share. Built in the open.')],
        ),
        div(
          attributes: {'style': 'display:flex;gap:12px;max-width:250px;margin:0 auto;width:100%;'},
          [
            button(
              classes: 'btn',
              attributes: {
                'style':
                    'flex:1;font-size:16px;font-weight:700;padding:16px;background:#ffffff;color:var(--kahoot-purple);border-radius:4px;box-shadow:0 4px 0 rgba(0,0,0,0.2);',
              },
              events: {'click': (e) => Router.of(context).push('/host')},
              [i(classes: 'ti ti-player-play', []), Component.text(' Host a quiz')],
            ),
          ],
        ),
      ]),

      div(classes: 'content-wrap p20', [
        div(
          attributes: {'style': 'position:relative;max-width:400px;margin:20px auto;padding:40px 20px;'},
          [
            // Floating background shapes
            div(
              classes: 'float-anim',
              attributes: {'style': 'position:absolute;top:20px;left:-20px;'},
              [
                i(
                  classes: 'ti ti-triangle-filled',
                  attributes: {'style': 'font-size:48px;color:var(--kahoot-red);transform:rotate(-15deg);'},
                  [],
                ),
              ],
            ),

```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem namma_quiz_flutter\\lib -Recurse -File | Select-Object -ExpandProperty FullName"
}
```

**Output:**
```
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\main.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\admin\admin_dashboard_screen.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\kahoot\host_dashboard_screen.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\kahoot\kahoot_home_screen.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\kahoot\player_board_screen.dart
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\lib\features\kahoot\providers\game_provider.dart

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 31.1s)

_Thinking:_

Jaspr is a full SPA (home/host/player/admin). The server's `web/pages/index.html` is a separate simple landing. The README says Jaspr is the web UI. For deployment, we should host Jaspr as the main web app. Jaspr `mode: client` builds to static files. We can add to server `web/` and serve at root via `SpaRoute` (for client-side routes `/play`, `/host`, `/admin`). But `SpaRoute` needs the build dir. Then the simple landing page could be dropped.

However, `pod.webServer.addRoute(StaticRoute.file(File('web/pages/index.html')), '/')` currently serves landing. We could change to serve Jaspr build. Need build step to copy `namma_quiz_jaspr/build/jaspr` → `namma_quiz_server/web/jaspr`. And add:
```dart
pod.webServer.addRoute(SpaRoute(Directory('web/jaspr'), fallback: 'index.html'), '/*');
```
But routes `/app/*` need precedence. Route matching order matters; add Flutter `/app/*` before SpaRoute catch-all. Also `/static/*`, `/app/assets/...` before catch-all. This is a code change. Alternatively serve Jaspr at `/web/*` and link from landing. But the SPA router uses absolute paths (`/host`), so it needs root.

Given the user asked for a plan, I'll include this as a phase decision: "which web client is primary?" and recommend Jaspr at root (`/`), Flutter at `/app`, and remove/keep landing. Or simpler: launch with Flutter at `/app` + landing, defer Jaspr. Hmm.

Actually the root landing is nice and functional; the Jaspr app is feature-rich. I'd recommend hosting Jaspr at `/` and Flutter at `/app` (mobile/desktop target too). But that's more work. The plan can have "minimum first deploy" (Flutter + landing) and "full" (Jaspr at root). But the server's config route for Flutter is `/app/assets/assets/config.json`; fine.

Need to verify Flutter web `getServerUrl` behavior for web at `/app`. Let me find the package. Pub cache may be in FVM's cache? `Get-ChildItem C:\Users\Keerthivasan -Directory -Filter ".pub-cache"`. Or use `flutter pub deps`? Let's locate `serverpod_flutter` on disk with `Get-ChildItem -Path C:\Users\Keerthivasan -Recurse -Directory -Filter serverpod_flutter-3.4.7` — expensive. Try `C:\Users\Keerthivasan\AppData\Local\Pub\Cache\hosted\pub.dev` existence. Earlier no output because Test-Path failed silently? It printed nothing, meaning no such path. FVM store might be at `%LOCALAPPDATA%\Pub\Cache` but not. Maybe `C:\Users\Keerthivasan\fvm\versions\3.41.1\bin\cache`? Pub cache is usually `%LOCALAPPDATA%\Pub\Cache` on Windows. Let me check `dart pub cache` location? `dart pub cache list` maybe. Not essential.

Let me check the Flutter app's `assets/config.json`:

**Tool: bash**

**Input:**
```json
{
  "command": "Get-Content namma_quiz_flutter\\assets\\config.json; Write-Output \"---PUBCACHE---\"; dart pub cache list 2>&1 | Select-Object -First 5; Write-Output \"---ENV---\"; $env:PUB_CACHE; $env:LOCALAPPDATA"
}
```

**Output:**
```
...output truncated...

Full output saved to: C:\Users\Keerthivasan\.local\share\opencode\tool-output\tool_1f53bcbbe001N7V88Xr1Ph6PEX

---ENV---
D:\Caches\.pub-cache
C:\Users\Keerthivasan\AppData\Local

```

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem namma_quiz_flutter\\lib\\features\\kahoot\\providers\\game_provider.dart | ForEach-Object { Get-Content $_.FullName -TotalCount 40 }"
}
```

**Output:**
```
import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/legacy.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import '../../../main.dart';

class GameState {
  final GameSession? session;
  final Player? currentPlayer;
  final List<Player> players;
  final List<Question> questions;
  final GameEvent? lastEvent;
  final bool isConnected;
  final Map<int, int> answerCounts; // optionIndex -> count
  final int? submittedAnswerIndex; // answer chosen by this player
  final int? earnedPoints; // points awarded for current question
  final int? correctOptionIndex; // revealed correct answer
  final List<dynamic> leaderboard; // top players list
  final List<dynamic> podium; // top 3 players list

  GameState({
    this.session,
    this.currentPlayer,
    this.players = const [],
    this.questions = const [],
    this.lastEvent,
    this.isConnected = false,
    this.answerCounts = const {},
    this.submittedAnswerIndex,
    this.earnedPoints,
    this.correctOptionIndex,
    this.leaderboard = const [],
    this.podium = const [],
  });

  GameState copyWith({
    GameSession? session,
    Player? currentPlayer,
    List<Player>? players,
    List<Question>? questions,

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 7.1s)

_Thinking:_

The first command output truncated due to pub cache list huge. Let me read config.json directly and check the pub cache for serverpod_flutter.

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\namma_quiz_flutter\\assets\\config.json"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\assets\config.json</path>
<type>file</type>
<content>
1: {
2:     "apiUrl": "http://localhost:8080"
3: }

(End of file - total 3 lines)
</content>
```

**Tool: bash**

**Input:**
```json
{
  "command": "$d = \"D:\\Caches\\.pub-cache\\hosted\\pub.dev\"; if (Test-Path $d) { Get-ChildItem $d -Directory -Filter 'serverpod_flutter-*' | Select-Object -ExpandProperty FullName } else { Write-Output \"no cache dir\" }"
}
```

**Output:**
```
(no output)
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 10.0s)

_Thinking:_

Hmm, pub cache dir exists but no serverpod_flutter? Maybe FVM uses its own cache? Let me list top-level dirs in D:\Caches\.pub-cache. Not crucial.

The Flutter app's `assets/config.json` has localhost. `getServerUrl` reads from `assets/config.json`? Wait the code says "the server URL is fetched from the assets/config.json file". The packaged Flutter web will include `assets/assets/config.json` (Flutter prefixes assets with `assets/`). So the route `/app/assets/assets/config.json` serves it dynamically from server config. But `flutter build web` also bundles the file at `build/web/assets/assets/config.json` with localhost. Serverpod's dynamically added route at `/app/assets/assets/config.json` overrides the static FlutterRoute? Route matching order: the config route is added before FlutterRoute, so it wins. Good. On Cloud, `pod.config.apiServer` must have the correct public host. That reinforces setting the env vars.

Actually, Serverpod Cloud's FlutterRoute default uses `no-cache, private`; fine.

Let me inspect the serverpod_flutter `getServerUrl` implementation to be certain of config path. Use `Get-ChildItem D:\Caches\.pub-cache -Recurse -Directory -Filter 'serverpod_flutter-*' -Depth 3`.

**Tool: bash**

**Input:**
```json
{
  "command": "Get-ChildItem D:\\Caches\\.pub-cache -Directory -Recurse -Depth 3 -Filter 'serverpod_flutter-*' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName; Write-Output \"---TOP---\"; Get-ChildItem D:\\Caches\\.pub-cache -Directory | Select-Object -ExpandProperty Name"
}
```

**Output:**
```
---TOP---
active_roots
git
global_packages
hosted
hosted-hashes
_temp

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 23.1s)

_Thinking:_

Odd. Maybe packages aren't downloaded (Flutter project not pub-get). Fine, not needed.

Now, let's think about what "plan for it" should include. A good deployment plan:

**1. Pre-flight / decisions**
- Project ID, plan (Growth for live quizzes; Starter always scales to zero → bad for live), region (Cloud EU-central/Frankfurt; Redis Upstash EU-CENTRAL-1), custom domain.

**2. Blockers in repo to fix before deploy**
- Root workspace paths wrong (`namma_kahoot_*` → `namma_quiz_*`). `dart pub get` fails.
- Add `.scloudignore` with `!web/app/` (and `!web/jaspr/` if hosting Jaspr) because `.gitignore` excludes them.
- Pin Dart SDK in `scloud.yaml` (`dartSdk: "3.8"` for Serverpod 3.4.7).
- Fix production config: Cloud injects DB/Redis env, but set public hosts/schemes or set env vars. Remove/keep examplepod.
- Fix prerender: Flutter web server URL config. Ensure `apiUrl` resolves to Cloud API; set `SERVERPOD_API_SERVER_PUBLIC_HOST` etc. or bake `SERVER_URL`.
- Fix Jaspr client (hardcoded localhost; bad relative import); decide hosting.
- Install CLIs: `dart install serverpod_cloud_cli` (and `dart pub global activate serverpod_cli 3.4.7` for generate/migrations).
- Build web assets in pre-deploy: add `serverpod generate`, `serverpod run flutter_build`, optional jaspr build+copy.
- `serverpod generate` at pre-deploy uses local CLI 3.4.7. Better: commit generated code (already generated in repo) and don't rely on pre-deploy generate? The generated code is in repo (lib/src/generated). Cloud build doesn't run generate by default. Keep a pre_deploy hook for consistency.
- Ensure migrations are committed (they are) and `migration_registry.txt` good.

**3. Cloud setup**
- Create project (database enabled) via `serverpod cloud launch` or `project create`.
- `scloud.yaml` config.
- Environment variables:
  - DB auto.
  - Redis: Upstash + `password set redis`, `variable set SERVERPOD_REDIS_HOST/PORT/ENABLED/REQUIRE_SSL`.
  - Public URLs: `SERVERPOD_API_SERVER_PUBLIC_HOST/PORT/SCHEME`, `SERVERPOD_WEB_SERVER_*`, `SERVERPOD_INSIGHTS_*` (maybe Cloud auto).
  - `SERVERPOD_RUN_MODE=production` (Cloud sets).
  - Disable session log console; enable persistent logs.
- Secrets: email provider API key, JWT/auth keys auto-provisioned; custom admin secret if needed.
- Scale: Growth plan, min podlets 1 (no cold starts, stream stays alive); future calls none.
- Custom domain: attach web + api (and insights optional), DNS.
- CDN/cache headers: add `cacheControlFactory` to FlutterRoute (public max-age 60, s-maxage 86400) and Jaspr assets; keep index no-cache (FlutterRoute already).
- Logs/monitoring: Cloud logs, Insights, DB backups schedule.

**4. Production hardening (pre-launch)**
- Email verification code delivery (currently logs only) → real provider.
- Auth checks on AdminEndpoint and host actions; hostId from authenticated user, not client.
- Prevent duplicate answers / answer table with unique constraint; server-side question timing.
- PIN collision/retry + expiry; prune old sessions.
- Seed logic idempotent and not with creatorId=1 (or ensure system user).
- Rate limiting/CORS.
- Error handling in `dataJson` string interpolation (JSON injection if username contains quotes) — use jsonEncode. Important! `'{"name": "$username"}'` breaks with quotes; also `createGame` returns PIN without uniqueness check.
- Connection timeout settings in clients for wake-up.

**5. Deploy runbook**
- Commands: `dart pub get`, `serverpod generate`, `serverpod create-migration` if pending, `scloud deploy --wet-run --show-files`, `scloud deploy`, `serverpod cloud status deployment show`, `serverpod cloud log`.
- Verify: web URL, API URL, websocket stream, DB migrations, Redis pub/sub across podlets, auth register/login (email), custom domain TLS.
- Rollback: failed deploy keeps old; re-deploy previous commit; DB forward migrations only.

**6. CI/CD (optional)**
- GitHub Actions with `SERVERPOD_CLOUD_TOKEN`, deploy on main; pre-deploy checks.

**7. Risks / open questions**
- Serverpod 3.4.7 EOL and Cloud CLI docs assume 4.x. Recommend upgrade to 4.1 before/after first deploy. Validate early with a deploy; if Cloud rejects, upgrade.
- Scale-to-zero + real-time: Starter unsuitable.
- Redis provider latency: Upstash in same region; Pub/Sub via Redis; test.
- Jaspr vs Flutter hosting decision.

Given the user asked "plan", I should be reasonably concise but complete. Maybe ~60 lines. I can use headings and checkboxes. No need for todos tool since this is planning, not doing. But the todo tool is for coding work; not needed.

Should I ask the 3 decision questions via the question tool? I think a plan plus a "Decisions I need from you" section is fine. But the `question` tool could be useful and friendly. The system says use when needing user preferences. I could ask: (1) Serverpod 3.4.7 now vs upgrade to 4.x first; (2) plan Starter/Growth; (3) primary web UI Jaspr vs Flutter/landing; (4) custom domain. Asking 4 questions might be too much; the plan can assume defaults. I'll include a short "Confirm these" list in text. Actually, the `question` tool renders nicely and can gather decisions that determine the next implementation step. Since the user asked for a plan, not execution, I can end with questions. But I shouldn't block the answer.

Given the instruction "Do not answer with unnecessary preamble... answer directly", I'll start with "Plan" and be structured.

One more verification: does `SERVERPOD_REDIS_HOST`/`PORT` exist in 3.4? 3.3 docs list them (yes, in 2.9 search results). `SERVERPOD_REDIS_ENABLED` and `REQUIRE_SSL`? Search results for 2.6 show `SERVERPOD_REDIS_ENABLED`; `SERVERPOD_REDIS_REQUIRE_SSL` likely. Upstash guide explicitly uses them for Cloud. Good.

Also, `scloud.yaml` location: server package dir. In our monorepo, `namma_quiz_server/scloud.yaml`. Workspace support: "In a workspace project, that's the *_server package directory". Good. The upload includes workspace packages (client). Good.

Critical: the workspace root pubspec is at repo root and `scloud.yaml` in server. The root `pubspec.yaml` workspace lists nonexistent dirs → build fails. Fix.

Also, `namma_quiz_jaspr` has `resolution: workspace`; its pubspec name `namma_kahoot_jaspr` (mismatch with root entry), and client name `namma_kahoot_client` (the root entry is `namma_kahoot_client` but actual dir `namma_quiz_client`). The package *names* are all `namma_kahoot_*`, while dirs are `namma_quiz_*`. So root workspace should list the actual directory paths: `namma_quiz_client`, `namma_quiz_server`, `namma_quiz_jaspr`. But the Flutter app (`namma_quiz_flutter`) is also in the workspace? The root workspace doesn't list it, yet its pubspec has no `resolution: workspace`, so it's independent (it depends on client via path). Fine. Note: if a package is in a workspace, all workspace packages must have `resolution: workspace`; `namma_quiz_flutter` is not listed, fine.

But wait: `namma_quiz_flutter` is a Flutter package; Serverpod's `flutter_build` script runs `flutter build web` in that dir. Its path dependency on `../namma_kahoot_client` is wrong (dir is `namma_quiz_client`). Let me check: pubspec says `path: ../namma_kahoot_client`. That directory doesn't exist! Similarly `namma_quiz_jaspr` points to `../namma_kahoot_client`. And server `generator.yaml` points to `../namma_kahoot_client`. So after the rename commit, many paths are broken. The scanner earlier showed only these; I need to search for `namma_kahoot_` path references across configs. Let me grep.

**Tool: grep**

**Input:**
```json
{
  "pattern": "namma_kahoot_(client|server|flutter|jaspr)",
  "path": "D:\\StudioProjects\\NammaFlutter\\namma-quiz",
  "include": "*.yaml"
}
```

**Output:**
```
Found 16 matches
D:\StudioProjects\NammaFlutter\namma-quiz\pubspec.yaml:
  Line 8:   - namma_kahoot_client

  Line 9:   - namma_kahoot_server

  Line 10:   - namma_kahoot_jaspr


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_client\pubspec.yaml:
  Line 1: name: namma_kahoot_client


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\pubspec.yaml:
  Line 1: name: namma_kahoot_jaspr

  Line 14:   namma_kahoot_client:

  Line 15:     path: ../namma_kahoot_client


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\generator.yaml:
  Line 3: client_package_path: ../namma_kahoot_client


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\pubspec.yaml:
  Line 1: name: namma_kahoot_server

  Line 31:         & cd /D ..\namma_kahoot_flutter

  Line 33:         && xcopy /E /I /Y build\web ..\namma_kahoot_server\web\app

  Line 35:         cd ../namma_kahoot_flutter

  Line 36:         flutter build web --base-href /app/ --wasm --output ../namma_kahoot_server/web/app


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\pubspec.yaml:
  Line 1: name: namma_kahoot_flutter

  Line 31:   namma_kahoot_client:

  Line 32:     path: ../namma_kahoot_client

```

**Tool: grep**

**Input:**
```json
{
  "pattern": "\\.\\./namma_kahoot_client|\\.\\./namma_quiz_client",
  "path": "D:\\StudioProjects\\NammaFlutter\\namma-quiz",
  "include": "*.yaml"
}
```

**Output:**
```
Found 3 matches
D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_jaspr\pubspec.yaml:
  Line 15:     path: ../namma_kahoot_client


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_flutter\pubspec.yaml:
  Line 32:     path: ../namma_kahoot_client


D:\StudioProjects\NammaFlutter\namma-quiz\namma_quiz_server\config\generator.yaml:
  Line 3: client_package_path: ../namma_kahoot_client

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 11.1s)

_Thinking:_

So many path bugs. Package names remain `namma_kahoot_*` which is fine (imports use that), but paths must point to actual dirs `../namma_quiz_client`, `../namma_quiz_flutter`, `../namma_quiz_server`. This is a pre-flight blocker.

Also the `flutter_build` script's Windows `cd /D ..\namma_kahoot_flutter` etc. needs updating.

Now, `namma_quiz_flutter` is not in the workspace, but it depends on `namma_kahoot_client` which is a workspace member with a path. Fine.

Also: the server's generated code is committed? `lib/src/generated` exists (we saw endpoints.dart). Is it gitignored? Server `.gitignore` doesn't ignore generated. Good, so Cloud build has it. But `serverpod generate` pre-deploy would regenerate with correct paths after fix.

Now check that migrations exist and match models; two migrations. Fine.

Let me also check `config/test.yaml` maybe irrelevant.

One more important item: `.fvmrc` says Flutter 3.41.1, and pubspec says `flutter: '^3.32.0'`. Cloud app publishing not relevant unless mobile. Server Cloud pre-deploy runs `flutter build web` locally. Fine.

Now, do I need to check Serverpod Cloud's regional location? Docs mention EU-CENTRAL for Upstash (Frankfurt). Cloud's own region? Likely EU. Not crucial.

Let me now think about whether to propose upgrading to Serverpod 4. Since Cloud CLI's prerequisite is 4.0+, and Cloud is tightly coupled to 4.x (env var names, Flutter app publishing, integrated web server), deploying 3.4.7 may be possible but unsupported. The most reliable plan is to upgrade. But that's significant: the auth API changed in 4.0? Let me check the upgrade guide quickly to estimate. Fetch https://docs.serverpod.dev/upgrading.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/upgrading"
}
```

**Output:**
```
  index | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/upgrading)

-   [Next](/next/upgrading)
-   [4.1.0](/upgrading)
-   [4.0.0](/4.0.0/upgrading)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/)
-   [Get Started](/installation)
    
    -   [Installation](/installation)
    -   [Quickstart](/quickstart)
    -   [How it works](/how-it-works)
-   [Build your first app](/get-started/creating-endpoints)
    
-   [Serverpod Academy](/serverpod-academy)
-   [Tutorials](/tutorials/fundamentals)
    
-   [Support & community](/support)
-   [Concepts](/concepts/server-fundamentals/your-serverpod-project)
    
-   [Deploy](/deployments/deploy-to-serverpod-cloud)
    
-   [Tools](/tools/insights)
    
-   [Upgrading](/upgrading)
    
    -   [Upgrade to 4.0](/upgrading/upgrade-to-four)
    -   [Breaking changes in 4.0](/upgrading/breaking-changes-in-four)
    -   [Migrate from legacy auth](/upgrading/migrate-from-legacy-auth)
    -   [Upgrading to PostGIS support](/upgrading/upgrade-to-postgis)
    -   [Archive](/upgrading/archive/upgrade-to-one-point-two)
        
-   [Roadmap & contributions](/contribute)
-   [Changelog](https://pub.dev/packages/serverpod/changelog)
-   [Serverpod Cloud](/cloud)

Version: 4.1.0Copy as Markdown

# Upgrading

Upgrade an existing project to a new version of Serverpod, move it off the legacy auth module, or add PostGIS to its database.

[

## 📄️Upgrade to 4.0

Upgrade a Serverpod 3.4 project to 4.0 and switch to serverpod start, with steps for dependencies, code generation, the migration, and deployment.

](/upgrading/upgrade-to-four)

[

## 📄️Breaking changes in 4.0

Every breaking API and behavior change between Serverpod 3.4 and 4.0, with the symptom that tells you it applies and the code change each one needs.

](/upgrading/breaking-changes-in-four)

[

## 📄️Migrate from legacy auth

Upgrading from serverpod\_auth\_server to the new modular auth stack while email users keep their passwords and existing sessions keep working.

](/upgrading/migrate-from-legacy-auth)

[

## 📄️Upgrading to PostGIS support

Add PostGIS to a Serverpod project to enable geography fields, with steps for Docker, managed PostgreSQL services, and pgvector.

](/upgrading/upgrade-to-postgis)

[

## 🗃Archive

7 items

](/upgrading/archive/upgrade-to-one-point-two)

[Edit this page](https://github.com/serverpod/serverpod_docs/tree/main/versioned_docs/version-4.1.0/11-upgrading/index.md)

[

Previous

Command line completion

](/tools/shell-completion)[

Next

Upgrade to 4.0

](/upgrading/upgrade-to-four)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 8.8s)

_Thinking:_

Let me quickly read the upgrade-to-4.0 guide to gauge effort and mention.

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/upgrading/upgrade-to-four"
}
```

**Output:**
```
  Upgrade to 4.0 | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/upgrading/upgrade-to-four)

-   [Next](/next/upgrading/upgrade-to-four)
-   [4.1.0](/upgrading/upgrade-to-four)
-   [4.0.0](/4.0.0/upgrading/upgrade-to-four)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/)
-   [Get Started](/installation)
    
    -   [Installation](/installation)
    -   [Quickstart](/quickstart)
    -   [How it works](/how-it-works)
-   [Build your first app](/get-started/creating-endpoints)
    
-   [Serverpod Academy](/serverpod-academy)
-   [Tutorials](/tutorials/fundamentals)
    
-   [Support & community](/support)
-   [Concepts](/concepts/server-fundamentals/your-serverpod-project)
    
-   [Deploy](/deployments/deploy-to-serverpod-cloud)
    
-   [Tools](/tools/insights)
    
-   [Upgrading](/upgrading)
    
    -   [Upgrade to 4.0](/upgrading/upgrade-to-four)
    -   [Breaking changes in 4.0](/upgrading/breaking-changes-in-four)
    -   [Migrate from legacy auth](/upgrading/migrate-from-legacy-auth)
    -   [Upgrading to PostGIS support](/upgrading/upgrade-to-postgis)
    -   [Archive](/upgrading/archive/upgrade-to-one-point-two)
        
-   [Roadmap & contributions](/contribute)
-   [Changelog](https://pub.dev/packages/serverpod/changelog)
-   [Serverpod Cloud](/cloud)

Version: 4.1.0Copy as Markdown

On this page

# Upgrade to 4.0

Serverpod 4.0 (Jetstream) adds `serverpod start`, one command that runs your server, database, and Flutter app together with hot reload. Upgrade your 3.4 project to 4.0, then run it with `serverpod start`.

The upgrade itself takes about 15 minutes: update the CLI and your dependencies, regenerate your code, and create one migration.

Compile errors after you regenerate are expected. Most match a section on [Breaking changes in 4.0](/upgrading/breaking-changes-in-four). Plan for more time if breaking changes affect your code, or if you have a Dockerfile or CI workflows to update.

## Before you start[​](#before-you-start "Direct link to Before you start")

-   You have Flutter 3.44.4 or later. It includes Dart 3.12.2, which Serverpod 4.0 requires. Check with `flutter --version`, and run `flutter upgrade` if your version is older.
-   Your Postgres is version 16 or later, which Serverpod 4.0 requires. Check with `SELECT version();`, and upgrade the database before you upgrade Serverpod. The `pgvector/pgvector:pg16` image from 3.4 projects, the `ghcr.io/serverpod/postgres:16` image, and the embedded Postgres all meet the requirement. On Postgres 14, the server can't read the database schema. Its startup integrity check fails, and `serverpod create-repair-migration` can't run.
-   Your project is on the latest Serverpod 3.4.x release.
-   Your project compiles and its tests pass.
-   You have committed your current state to Git, so you can roll back if needed.
-   You have no model changes waiting for a migration. If you do, create and apply that migration first.

## Update the Serverpod CLI[​](#update-the-serverpod-cli "Direct link to Update the Serverpod CLI")

The 3.4 CLI was installed with `dart pub global activate`. Deactivate it before you install the 4.0 CLI:

```
$ dart pub global deactivate serverpod_cli
```

Then install the 4.0 CLI:

```
$ dart install serverpod_cli
```

Check that it reports a 4.0 version:

```
$ serverpod version
```

## Update your dependencies[​](#update-your-dependencies "Direct link to Update your dependencies")

Bump every Serverpod package your project uses to 4.0. Pin the exact version rather than a caret range, so the packages stay in sync with the CLI.

The packages are in the `pubspec.yaml` files of `<project>_server`, `<project>_client`, and `<project>_flutter`:

```
dependencies:  serverpod: 4.0.0                      # in the server package  serverpod_client: 4.0.0               # in the client package  serverpod_flutter: 4.0.0              # in the Flutter package  # If you use the new auth module:  serverpod_auth_idp_server: 4.0.0      # in the server package  serverpod_auth_idp_client: 4.0.0      # in the client package  serverpod_auth_idp_flutter: 4.0.0     # in the Flutter package  # If you use the legacy serverpod_auth module:  serverpod_auth_server: 4.0.0          # in the server package  serverpod_auth_client: 4.0.0          # in the client package  serverpod_auth_shared_flutter: 4.0.0  # in the Flutter packagedev_dependencies:  serverpod_test: 4.0.0                 # in the server package
```

-   **The block is not the full list.** Bump any other package whose name starts with `serverpod_` to the same version, such as `serverpod_cloud_storage_s3`.
-   **Don't skip `serverpod_test` in `dev_dependencies`.** It pins `serverpod` to an exact version. If it stays on 3.4, `dart pub upgrade` fails.
-   **If you use the legacy `serverpod_auth` module, expect code changes.** It keeps working on 4.0, but the client setup and Sign in with Apple need updating. See [the legacy auth changes](/upgrading/breaking-changes-in-four#if-you-use-the-legacy-auth-module).
-   **If you use the new auth module, check your Flutter app's `flutter_secure_storage` version.** The module needs 10.0.0 or newer, which most projects already have. If yours is still on 9.x, read [how to upgrade without signing out your Android users](/upgrading/breaking-changes-in-four#if-you-use-the-new-auth-module-on-android) first.

Then bump the Dart SDK constraint in the root `pubspec.yaml` and `<project>_server/pubspec.yaml` to the 4.0 minimum:

```
environment:  sdk: '^3.12.2'
```

## Regenerate your code[​](#regenerate-your-code "Direct link to Regenerate your code")

**Check your model files first.** Rename each model file that ends in just `.yaml` or `.yml`, so `company.yaml` becomes `company.spy.yaml`. Otherwise, `serverpod generate` [stops with an error](/upgrading/breaking-changes-in-four#model-files-use-the-spyyaml-extension).

Then refresh dependencies from the project's root folder:

```
$ dart pub upgrade
```

Projects created with the 3.3 scaffold or later use a Dart workspace, so this one command covers every sub-package. If the root `pubspec.yaml` has no `workspace:` block, run `dart pub upgrade` in each sub-package instead. To adopt workspaces, see Dart's [pub workspaces documentation](https://dart.dev/tools/pub/workspaces).

Now refresh the generated server and client code:

```
$ serverpod generate
```

**Expect errors here.** If the command reports `analysis skipped due to invalid Dart syntax` for an endpoint or future call file, that file usually still uses an API that changed. Fix each file the same way:

1.  Find the matching section on [Breaking changes in 4.0](/upgrading/breaking-changes-in-four).
2.  Update the file.
3.  Run `serverpod generate` again.

Repeat until the command finishes without errors.

Some changes don't cause an error, such as how future calls and messages behave. Scan the table on [Breaking changes in 4.0](/upgrading/breaking-changes-in-four) for anything else that affects your project.

## Create the 4.0 migration[​](#create-the-40-migration "Direct link to Create the 4.0 migration")

Version 4.0 adds a few internal Serverpod tables. It also updates some indexes to speed up logs in [Serverpod Insights](/tools/insights), the desktop log viewer.

Finish the previous step first. Then create the migration:

```
$ serverpod create-migration --tag "upgrade-4-0" --force
```

note

Without `--force`, the command stops with a warning, because this migration changes the authentication module's rate-limit table. The change is safe: accounts, sessions, and other auth data are untouched. The only side effect is that the counters in that table reset to zero.

If you don't use the authentication module, there is no warning, and the flag changes nothing.

The command writes a new migration to `<project>_server/migrations/`. The `serverpod start` command applies it when you [start the server](#start-the-server) later in this guide.

If you run the server yourself instead, start it once from the server package with `dart run bin/main.dart --apply-migrations`. See [Run the server directly](/concepts/server-fundamentals/running-your-server#run-the-server-directly).

## Update your deployment[​](#update-your-deployment "Direct link to Update your deployment")

This step applies if you compile your server, or if your project has the GitHub Actions workflows that 3.4 created. Otherwise, skip to [Switch to `serverpod start`](#switch-to-serverpod-start).

### Update the server build[​](#update-the-server-build "Direct link to Update the server build")

If you compile your server with `dart compile exe`, for example in the `Dockerfile` in `<project>_server`, switch to `dart build cli`. The 4.0 server has native build hooks that `dart compile exe` doesn't support. Instead of a single static binary, the new command produces a bundle: an executable plus its native libraries.

If you deploy with the Dockerfile, copy the updated one from the [4.0 framework template](https://github.com/serverpod/serverpod/blob/main/templates/serverpod_templates/projectname_server/Dockerfile) or a fresh 4.0 project's `<project>_server/Dockerfile`. Compared with the 3.4 Dockerfile, the new one:

-   Builds from the project root instead of the server directory.
-   Copies the bundle directory.
-   Points `ENTRYPOINT` at the bundled binary.
-   Uses the `dart:3.12.2` base image or newer.

### Update the GitHub Actions workflows[​](#update-the-github-actions-workflows "Direct link to Update the GitHub Actions workflows")

If your project still has the GitHub Actions workflows that 3.4 created, replace them. The 3.4 workflows are `analyze.yml`, `format.yml`, and `tests.yml` in `.github/workflows/`. They set up an SDK older than the Dart 3.12.2 that 4.0 requires, so they fail after the upgrade. The `tests.yml` workflow also installs the 3.4 CLI.

Copy the 4.0 versions from the [framework templates](https://github.com/serverpod/serverpod/tree/main/templates/serverpod_templates/github/workflows) and fill in their placeholders:

-   `projectname`: your project name.
-   `CLI_VERSION`: `4.0.0`.
-   `DB_TEST_PASSWORD` and `REDIS_TEST_PASSWORD`: the `test` passwords from `<project>_server/config/passwords.yaml`.

## Switch to `serverpod start`[​](#switch-to-serverpod-start "Direct link to switch-to-serverpod-start")

Your project is now on 4.0, but you still run it the 3.4 way. The `serverpod start` command runs your server, your Flutter app, and your database in one terminal, and hot reloads your code when you save. It replaces running `docker compose up`, `dart bin/main.dart`, and `flutter run` separately.

See [Running your server](/concepts/server-fundamentals/running-your-server) for the full workflow. Before you run `serverpod start`, choose how to handle the database.

### Choose your data store[​](#choose-your-data-store "Direct link to Choose your data store")

Both options work with `serverpod start`. For the fewest changes, keep your Docker Postgres.

#### Keep your Docker Postgres (easiest upgrade)[​](#keep-your-docker-postgres-easiest-upgrade "Direct link to Keep your Docker Postgres (easiest upgrade)")

If you develop against a Docker Postgres on 3.4, you can keep it without changing your config.

The `serverpod start` command runs `docker compose up -d` when all of these are true:

-   Your server package has a Docker Compose file.
-   Your config points at a Postgres on `localhost` with no `dataPath`.
-   The services aren't running.

On exit, the command runs `docker compose stop` for the services it started. It leaves the other services running.

New 4.0 projects use the `ghcr.io/serverpod/postgres:16` image, which bundles pgvector and PostGIS. Your existing `pgvector/pgvector:pg16` image keeps working. Switch to the new image when you need PostGIS. See [Upgrade to PostGIS](/upgrading/upgrade-to-postgis).

#### Switch to the embedded Postgres (recommended for new development)[​](#switch-to-the-embedded-postgres-recommended-for-new-development "Direct link to Switch to the embedded Postgres (recommended for new development)")

The embedded Postgres runs as a child process of your server and uses the same Postgres dialect as production. It needs no Docker. It connects over a Unix domain socket, so it doesn't compete for TCP ports. You can reset it by deleting its data directory. See [Embedded PostgreSQL](/concepts/data-and-the-database/database/embedded-postgres).

To switch, add `dataPath` to the database section of `<project>_server/config/development.yaml` and `<project>_server/config/test.yaml`:

```
database:  host: localhost  port: 8090  name: <project>  user: postgres  dataPath: .serverpod/development/pgdata
```

For `test.yaml`, use a separate directory, as new projects do: `dataPath: .serverpod/test/pgdata`.

The data directory holds a complete database, so keep it out of version control. Upgrading doesn't add the ignore rule that new projects get, so add this line to `<project>_server/.gitignore`:

```
.serverpod/
```

Once `dataPath` is set, `serverpod start` uses the embedded Postgres automatically.

Don't add `dataPath` to `production.yaml` or `staging.yaml`. In production, use a managed Postgres, such as a [Serverpod Cloud](/cloud) database, Cloud SQL, or RDS. Pick an engine version of 16 or later, which Serverpod 4.0 requires.

The server reaches the embedded Postgres over the socket, but database tools like `psql` connect over TCP. To connect a tool, stop the server and run `serverpod database start`. See [Connect a database tool](/concepts/data-and-the-database/database/embedded-postgres#connect-a-database-tool).

note

With `dataPath` set, the server connects to the embedded Postgres even if you pass `--docker`. The `--docker` flag only controls whether `serverpod start` brings up the Docker Compose stack. Your Docker volume stays intact, so remove `dataPath` to go back to the Docker Postgres.

### Start the server[​](#start-the-server "Direct link to Start the server")

From your project's root folder, run:

```
$ serverpod start
```

note

If you ran `serverpod start` before upgrading, delete the `<project>_server/.dart_tool/serverpod` folder before you run this command. It holds the server that `serverpod start` compiled earlier, and an old copy can stop the upgraded server at startup. The next run rebuilds it.

On the first run, the command compiles the native build hooks, which can take about 30 seconds. It also applies the migration you created in [Create the 4.0 migration](#create-the-40-migration). Then the server starts and watches your project. When you save a file, the command hot reloads the code.

The command also launches your `<project>_flutter` app when that package exists. If the server's `pubspec.yaml` has a `serverpod: flutter_apps:` section, the command instead launches the apps in that section that set `auto_launch: true`.

#### Debug in VS Code[​](#debug-in-vs-code "Direct link to Debug in VS Code")

Your upgraded project keeps its 3.4 `launch.json`, which runs `bin/main.dart`. Projects created with 4.0 have a `launch.json` that attaches the debugger to the processes that `serverpod start` runs. Each configuration in that new file first runs the `serverpod_start` task from `tasks.json`. To copy both files into your project:

1.  In an empty folder outside your project, create a throwaway 4.0 project with the same name as yours. Add `--template server` if your project has no Flutter app.
    
    ```
    $ serverpod create <project>
    ```
    
2.  Copy `tasks.json` and `launch.json` from the throwaway project's `.vscode` folder into your project's `.vscode` folder, replacing the old files.
    
3.  If `tasks.json` sets `SERVERPOD_PASSWORD_database`, replace its value with the `database` password under `development` in `<project>_server/config/passwords.yaml`. The environment variable overrides `passwords.yaml`. If you leave the throwaway project's password in place, the server gets the wrong database password.
    

## Verify[​](#verify "Direct link to Verify")

Your project runs on 4.0 when these three checks pass:

-   **The server starts.** With `serverpod start`, or with `dart run bin/main.dart --apply-migrations` if you run the server yourself.
-   **The migration is applied.** The log shows no `Database does not match target state` warning. If it does, see [Troubleshooting](#troubleshooting).
-   **Your tests pass.** Run them the way you did before the upgrade.

## Set up the agent workflow[​](#set-up-the-agent-workflow "Direct link to Set up the agent workflow")

Version 4.0 ships AI agent skills and MCP servers for editors like Claude Code and Cursor. A new project gets them from `serverpod create`. An upgraded project does not, so this step installs the skills and registers the MCP servers by hand. Once set up, your agent can hot reload your server, create and apply migrations, launch your Flutter app, and read the logs.

warning

Don't use `serverpod create .` to add the agent setup to an existing project. The command writes its template files over yours without checking whether they exist. Your `server.dart` and config files lose their database, Redis, authentication, and web server setup. Your `passwords.yaml` gets new random passwords and secrets. Git can't restore the old file, because the default `.gitignore` excludes it.

Everything the command can overwrite

In a folder that already has a Serverpod server, `serverpod create .` runs an upgrade. Depending on the options, it overwrites:

-   `<project>_server/lib/server.dart`.
-   The `development`, `staging`, `production`, `test`, and `generator` YAML files in `<project>_server/config/`.
-   `<project>_server/config/passwords.yaml`, with new random passwords and secrets.
-   `<project>_server/docker-compose.yaml` and the workflows in `.github/workflows/`.
-   The scaffolded authentication endpoints in `<project>_server/lib/src/auth/`, and the scaffolded web server files in `<project>_server/lib/src/web/` and `<project>_server/web/`.
-   `lib/main.dart`, `lib/client.dart`, and `lib/screens/greetings_screen.dart` in your Flutter app.

The command also adds dependencies to your `pubspec.yaml` files. In an interactive terminal on a project that already has migrations, it only asks which editors to set up. In that case, it turns every other option off, so the rewritten files lose your setup.

### Install the agent skills[​](#install-the-agent-skills "Direct link to Install the agent skills")

Install the skills tool:

```
$ dart install skills
```

Then, from your project's root folder, pull the skills for your editor:

```
$ skills get --ide <editor>
```

Replace `<editor>` with the editor you use: `antigravity`, `claude`, `cline`, `codex`, `copilot`, `cursor`, or `opencode`. For VS Code, or to install the skills in the `.agents` folder, use `generic`.

### Register the MCP servers[​](#register-the-mcp-servers "Direct link to Register the MCP servers")

Your agent uses two MCP servers: **Serverpod** and **Dart**. Register them in your editor's config file, at a path relative to your project's root folder. For Claude, create `.mcp.json`:

```
{  "mcpServers": {    "serverpod": {      "command": "serverpod",      "args": ["mcp-server", "--server-dir", "<project>_server"]    },    "dart": {      "command": "dart",      "args": ["mcp-server"]    }  }}
```

Replace `<project>_server` with the path to your server package, relative to the project root.

Each editor reads the servers from its own file:

Editor

Config file

Format

Claude

`.mcp.json`

The sample above.

Cursor

`.cursor/mcp.json`

The sample above.

VS Code

`.vscode/mcp.json`

The sample above, with the entries under a `servers` key instead of `mcpServers`.

Antigravity

`.agents/plugins/serverpod-local/mcp_config.json`

The sample above, with the Dart entry named `dart-mcp-server`. Antigravity also needs a `plugin.json` file in the same folder, with `"name"` set to `"serverpod-local"`.

Codex

`.codex/config.toml`

Codex's TOML format. Pass `--force-roots-fallback` to `dart mcp-server`.

OpenCode

`opencode.json`

OpenCode's `mcp` format.

In the Codex and OpenCode formats, register the same two commands as the sample: `serverpod mcp-server --server-dir <project>_server` and `dart mcp-server`.

If you are using Cursor, enable the **Serverpod** and **Dart** MCP servers: open **Customize** in the sidebar, click **MCPs**, and turn on both servers.

## What's new in 4.0[​](#whats-new-in-40 "Direct link to What's new in 4.0")

-   **`serverpod start` terminal UI**: hot reload on save. Press **R** to hot restart, **M** to create and apply a migration, or **P** to create and apply a repair migration.
-   **Simplified server initialization**: the generated `Serverpod` class comes with `Protocol` and `Endpoints` already set up, so `server.dart` needs only `Serverpod(args)`. Projects that keep their existing imports can stay on `Serverpod(args, Protocol(), Endpoints())`.
-   **Flutter app launching** from `serverpod start`, so the Flutter app runs alongside the server in the same terminal UI.
-   **AI agent skills and MCP servers** set up during `serverpod create`. Existing projects can [add them manually](#set-up-the-agent-workflow).
-   **Embedded Postgres**: develop without Docker by setting `dataPath`.
-   **SQLite database support** as an alternative dialect to Postgres.
-   **Client-side database generation** for the Flutter app.
-   **`jsonb` column support** with GIN index operator classes, and **`dynamic` fields** on models and endpoints.
-   **`unique` keyword** for simpler unique indexes in model files.
-   **`upsert` and `upsertRow`** on the ORM, and **`asc()` / `desc()`** convenience methods on orderable columns.
-   **Recurring future calls** with `callRecurring`, on a fixed interval or a cron schedule. See [Recurring tasks](/concepts/scheduling/recurring-tasks).
-   **OAuth2 PKCE Flutter web redirect** for sign-in flows.
-   **Account merging** in the auth module, so a user can link a second sign-in method to an existing account. See [Merging accounts](/concepts/authentication/working-with-users#merging-accounts).
-   **httpOnly cookie authentication for the web**, which keeps browser sign-in tokens out of storage that JavaScript can read. See [web authentication](/concepts/authentication/web-authentication).
-   **Health endpoints** on the built-in web server.
-   **IDE and agent selection** in `serverpod create`.

## Troubleshooting[​](#troubleshooting "Direct link to Troubleshooting")

### Port conflicts on startup[​](#port-conflicts-on-startup "Direct link to Port conflicts on startup")

If you run more than one Serverpod server on the same machine, the servers can conflict on the default ports: 8080 for the main server and 8090 for the database. Stop the other server, or run on different ports.

### The server stops because the database doesn't match[​](#the-server-stops-because-the-database-doesnt-match "Direct link to The server stops because the database doesn't match")

After the upgrade, `serverpod start` can report that the latest migration is applied and then stop the server with these warnings:

```
WARNING: The database does not match the target database:WARNING: Database does not match target state.Server stopped (exitCode: 1).
```

Stop `serverpod start`, delete the `<project>_server/.dart_tool/serverpod` folder, and run `serverpod start` again. If the warnings remain, create and apply the migration from [Create the 4.0 migration](#create-the-40-migration).

### Agent skills or MCP servers aren't picked up after setup[​](#agent-skills-or-mcp-servers-arent-picked-up-after-setup "Direct link to Agent skills or MCP servers aren't picked up after setup")

Run `skills get --ide <editor>` again from the project's root folder. Then check that your editor's MCP config file is at the path listed in [Register the MCP servers](#register-the-mcp-servers). That section also covers the extra steps some editors need, such as enabling the servers in Cursor.

## Still stuck?[​](#still-stuck "Direct link to Still stuck?")

If something here didn't go as expected, reach out on the [community page](/support).

## Related[​](#related "Direct link to Related")

-   [Breaking changes in 4.0](/upgrading/breaking-changes-in-four): every API and behavior change between 3.4 and 4.0, for looking up an error.
-   [Running your server](/concepts/server-fundamentals/running-your-server): what the `serverpod start` command does, and the other ways to run your server.
-   [Embedded PostgreSQL](/concepts/data-and-the-database/database/embedded-postgres): how the embedded Postgres runs alongside your server, and how to reset it or connect a tool to it.
-   [Migrations](/concepts/data-and-the-database/database/migrations): how Serverpod's migration system works under the hood.
-   [Build your first app](/get-started/creating-endpoints): the hands-on tour of the 4.0 workflow, if you want to see `serverpod start` in a project built from scratch.

[Edit this page](https://github.com/serverpod/serverpod_docs/tree/main/versioned_docs/version-4.1.0/11-upgrading/01-upgrade-to-four.md)

[

Previous

index

](/upgrading)[

Next

Breaking changes in 4.0

](/upgrading/breaking-changes-in-four)

-   [Before you start](#before-you-start)
-   [Update the Serverpod CLI](#update-the-serverpod-cli)
-   [Update your dependencies](#update-your-dependencies)
-   [Regenerate your code](#regenerate-your-code)
-   [Create the 4.0 migration](#create-the-40-migration)
-   [Update your deployment](#update-your-deployment)
    -   [Update the server build](#update-the-server-build)
    -   [Update the GitHub Actions workflows](#update-the-github-actions-workflows)
-   [Switch to `serverpod start`](#switch-to-serverpod-start)
    -   [Choose your data store](#choose-your-data-store)
    -   [Start the server](#start-the-server)
-   [Verify](#verify)
-   [Set up the agent workflow](#set-up-the-agent-workflow)
    -   [Install the agent skills](#install-the-agent-skills)
    -   [Register the MCP servers](#register-the-mcp-servers)
-   [What's new in 4.0](#whats-new-in-40)
-   [Troubleshooting](#troubleshooting)
    -   [Port conflicts on startup](#port-conflicts-on-startup)
    -   [The server stops because the database doesn't match](#the-server-stops-because-the-database-doesnt-match)
    -   [Agent skills or MCP servers aren't picked up after setup](#agent-skills-or-mcp-servers-arent-picked-up-after-setup)
-   [Still stuck?](#still-stuck)
-   [Related](#related)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 16.6s)

_Thinking:_

Upgrade requires Flutter 3.44.4/Dart 3.12.2 and `.spy.yaml` (already), SQLite/migrations. Our `.fvmrc` 3.41.1 is too old for 4.0; local Dart 3.13.5. Could upgrade. The project uses Serverpod 3.4.7 and Flutter 3.41.1. Upgrading to 4.1 means bumping Flutter to >=3.44.4, serverpod to 4.1.x, and handling breaking changes. Estimated a day. The deployment plan should present it as a recommended parallel track.

Wait, Serverpod 4.1 requires Dart 3.12.2; Cloud supports Dart 3.12/3.13. Good.

Now I need to decide what to do now: answer with the plan. I might also produce an actionable "Phase 0" list in the repo (fix paths, scloud.yaml, .scloudignore). But the user only asked to plan. I will not modify files yet.

Let me structure the response:

## Namma Quiz → Serverpod Cloud plan

**Assumptions** (Starter vs Growth; 3.4.7; Jaspr; default domain)

**What I found that blocks deployment** (5 bullets, file refs)
- workspace paths broken: pubspec.yaml:8-10, client path refs generator.yaml:3, flutter pubspec:32, jaspr pubspec:15, server pubspec:31-36, and `getServerUrl` config; `dart pub get` fails with "No workspace packages matching namma_kahoot_client".
- web build output gitignored → `.scloudignore` needed.
- production.yaml example host; Cloud env injection; need public host env vars.
- Jaspr hardcodes localhost and relative import; Flutter web config route.
- DB/Redis: Cloud gives Postgres; Redis must be external (Upstash). `session.messages` is the core of gameplay → Redis required once >1 podlet; set env vars.
- scale-to-zero Starter: unsuitable for live games; use Growth min 1.
- no email sender; auth codes log only.
- AdminEndpoint unauthenticated; duplicate answers.
- serverpod/scloud CLIs not installed.

**Phase 0 – fix repo (blockers)** with concrete file changes.
**Phase 1 – Cloud project/bootstrap** commands.
**Phase 2 – config/secrets**.
**Phase 3 – web/Flutter/Jaspr build + hosting**.
**Phase 4 – deploy + verify**.
**Phase 5 – production hardening**.
**Phase 6 – CI (optional)**.
**Risks / decisions**.

I need to keep it digestible; maybe 50-70 lines. The system says be concise, but planning warrants detail. Use code refs.

Let me double-check a few specifics to avoid wrong commands:
- Install Cloud CLI: `dart install serverpod_cloud_cli` (docs).
- Serverpod 3 CLI: `dart pub global activate serverpod_cli 3.4.7`; command `serverpod`.
- `serverpod cloud launch` requires serverpod CLI 4.0; use `scloud launch` standalone. But `scloud auth login` etc.
- Build: `serverpod generate` in server dir; `dart pub get` root.
- `scloud deploy` from server dir (scloud.yaml).
- `scloud variable set` / `scloud password set` etc. The docs use `serverpod cloud ...`; standalone uses `scloud ...`.
- Cloud env vars: `SERVERPOD_REDIS_HOST`, `SERVERPOD_REDIS_PORT`, `SERVERPOD_REDIS_ENABLED`, `SERVERPOD_REDIS_REQUIRE_SSL`; `scloud password set redis "<pass>"`.
- Dart pin: `scloud.yaml` `project: { projectId, dartSdk: "3.8" }`.
- `.scloudignore`:
```
!web/app/
!web/jaspr/
!lib/src/generated/
```
`web/app` ignores the Flutter build; generated code isn't ignored by server .gitignore but the root .gitignore may ignore `**/generated/`? Check root `.gitignore`. Let me read it. Also `config/passwords.yaml` must stay excluded.

Let me check root .gitignore.

**Tool: read**

**Input:**
```json
{
  "filePath": "D:\\StudioProjects\\NammaFlutter\\namma-quiz\\.gitignore"
}
```

**Output:**
```
<path>D:\StudioProjects\NammaFlutter\namma-quiz\.gitignore</path>
<type>file</type>
<content>
1: # Files and directories created by pub
2: .dart_tool/
3: .packages
4: 
5: # Pubspec overrides
6: pubspec_overrides.yaml
7: 
8: # FVM Version Cache
9: .fvm/

(End of file - total 9 lines)
</content>
```

**Tool: bash**

**Input:**
```json
{
  "command": "git ls-files namma_quiz_server/web namma_quiz_server/lib/src/generated | Select-Object -First 5; Write-Output \"---tracked web---\"; git ls-files namma_quiz_server/web"
}
```

**Output:**
```
namma_quiz_server/lib/src/generated/endpoints.dart
namma_quiz_server/lib/src/generated/kahoot/game_event.dart
namma_quiz_server/lib/src/generated/kahoot/game_session.dart
namma_quiz_server/lib/src/generated/kahoot/player.dart
namma_quiz_server/lib/src/generated/kahoot/question.dart
---tracked web---
namma_quiz_server/web/pages/index.html
namma_quiz_server/web/static/css/style.css

```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 224.8s)

_Thinking:_

Generated code is tracked. Good. `web/app` is ignored by server .gitignore. Need `!web/app/` in `.scloudignore`.

Also note `.scloudignore` negation semantics: If `.gitignore` ignores `web/app`, the negation `!web/app/` in `.scloudignore` should re-include. But nested files might still be ignored by the parent pattern; in gitignore semantics, you may need `!web/app/**`. The docs example: `!lib/src/generated/` and `!assets/**`. I'll use both `!web/app/` and `!web/app/**` to be safe. Also hidden files excluded by default; no hidden needed except maybe `.well-known` (not).

One more: the server serves `web/static` from `StaticRoute.directory` but `web/static` is tracked. Good.

If hosting Jaspr: build output to `web/jaspr`, add `!web/jaspr/**`, and add a `SpaRoute` in server.dart. But `jaspr build` may output `build/jaspr` and include `main.dart.js`, `index.html`, `styles/`. Need `jaspr build` in pre-deploy and copy. The server's root route must serve Jaspr `index.html`. The current `StaticRoute.file(File('web/pages/index.html'))` at `/` can be replaced by `SpaRoute(Directory('web/jaspr'), fallback: 'index.html')` after `/app/*` routes. But careful: `SpaRoute` catch-all can shadow `/app/*` and `/static/*` depending on route order. Serverpod routes are matched in order of addition, so add specific routes first, then catch-all. Also the app config route.

Alternatively keep the landing at `/` and host Jaspr at `/play`, `/host`, `/admin` by serving the same index for those paths:
```dart
final jasprDir = Directory('web/jaspr');
if (jasprDir.existsSync()) {
  pod.webServer.addRoute(SpaRoute(jasprDir, fallback: 'index.html'), '/play');
  ...
}
```
But assets in Jaspr index are relative (`main.dart.js`, `styles/main.css`), and routes like `/host` would resolve `/styles/main.css` at root, so need static serving for `/styles/*`, `/images/*`, `main.dart.js`. Simpler to host Jaspr at root.

Given the current landing page is a nice "Join with PIN" page, and the Jaspr SPA has home/host/player/admin, I'd make Jaspr the root web app and route Flutter under `/app`. But then the landing page becomes Jaspr home. That's consistent with README.

However, this is extra work and the user may just want deployment. I'll present two options in Phase 3 with a recommendation: ship Flutter `/app` + landing first (minimal), then add Jaspr at root.

Wait—if Flutter is at `/app`, player links from Jaspr at root `/play` would be Jaspr, not Flutter. Fine.

Now, public URL config:
- Set `SERVERPOD_API_SERVER_PUBLIC_HOST` to `namma-quiz.api.serverpod.space` etc. But if using custom domain, use the API custom domain. For `AppConfigRoute`, the web (Flutter) calls the API at that host. Good.
- For Jaspr, build with `--dart-define=SERVER_URL=https://.../` (Jaspr build supports `--dart-define`? `jaspr build` likely passes `--dart-define`. In Jaspr CLI, `jaspr build` has `--dart-define`? Probably. Alternatively use `String.fromEnvironment` and run `dart compile js -DSERVER_URL=...`; Jaspr build supports `--dart-define` likely. If not, generate a `config` constant via `--define` env. I'll say "inject via `--dart-define`/build config".)
- Flutter build uses `getServerUrl` from assets config route, so set public host. Or add `--dart-define=SERVER_URL=...` in the build script. But `flutter build web` with `--dart-define` is supported. The clean approach: rely on server config route; ensure `apiServer.publicHost` is correct. Since Cloud env overrides, good. Also `assets/config.json` fallback is localhost; not used in production if config route works. But if the app is served at root (not /app), the route path won't match. We serve at /app.

Auth:
- Cloud auto-provisions `serverpod_auth_idp_server` keys. But in 3.4.7 `JwtConfigFromPasswords` expects `jwtHmacSha256Key`/`jwtP256PrivateKey` under password names. Cloud's auto-provisioned names likely exactly those. Good.
- Email IDP codes are logged only → can't register in production. Add email provider (e.g., Resend/SendGrid) and store API key with `scloud password set resendApiKey`. Implement in `_sendRegistrationCode`/`_sendPasswordResetCode`. If not ready, disable email IDP for launch (anonymous join works? players don't need auth; host may). The app's player flow may not require auth. So you can launch without email registration by removing EmailIdpConfig or leaving it (registration unusable but host flows may use a local user). Note this.

DB seeding:
- `_seedDefaultQuiz` after `pod.start()`; on Cloud, migrations run before start, fine. But with multiple podlets starting simultaneously, both may see empty quizzes and seed duplicates. Use a transaction/unique constraint or a migration seed. Also `creatorId: 1` may not exist. Flag.
- More importantly, seeding calls `pod.createSession()` outside a request; fine.

Admin endpoint is unauthenticated: public delete. Must fix before public launch.

Streams + Redis: Also, Serverpod 3.4 `session.messages` with Redis enabled requires `redis.enabled: true` and password. On Cloud, set env. Without Redis, multiple podlets break. Redis also supports caching. Upstash free tier has connection limits; for real-time pub/sub with many players, consider a paid plan or a dedicated Redis. Also Serverpod uses Redis for message central; each stream/subscriber uses connections? Serverpod multiplexes? Fine.

Scale-to-zero:
- Starter: always scales to zero; ~5 min idle. A live game with open websockets keeps it alive, but the first host/player connecting waits 4-6s. Since host creates the game then players join, acceptable-ish but risky. Growth min 1 recommended for live events. Also Cloud's default 20s endpoint timeout; streaming 5s; set `Client(streamingConnectionTimeout: ...)`. Actually the host opens a stream when creating; 4-6s wake-up may exceed the 5s streaming timeout → need to set 30s and retry. Flag.

Cost: not needed.

Now, the response. I should maybe include an explicit "first 30 minutes" sequence. Let me draft:

```
Plan: Namma Quiz on Serverpod Cloud

Assumptions: 3.4.7 stays for first deploy, Growth plan, default domain, Postgres managed, Upstash Redis, Flutter at /app + landing at /.

0) Verified blockers (fix before any deploy)
- workspace broken ... (dart pub get fails)
- path refs ...
- .gitignore excludes web/app → Cloud would upload nothing; add .scloudignore
- production.yaml example hosts + Redis disabled
- Jaspr client hardcoded to localhost + illegal relative import
- no email sender; AdminEndpoint unauthenticated

1) Repo prep
...
```

I need to be careful with "3.4.7 stays" vs "recommend upgrade". Maybe present as a decision:

**Decision 1 — runtime version:** I recommend upgrading to Serverpod 4.1 before deployment. Cloud's CLI/docs assume 4.x, 3.4 is EOL, and 4.x has the integrated web server and first-class Cloud support. Cost: ~1 day (Flutter 3.44.4+, bump packages, regenerate, migration, fix breaking changes). If you want a deploy this week, first deploy on 3.4.7 with `scloud` standalone + `dartSdk: 3.8`, then upgrade. Do not use `serverpod cloud launch` with a 4.x CLI on a 3.4 project.

I think this is valuable. Then the plan applies to both, noting version-specific steps.

Let me include the exact env var/secret list:

```
scloud.yaml (in namma_quiz_server/)
project:
  projectId: namma-quiz
  dartSdk: "3.8"        # or 3.12 for Serverpod 4
  app:
    dir: "../namma_quiz_flutter"
  scripts:
    pre_deploy:
      - "serverpod generate"
      - "serverpod run flutter_build"
      # - "cd ../namma_quiz_jaspr && jaspr build && ...copy..."
```

Wait: hook commands run in the project directory (server package), so `serverpod run flutter_build` works if the script is in server pubspec. The server's `flutter_build` script does `cd ../namma_kahoot_flutter` (wrong). Fix paths. Also, on Windows, `cmd /c` and the script's `windows` variant uses `xcopy`. In CI/Linux, the posix variant. Since the deploy is from Windows, the windows variant runs. Fine.

`scloud.yaml` app dir is for mobile publishing only; optional. But include.

`.scloudignore`:
```
!web/app/
!web/app/**
```
Also `!web/jaspr/**` if applicable. And keep `config/passwords.yaml` gone (Cloud secrets).

Cloud commands:
```
dart install serverpod_cloud_cli
scloud auth login
cd namma_quiz_server
scloud launch          # creates project, DB, links scloud.yaml
# or scloud project create --enable-db ...
scloud password set redis "<upstash-pass>"
scloud variable set SERVERPOD_REDIS_HOST "<host>"
scloud variable set SERVERPOD_REDIS_PORT "6380"
scloud variable set SERVERPOD_REDIS_ENABLED "true"
scloud variable set SERVERPOD_REDIS_REQUIRE_SSL "true"
scloud variable set SERVERPOD_API_SERVER_PUBLIC_HOST "namma-quiz.api.serverpod.space"
scloud variable set SERVERPOD_API_SERVER_PUBLIC_PORT "443"
scloud variable set SERVERPOD_API_SERVER_PUBLIC_SCHEME "https"
scloud variable set SERVERPOD_WEB_SERVER_PUBLIC_HOST "namma-quiz.serverpod.space"
... 
scloud deploy --wet-run --show-files
scloud deploy
scloud status deployment show
scloud log
```

Note: `scloud launch` will prompt to copy passwords from `config/passwords.yaml`; file absent, fine. Auth keys auto.

Wait, does `scloud launch` add `serverpod generate` pre-deploy; it may also add `serverpod run flutter_build`. Docs say yes if defined.

DB migrations: Cloud applies automatically on deploy. Good.

Custom domain:
```
scloud domain attach nammaquiz.app --target web
scloud domain attach api.nammaquiz.app --target api
```
Then update public host variables & rebuild (Flutter/Jaspr API URL). Or keep default for first deploy.

Verification checklist:
- `curl` web/API.
- Open two browsers, one host + one player; start question; confirm events across podlets (scale to 2 to test Redis).
- Register email → currently logs; check.
- check `scloud log` for migration/seed.
- DB backup schedule.

Hardening:
- secure AdminEndpoint with `session.authenticated` or admin allowlist; derive hostId from auth.
- answers table unique `(playerId, questionId)`; reject duplicates; server-side timing.
- PIN collision loop + expiry; `Random.secure()`.
- JSON encode dataJson (not string interpolation).
- email provider.
- CORS/origin checks? Serverpod default.
- rate limiting on join/answer.
- seat capacity.
- disable seeding in production or make idempotent.
- error monitoring (Sentry) optional.

CI:
- GitHub Action with `SERVERPOD_CLOUD_TOKEN`, `scloud deploy` on main, `dart analyze`, tests. Pre-deploy `dart pub get`/`serverpod generate` check.

Open questions:
1. Upgrade to 4.1 now or ship 3.4.7 first?
2. Growth plan (no scale-to-zero) vs Starter?
3. Jaspr at root or keep landing + Flutter?
4. Custom domain?
5. Email provider?

I could use the question tool to ask these. Since the next step depends on decisions, and the user asked for a plan, I can ask 3 key questions with recommended defaults. The `question` tool allows multiple. But it might be overkill; still, it's designed for this. I'll include a concise question call with 4 questions? The tool asks them in one go. Let me use it after presenting the plan? The tool call output would show questions; the user picks. But I can't both present a long plan and ask via tool in the same message? I can: text then tool call. The tool's questions are the last thing. That seems good: present plan, then ask decisions.

However, the tool questions are separate UI; the user may appreciate. I'll ask:
1. "Runtime for the first deploy?" options: "Upgrade to Serverpod 4.1 first (Recommended)", "Deploy 3.4.7 now, upgrade later".
2. "Cloud plan?" options: "Growth, min 1 podlet (Recommended)", "Starter to trial (scales to zero)".
3. "Primary web UI?" options: "Jaspr at /, Flutter at /app", "Landing at /, Flutter at /app (Recommended for fastest)", "Flutter only".
4. "Custom domain?" options: "Default *.serverpod.space for now (Recommended)", "Custom domain now".
5. Maybe email: "Auth at launch?" options "Disable email signup for launch", "Integrate email provider now". But 5 is a lot. The tool allows multiple questions; 4 is okay.

Wait, the instructions: "When custom is enabled (default), a 'Type your own answer' option is added automatically; don't include 'Other'." Fine.

But the plan itself is already long. The final response should be the plan plus questions. The question tool call is a tool use; after its result, I'd respond. Actually, calling the question tool pauses for user input; the returned answer will come as a tool result and then I must respond. That's okay, but it may interrupt the plan delivery. The plan text is output before the tool call? In this interface, text and tool calls in the same message: the text is displayed, then questions. Good.

Hmm, but the user asked "plan for it" — maybe they just want the plan, and questions are a bonus. I'll provide the plan and end with a short "Decisions" line rather than the tool, to avoid overcomplicating. The guidelines favor concise. But the question tool is explicitly for gathering preferences. I'll use it for 3 decisions, as it makes the next step actionable.

Let me refine exact file references:
- `pubspec.yaml:8-10` (workspace paths)
- `namma_quiz_server/config/generator.yaml:3`
- `namma_quiz_jaspr/pubspec.yaml:14-15`
- `namma_quiz_flutter/pubspec.yaml:31-32`
- `namma_quiz_server/pubspec.yaml:31-36` (flutter_build paths)
- `namma_quiz_server/lib/server.dart:34-54` (routes)
- `namma_quiz_jaspr/lib/providers/client_provider.dart:1-5`
- `namma_quiz_server/config/production.yaml:32-50`
- `namma_quiz_server/lib/src/endpoints/admin_endpoint.dart` (no auth)
- `kahoot_endpoint.dart:53-68` and 193 for JSON injection.
- `server.dart:124-146` email logging.
- `server.dart:63-122` seeding.

Also the client workspace path issue: `dart pub get` error confirmed. Mention.

One nuance: The package names remain `namma_kahoot_*`, so `import 'package:namma_kahoot_client/...'` stays valid. Only paths need fixing. Good.

Another nuance: The root workspace needs to list `namma_quiz_client`, `namma_quiz_server`, `namma_quiz_jaspr`; and `namma_quiz_flutter` is not a workspace member (Flutter app). But `dart pub get` at root will resolve the three. The Flutter app does its own `flutter pub get`. Fine.

Also, the server `name: namma_kahoot_server` while its dir is `namma_quiz_server`; that's fine, but `serverpod` generator uses `client_package_path` and package name. The package name doesn't need to match the dir. For Cloud project ID, use `namma-quiz`.

Now, does Cloud's `.scloudignore` upload the entire workspace or just server dir? Docs: "In a workspace project, [scloud.yaml is] the *_server package directory" and "app publish uploads workspace packages it depends on". For server deploy, it packages the project; likely the whole workspace (server + client). The client is a dependency via path, so needed. The root workspace path fix is essential.

Do we need to include `namma_quiz_flutter` in the upload? The server's `flutter_build` pre-deploy builds locally, so the Flutter source isn't needed on the Cloud build, but the upload may include it if not gitignored. Its `build/` is gitignored. Fine. The package resolution on Cloud for the server: server depends only on serverpod packages, not the flutter app. Client is a path dep. Good.

Wait: `namma_quiz_server/pubspec.yaml` has `resolution: workspace`, so Cloud's `dart pub get` in the server dir uses the root workspace; the upload must include the root `pubspec.yaml` + `pubspec.lock`. Does scloud include the workspace root? It says for a workspace project it links at server dir; presumably it packages the workspace. Need to verify. If it only uploads the server dir, `resolution: workspace` would fail. Hmm. This is important. The docs say "In a workspace project, that's the *_server package directory" for `scloud.yaml`, and "If your Flutter app is part of a Dart workspace, the upload includes the workspace packages it depends on" (for app publishing). For server deploy, maybe it packages the workspace root. The CLI search "walks one level up" and "workspace project" support suggests it handles it. But to be safe, include `--show-files` and verify the root pubspec + client are included. If not, remove `resolution: workspace` from server (make it standalone) or restructure. Good to mention.

Actually, the root workspace pubspec currently includes the wrong dirs, so fix and verify upload includes `pubspec.yaml`, `pubspec.lock`, `namma_quiz_client/`, `namma_quiz_server/`. Use `scloud deploy --wet-run --show-files`.

Another option: since the server's `flutter_build` pre-deploy builds the Flutter web locally, the `namma_quiz_flutter` folder must exist locally, not in Cloud. Fine.

Now, about Cloud build version: if `dartSdk: "3.8"` but the project's root `pubspec.yaml` has `sdk: ^3.8.0`, Cloud picks 3.8. But the `pubspec.lock` was generated with Dart 3.13.5; packages may require >3.8? Let's check lock's SDK constraints? Not necessary; if `pub get` on 3.8 fails, pin 3.9/3.10 and upgrade Serverpod? For 3.4.7, Dart 3.8 is safe. But the lockfile may resolve packages requiring 3.9+. Since Serverpod 3.4.7 is pinned, transitive deps are pinned by lock. `dart pub get` with 3.8 might choose older versions if lock allows. Fine.

Alternatively pin 3.9/3.10. The docs default 3.8. I'd say `dartSdk: "3.8"` for 3.4.7 and validate; if pub resolution complains, bump to 3.9/3.10.

Now, do I need to mention `dart compile exe` Dockerfile? Cloud doesn't use it, so ignore. If they deploy custom, not.

Let me write the final response. Keep it clear and actionable. I'll use headers and bullets, with code blocks. Then a question tool call with 3-4 decisions? The output length is already significant. The question tool is a nice way to close. But the instructions say "Only use emojis if requested" — no emojis. Avoid emojis even in headings? The README uses them, but my response shouldn't. No emojis.

I should not say "I will" or claim modifications. Just plan.

Let me ensure no false claims:
- "Cloud CLI is 4.0+" — docs say Serverpod CLI 4.0+ if using `serverpod cloud`; standalone `scloud` install works. I'll say "install standalone `scloud` so you don't need the 4.x Serverpod CLI".
- "3.4.7 deployable" — uncertain. I'll phrase: "3.4.7 is EOL and Cloud docs assume 4.x; validate with a throwaway deploy early. If the build is rejected, upgrade." Not assert it works.
- "Cloud injects DB env" — confirmed.
- "Cloud sets auth keys" — confirmed.
- "Cloud doesn't provide Redis" — confirmed.
- "Starter always scales to zero" — confirmed.
- "`.gitignore` excludes files from deploy unless negated in `.scloudignore`" — confirmed.

Now, the plan's first item "fix workspace paths" includes a note that the package names remain `namma_kahoot_*` (imports unchanged).

Let me draft the final text.

---

**Deployment plan**

**Target** ... 

**0. Blockers found in the repo (fix first)**
1. Workspace is broken ... `dart pub get --dry-run` fails. Fix root pubspec paths and all path deps.
2. `.gitignore` excludes `web/app` ... add `.scloudignore`.
3. Production config is still examplepod + Redis disabled. Cloud supplies DB but not Redis/public URL; plan values.
4. Web clients: Jaspr hardcodes localhost and uses an invalid relative import; Flutter web gets API URL from `/app/assets/assets/config.json` built from `apiServer.publicHost`, which must be correct.
5. Server code production gaps: no auth on AdminEndpoint, email codes only logged, duplicate answer submission, seed on every cold start, JSON string interpolation.

**1. Choose runtime**
- Recommended: upgrade to 4.1; else freeze 3.4.7 and pin Dart 3.8.
- Table of effort.

**2. Prepare repo**
- fix paths; `dart pub get`; `serverpod generate`; `serverpod create-migration` if needed; run `flutter build web --base-href /app/ --wasm`; add `.scloudignore`; add `scloud.yaml`; decide Jaspr.
- Commit generated code + migrations.

**3. Create Cloud project**
- commands; DB enabled; region; plan.

**4. Set Cloud config/secrets**
- env list; Redis Upstash; auth; email; public hosts; session logs.

**5. Deploy**
- wet run/show files; deploy; status; logs.

**6. Verify**
- checklist.

**7. Harden before public**
- list.

**8. CI**
- optional.

**Decisions needed**.

I think that's good. Let me write it with file refs and exact commands. Keep line count maybe ~100; that's okay for a plan.

Should I use the question tool? I'll end with "Tell me which runtime/plan/web target you want and I'll start with Phase 0." That's enough, no tool. But the question tool would be nicer. The user asked for a plan; I'll provide and ask 3 questions via the tool. Hmm, the question tool's options need labels and descriptions. Let me do it — it makes the next step explicit.

Questions:
1. Runtime: "Upgrade to Serverpod 4.1 first (Recommended)" / "Deploy 3.4.7 now, upgrade later"
2. Cloud plan: "Growth, min 1 podlet (Recommended)" / "Starter (scales to zero)"
3. Web UI: "Flutter /app + landing (Recommended)" / "Jaspr at root + Flutter /app" / "Flutter only"
4. Domain: "Default *.serverpod.space (Recommended)" / "Custom domain now"

Four questions might be okay. The user can answer or type custom. But the plan already recommends; asking may be redundant. Given the next step is implementation, these decisions matter. I'll ask 3, skipping domain (default is obvious for first deploy).

Actually, the instruction for the question tool: "Use this tool when you need to ask the user questions during execution... Clarify ambiguous instructions... Get decisions on implementation choices as you work." Perfect. I'll ask.

One more thing: the plan should mention "Cloud's web URL is served through the CDN; add cache headers for FlutterRoute/Jaspr static assets". This is an optimization, not blocker.

Also "Session logs: set consoleEnabled false in production, persistentEnabled true; use `scloud log`". Good.

Let me write.

Potential correction: `StaticRoute.file(File('web/pages/index.html')), '/'` — if we host Jaspr at root, replace. If keeping the landing, the landing references `/static/css/style.css` which exists. Good.

Flutter web `getServerUrl`: It likely fetches `assets/assets/config.json`; the route returns `apiUrl`. If we set `SERVERPOD_API_SERVER_PUBLIC_HOST` etc., the route returns the right URL. Also the Flutter app's bundled `assets/config.json` (localhost) might be fetched first? Serverpod's `getServerUrl` checks `SERVER_URL` dart-define, then `assets/config.json` (the bundled one), and only then maybe the server route? Let me check. The comment says "fetched from the assets/config.json file or defaults to localhost". The server route is `/app/assets/assets/config.json` which is the same path the bundle uses (`assets/assets/config.json`), so the server route overrides the bundled file for web. On mobile, the bundled `assets/config.json` is used, which is localhost unless `--dart-define=SERVER_URL` is passed. For Cloud app publishing, Cloud auto-sets `SERVER_URL`. For manual mobile builds, pass `--dart-define`. Good.

Wait, the bundled path in the Flutter app is `assets/config.json` (source) → in the built bundle, `assets/assets/config.json`. The server route `/app/assets/assets/config.json` returns the API URL. Correct.

One more: the server's `AppConfigRoute` builds `Uri(scheme, host, port)`. If `publicPort` is 443 and scheme https, `Uri` omits the port (default). Good.

Now, the `webServer` public host: if Cloud's web URL is `<project>.serverpod.space`, set `SERVERPOD_WEB_SERVER_PUBLIC_HOST` accordingly. The `webServer` config is used for? Possibly for `SpaRoute` redirects. Not critical, but set for consistency.

Cloud's default web URL maybe `<project>.serverpod.space` and API `<project>.api.serverpod.space`. If project ID `namma-quiz`, use `namma-quiz.api.serverpod.space`. Fine.

Do I need to mention region for Cloud? Cloud may be EU-only; Upstash EU-CENTRAL-1. Not sure. I'll say "pick the Cloud region closest to your users; match the Upstash region".

Let's write the final answer.

## Namma Quiz → Serverpod Cloud deployment plan

### 0. Blockers I found in the repo (fix before any deploy)

1. **The Dart workspace is currently broken.** `dart pub get` fails:
   `No workspace packages matching 'namma_kahoot_client'`.
   - Root `pubspec.yaml:8-10` lists old `namma_kahoot_*` directories.
   - Path deps still point at old dirs: `namma_quiz_server/config/generator.yaml:3`, `namma_quiz_jaspr/pubspec.yaml:14-15`, `namma_quiz_flutter/pubspec.yaml:31-32`.
   - `namma_quiz_server/pubspec.yaml:31-36` (`flutter_build` script) also uses old paths.
   - Package names can stay `namma_kahoot_*`; only the paths need fixing.

2. **Cloud will not upload your built web apps by default.** `namma_quiz_server/.gitignore` ignores `web/app`, and Cloud excludes anything in `.gitignore`. You need a `.scloudignore` with `!web/app/` and `!web/app/**`.

3. **`config/production.yaml` is still the template.** It has `examplepod.com` hosts and `redis.enabled: false`. Cloud injects Postgres env vars, but it does **not** provide Redis, and public URLs must be set correctly (see step 4).

4. **Web clients point at localhost.**
   - `namma_quiz_jaspr/lib/providers/client_provider.dart:1-5` hardcodes `http://localhost:8080` and uses an invalid relative import into another package.
   - Flutter web gets its API URL from `/app/assets/assets/config.json`, which is generated from `apiServer.publicHost` (`lib/server.dart:42-45`). That host must resolve to the Cloud API URL.

5. **Production-readiness gaps in server code**
   - `admin_endpoint.dart` has no authentication: anyone can create/delete quizzes.
   - Email verification codes are only logged (`lib/server.dart:124-146`).
   - `submitAnswer` (`kahoot_endpoint.dart:113`) accepts unlimited submissions per player per question.
   - `dataJson` is built with string interpolation (`kahoot_endpoint.dart:64,193`) → broken JSON for names containing quotes.
   - `_seedDefaultQuiz` (`lib/server.dart:63`) runs on every cold start and can duplicate under multiple podlets.
   - `createGame` does not retry on PIN collisions.

### 1. Decide the runtime version

Serverpod Cloud docs and tooling now assume **Serverpod 4.x**; 3.4.7 is EOL. Two options:

| Option | Effort | Notes |
|---|---|---|
| **Upgrade to 4.1 first (recommended)** | ~1 day | Needs Flutter 3.44.4+/Dart 3.12.2, package bumps, `serverpod generate`, one migration, breaking-change fixes. Cleanest Cloud fit. |
| **Ship 3.4.7 first** | Low | Use standalone `scloud` (not `serverpod cloud`), pin `dartSdk: "3.8"` in `scloud.yaml`, validate with an early throwaway deploy. Upgrade later. |

Do not run `serverpod cloud launch` with a 4.x CLI against a 3.4.7 project.

### 2. Prepare the repo

```bash
# after fixing workspace/path references
dart pub get
cd namma_quiz_server
serverpod generate
serverpod create-migration   # only if models changed
```

Add `namma_quiz_server/scloud.yaml`:

```yaml
project:
  projectId: namma-quiz
  dartSdk: "3.8"             # 3.12+ after Serverpod 4 upgrade
  scripts:
    pre_deploy:
      - "serverpod generate"
      - "serverpod run flutter_build"
```

Add `namma_quiz_server/.scloudignore`:

```gitignore
# build outputs are gitignored but must be deployed
!web/app/
!web/app/**
# add if you host Jaspr from the server
!web/jaspr/
!web/jaspr/**
```

Verify the upload contents before deploying:

```bash
scloud deploy --wet-run --show-files
```

Check that the upload includes the workspace root `pubspec.yaml`, `pubspec.lock`, and `namma_quiz_client/` (the server has `resolution: workspace`).

### 3. Create the Cloud project

```bash
dart install serverpod_cloud_cli
scloud auth login

cd namma_quiz_server
scloud launch          # creates project + managed Postgres, links scloud.yaml
# or: scloud project create --enable-db ...
```

Choose **Growth** for a live quiz product. Starter always scales to zero, which adds a 4–6 s cold start on the first connection and can exceed the default 5 s streaming timeout. On Growth, set **Min podlets = 1**.

### 4. Configure Cloud secrets and variables

Postgres is automatic. Redis is required because gameplay is built on `session.messages` and works across podlets only with Redis:

```bash
# Upstash Redis (TLS, same region as Cloud)
scloud password set redis "<upstash-password>"
scloud variable set SERVERPOD_REDIS_HOST "<upstash-host>"
scloud variable set SERVERPOD_REDIS_PORT "6380"
scloud variable set SERVERPOD_REDIS_ENABLED "true"
scloud variable set SERVERPOD_REDIS_REQUIRE_SSL "true"
```

Set public URLs so `AppConfigRoute` and auth redirects are correct:

```bash
scloud variable set SERVERPOD_API_SERVER_PUBLIC_HOST "namma-quiz.api.serverpod.space"
scloud variable set SERVERPOD_API_SERVER_PUBLIC_PORT "443"
scloud variable set SERVERPOD_API_SERVER_PUBLIC_SCHEME "https"

scloud variable set SERVERPOD_WEB_SERVER_PUBLIC_HOST "namma-quiz.serverpod.space"
scloud variable set SERVERPOD_WEB_SERVER_PUBLIC_PORT "443"
scloud variable set SERVERPOD_WEB_SERVER_PUBLIC_SCHEME "https"
```

Auth keys for `serverpod_auth_idp_server` are auto-provisioned by Cloud. Add any email provider key later with `scloud password set <name> "<value>"`. Keep `config/passwords.yaml` out of git; Cloud secrets replace it.

### 5. Web hosting decision

- **Fastest path:** keep `web/pages/index.html` at `/`, Flutter web at `/app/*` (current `lib/server.dart:34-54`). Fix the Flutter build script paths and ensure `web/app` is uploaded.
- **Full web UI:** also build Jaspr and serve it at `/` with `SpaRoute(Directory('web/jaspr'), fallback: 'index.html')`, keeping `/app/*` for Flutter. Fix `client_provider.dart` to use `package:namma_kahoot_client/...` and `String.fromEnvironment('SERVER_URL')`.

Add cache headers for static assets (`FlutterRoute`/`SpaRoute` `cacheControlFactory`): short browser `max-age`, long `s-maxage`; Cloud purges the CDN on each deploy.

### 6. Deploy and verify

```bash
scloud deploy
scloud status deployment show
scloud log
```

Verify:
- web URL loads, `/app` loads Flutter, API URL responds
- migrations applied and no `Failed to apply database migrations`
- host + player in two browsers receive `PLAYER_JOINED`, `QUESTION_STARTED`, `ANSWER_RECEIVED`
- scale to 2 podlets and repeat the stream test (proves Redis pub/sub)
- auth registration/login path
- custom domain TLS if attached

### 7. Harden before public launch

- Authenticate `AdminEndpoint` and derive `hostId` from the session, not the client.
- Add an `answers` table with a unique `(playerId, questionId)` constraint; reject duplicate submissions.
- Replace logged verification codes with a real email provider.
- Use `jsonEncode` for `dataJson`.
- Retry PIN generation on collision and expire old sessions.
- Make seeding idempotent or move it into a migration/seed script.
- Set client `connectionTimeout` / `streamingConnectionTimeout` for Cloud wake-ups.
- Schedule database backups in the Cloud console.

### 8. Optional CI

GitHub Actions with `SERVERPOD_CLOUD_TOKEN`; run `dart analyze`, tests, `serverpod generate`, then `scloud deploy` on `main`.

### Decisions needed

Before I start changing files, I need three choices:

**Tool: question**

**Input:**
```json
{
  "questions": [
    {
      "question": "Which runtime should the first Cloud deploy target?",
      "header": "Runtime",
      "options": [
        {
          "label": "Upgrade to Serverpod 4.1 first (Recommended)",
          "description": "Align with current Cloud tooling and avoid EOL 3.4.7; takes about a day of migration work."
        },
        {
          "label": "Deploy 3.4.7 now",
          "description": "Fastest path; pin Dart 3.8, use standalone scloud, and validate with a throwaway deploy."
        }
      ]
    },
    {
      "question": "Which Cloud plan should the project use?",
      "header": "Cloud plan",
      "options": [
        {
          "label": "Growth with min 1 podlet (Recommended)",
          "description": "Avoids cold starts and scale-to-zero interruption during live quizzes."
        },
        {
          "label": "Starter for initial testing",
          "description": "Free trial, but always scales to zero; first request after idle is slow."
        }
      ]
    },
    {
      "question": "What should be served at the web root?",
      "header": "Web UI",
      "options": [
        {
          "label": "Landing page, Flutter at /app (Recommended)",
          "description": "Smallest change; current server routes already support it."
        },
        {
          "label": "Jaspr at /, Flutter at /app",
          "description": "Uses the full Jaspr SPA for home/host/player/admin; requires build and route changes."
        },
        {
          "label": "Flutter only",
          "description": "Serve the Flutter web app at the root and drop the landing page and Jaspr."
        }
      ]
    }
  ]
}
```

**Output:**
```
User has answered your questions: "Which runtime should the first Cloud deploy target?"="Upgrade to Serverpod 4.1 first (Recommended)", "Which Cloud plan should the project use?"="Growth with min 1 podlet (Recommended)", "What should be served at the web root?"="jaspr only for both admin and quiz screen". You can now continue with the user's answers in mind.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 25.1s)

_Thinking:_

The user answered:
1. Upgrade to Serverpod 4.1 first.
2. Growth min 1.
3. Jaspr only for both admin and quiz screen.

"jaspr only for both admin and quiz screen" — they want Jaspr as the only web UI (no Flutter web? "for both admin and quiz screen" suggests Jaspr handles admin and quiz screens, i.e., Jaspr is the web UI). So web root = Jaspr, no Flutter web on web. Flutter remains mobile/desktop app. We should drop Flutter web build from the server (or keep it available but not primary). The answer says "Jaspr only for both admin and quiz screen" — so serve Jaspr at `/` (SPA) covering `/`, `/play`, `/host`, `/admin`. Remove/retire the landing page and Flutter web serving from server, or leave Flutter app for mobile only. That simplifies: no `flutter_build` pre-deploy; instead `jaspr build` and copy to `web/`.

Now I need to adapt the plan to Serverpod 4.1 + Jaspr-only + Growth. Since they answered decisions, the natural next step is to start implementing? The user originally said "plan for it". They answered the decisions. I should present the revised, concrete plan for the chosen path, and ask whether to proceed with implementation. Or just start? The system says don't be overly proactive, but they made decisions. A plan was requested; now refine the plan into an actionable checklist for the chosen path. I should not start changing files without explicit "go ahead" — but the answers imply they want the plan tailored. Let me provide the tailored plan and offer to start Phase 0.

Need to incorporate Serverpod 4.1 upgrade specifics:
- Flutter 3.44.4+ / Dart 3.12.2. Local `.fvmrc` 3.41.1 must be bumped. Cloud Dart 3.12 or 3.13.
- Bump `serverpod`, `serverpod_client`, `serverpod_flutter`, `serverpod_auth_idp_*`, `serverpod_test` to 4.1.x. The docs example uses 4.0.0; latest 4.1.0. Use exact pins.
- Update Dart SDK constraints in root and server to `^3.12.2` (or `^3.12.0`).
- `serverpod generate`; expect breaking changes. Check `server.dart`: `Serverpod(args, Protocol(), Endpoints())` still works per docs ("Projects that keep their existing imports can stay on Serverpod(args, Protocol(), Endpoints())"). But `initializeAuthServices` may have changed. The upgrade requires code changes. We'll find them via analyzer.
- `serverpod create-migration --tag upgrade-4-0 --force`.
- New Dockerfile if compiling; Cloud doesn't use it. But we can update it anyway or ignore.
- `session.messages` in 4.x? Still available. Auth APIs changed (JWT config maybe). Email IDP config may be similar. The upgrade guide says breaking changes; we'll handle.
- Cloud artifacts: `scloud.yaml` `dartSdk: "3.12"` (or let constraint 3.12.2 pick 3.13). Better pin `"3.12"` for stability? Cloud supports 3.12 and 3.13. Serverpod 4.1 likely supports 3.12+. Use `3.12` to match Flutter 3.44.4. Actually Serverpod 4.1 may require Dart 3.12.2; Cloud's `3.12` means 3.12.x highest (3.12.2?). Use `dartSdk: "3.12"`. Or omit and let constraint choose highest 3.13. I'd pin 3.12.
- In 4.x, the root workspace should list the packages. Fix paths.
- In 4.x, `config/passwords.yaml` is auto-generated by `serverpod create`? Our repo lacks it. Upgrade docs say new passwords file. Locally we need one for dev; we can create it (gitignored) with DB/redis/serviceSecret. Cloud provides secrets. For the upgrade, `serverpod generate` may need the passwords file? Probably not. But running locally needs it. Plan includes creating a local `passwords.yaml` (not committed) with random values.
- Serverpod 4 `serverpod start` runs embedded Postgres by default if `dataPath` set; our dev config uses Docker on 8090. We can keep Docker. Not critical for Cloud.
- Jaspr: Serverpod 4's web server uses `pod.webServer` same. `SpaRoute` is available. Need to build Jaspr and copy to server `web/jaspr`. The Jaspr package is on 0.23.1; compatible with Dart 3.12? Jaspr 0.23.1 likely supports Dart 3.8+. But with Dart 3.12, maybe newer Jaspr needed. Check latest Jaspr? Not necessary; `dart pub upgrade` will resolve. Actually `jaspr: ^0.23.1` allows newer 0.x? Caret on 0.23.1 means >=0.23.1 <0.24.0. Fine. `jaspr_riverpod: any` resolves. `build_web_compilers ^4.8.0` may need updates for Dart 3.12. We'll see.
- Jaspr is a workspace member (server? no, jaspr depends on client). The server doesn't depend on jaspr. The build can be a pre-deploy hook: `cd ../namma_quiz_jaspr && jaspr build` + copy to `../namma_quiz_server/web/jaspr`. But hooks run in server dir. The pubspec script can define a `jaspr_build` script. Or simpler, define `pre_deploy` in scloud.yaml with two commands. On Windows, use `cmd /c` compatible commands. `scloud` runs hooks through `cmd /c` on Windows. A command like `cd ..\namma_quiz_jaspr && jaspr build && xcopy ...` works. Cross-platform (CI) needs posix. Could add a Dart script in server `tool/build_web.dart` that runs the build and copies, making it cross-platform. That's a nice approach: `dart run tool/build_web.dart` as pre-deploy. It shells out to `jaspr build` and copies. Or use Serverpod `scripts` in pubspec with windows/posix variants, then `serverpod run jaspr_build` (4.x supports scripts). I'd recommend a small Dart script for cross-platform.
- Since "Jaspr only", remove the Flutter web build from the server's `pubspec.yaml` scripts (or keep only for local testing). Remove `FlutterRoute` and `/app` route? The user says Jaspr only for admin and quiz screen. So the server should serve Jaspr at root and drop the Flutter web route and landing page. The Flutter app remains a mobile/desktop client (it can still connect to Cloud API). We might keep `/app` route as optional but it's unnecessary. Cleaner: remove `web/pages` + `web/static` and serve `SpaRoute(web/jaspr)`. Or keep `web/static` if Jaspr build references it? Jaspr build includes its own assets in `build/jaspr`. So remove server landing.
- Jaspr build output is static; `jaspr build` produces `build/jaspr` by default. Need to handle base href. Since served at root, no base href needed. The Jaspr `web/index.html` references `main.dart.js` and `styles/main.css` relatively; at `/host`, relative paths resolve to `/styles/main.css`? The browser resolves relative URL `styles/main.css` against `/host` → `/styles/main.css`? Actually relative to current path `/host` (no trailing slash) → `/styles/main.css`; correct. At `/host/` it'd be `/host/styles/main.css`. The SPA fallback serves index at `/host`, so relative works. But deep routes `/host/room/123` would break relative assets. Better set `<base href="/">` in the Jaspr index, or ensure `SpaRoute` handles. Jaspr's build likely uses absolute `/main.dart.js`? The source index uses relative. For robust SPA routing, add `<base href="/">` to the Jaspr `web/index.html` (Jaspr may support). Or keep routes shallow. We'll note.
- Jaspr `SERVER_URL`: Use `String.fromEnvironment('SERVER_URL')` read in `client_provider.dart`, with a default `http://localhost:8080/` for dev. For production, the build hook passes `--dart-define=SERVER_URL=https://namma-quiz.api.serverpod.space/`. Does `jaspr build` support `--dart-define`? Jaspr CLI has `--dart-define`? I believe `jaspr build` supports `-D`/`--dart-define` (it uses build_runner/dart compile). Let me verify quickly via docs? Could search. Alternatively, generate a config file in the build script (`web/config.json`) and fetch at runtime. But a compile-time env is simpler. If `jaspr build` doesn't support `--dart-define`, use `dart_define` in `jaspr.yaml`? There's `jaspr` config in pubspec. Hmm. Let me verify Jaspr CLI build options. Search web quickly? This is a detail for implementation, not the plan. I can say "inject SERVER_URL at build time (dart-define or generated config)". Fine.
- CORS: Jaspr served from `namma-quiz.serverpod.space` calls API at `namma-quiz.api.serverpod.space` → cross-origin. Serverpod's API server must allow the web origin. Does Serverpod configure CORS? In 3.x/4.x, the API server may not send CORS headers by default; the generated client uses WebSockets and HTTP POST. Browsers enforce CORS for HTTP requests. Serverpod Cloud might set CORS automatically? Need to check. This is critical for a browser SPA hosted on a different subdomain than the API. Serverpod 4 web auth has httpOnly cookies; CORS config matters. Let's research: Serverpod API server CORS. Search docs.

**Tool: websearch**

**Input:**
```json
{
  "query": "Serverpod 4 CORS configuration api server web client different origin Serverpod Cloud",
  "numResults": 6
}
```

**Output:**
```
{
  "search_id": "search_2c14fbcf5ca2dd8b8f70f01ed5ee3469",
  "results": [
    {
      "url": "https://docs.serverpod.dev/concepts/endpoints-and-apis/configure-http-calls",
      "title": "Configure HTTP calls | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConfigure HTTP calls\n\nTwo situations call for customizing how your app sends requests: a web app that must include cookies on cross-origin calls, and apps that want the platform-native network stacks on iOS and Android. Both are handled by the httpClientOverride parameter on the generated Client , which swaps the underlying HTTP transport. The serverUrl in the examples below is the resolved server address from calling endpoints .\n\nInclude CORS credentials on web ​\n\nBy default, browser requests do not include cookies or HTTP authentication credentials in cross-origin requests. If your app relies on cookie-based sessions or similar mechanisms, pass a BrowserClient with withCredentials enabled:\nimport 'package:http/browser_client.dart' ; final client = Client ( serverUrl , httpClientOverride : BrowserClient ( ) . . withCredentials = true , ) ;\n\nAllow credentials on the server ​\n\nOn the server, Serverpod adds CORS headers to API responses by default through httpResponseHeaders and httpOptionsResponseHeaders on the Serverpod constructor. The defaults allow cross-origin POST requests from any origin ( Access-Control-Allow-Origin: * ) and permit common request headers such as Authorization on preflight OPTIONS requests.\nCredential-aware requests require Access-Control-Allow-Credentials: true and a specific origin instead of the wildcard. Override the defaults in your lib/server.dart (or wherever you construct Serverpod ):\nimport 'src/generated/serverpod.dart' ; /// The starting point of the Serverpod server. void run ( List < String > args ) async { final pod = Serverpod ( args , httpResponseHeaders : Headers . build ( ( mh ) { mh . accessControlAllowOrigin = AccessControlAllowOriginHeader . origin ( origin : Uri . parse ( 'localhost:49660' ) , // Your Flutter web app origin ) ; mh . accessControlAllowCredentials = true ; mh . accessControlAllowMethods = AccessControlAllowMethodsHeader . methods ( [ Method . post ] , ) ; } ) , httpOptionsResponseHeaders : Headers . build ( ( mh ) { mh . accessControlAllowHeaders = AccessControlAllowHeadersHeader . headers ( [ 'Content-Type' , 'Authorization' , 'Accept' , 'User-Agent' , 'X-Requested-With' , ] ) ; } ) , ) ; // Start the server await pod . start ( ) ; }\nSet origin to the exact origin of your Flutter web app (scheme, host, and port). In production, list each allowed origin explicitly.\n\nUse platform-native HTTP clients ​\n\nYou can also override the default HTTP client with a platform-native HTTP client. On iOS and macOS, you can use cupertino_http to route traffic through NSURLSession . On Android, you can use cronet_http to use the Cronet network stack.\nAdd the corresponding package to your Flutter app's pubspec.yaml before using these clients.\nimport 'dart:io' ; import 'package:cronet_http/cronet_http.dart' ; import 'package:cupertino_http/cupertino_http.dart' ; import 'package:http/http.dart' as http ; import 'package:my_project_client/my_project_client.dart' ; void main ( ) async { http . Client ? httpClient ; if ( Platform . isAndroid ) { final engine = CronetEngine . build ( cacheMode : CacheMode ."
      ]
    },
    {
      "url": "https://github.com/serverpod/serverpod/discussions/1800",
      "title": "Seeking Assistance with CORS Configuration for webserver on serverpod · serverpod/serverpod · Discussion #1800 · GitHub",
      "publish_date": "2024-01-23",
      "excerpts": [
        "Seeking Assistance with CORS Configuration for webserver on serverpod\n\n* Page: GitHub discussion\n* URL: github.com/serverpod/serverpod/discussions/1800\n* Status: Answered by pawelzny\n* Author: miraieyes\n* Created: 2024-01-23T13:30:31Z\n* Repository: serverpod/serverpod\n* Discussion: #1800\n* Category: q-a\n* Comments: 3\nHello Serverpod Community,\nI've been exploring Serverpod and am currently in the process of transferring an older project to it. While utilizing the web server, I've encountered a CORS (Cross-Origin Resource Sharing) block error with my Flutter web app, preventing the proper loading of the application. I've come across a couple of suggestions, but unfortunately, none specifically address the configuration for the Serverpod web server.\nI would appreciate any guidance on configuring the Serverpod web server to permit specific origins, thus addressing this CORS issue for my older project. Thank you for your assistance.\n\nComments\n\nvlidholt commented on 2024-02-05T19:55:40Z:\nCORS should be set with sufficient permissions in the API by default. If you are using the web server, it's possible that you need to configure the headers yourself. You can access them through the http request on the session object.\newann commented on 2024-04-21T12:21:10Z:\nThis discussion thread is a first page of google for this question. Since there is a chance I want to do this again:\nTotally inappropriate for prod, 😅 but will work in dev:\nmodified server.dart\nimport 'dart:io';\n\nimport 'package:serverpod/serverpod.dart';\n\nimport 'package:base_serverpod_uvapp_server/src/web/routes/root.dart';\n\nimport 'src/generated/protocol.dart';\nimport 'src/generated/endpoints.dart';\nimport 'package:serverpod_auth_server/module.dart' as auth;\n\n\n// This is the starting point of your Serverpod server. In most cases, you will\n// only need to make additions to this file if you add future calls,  are\n// configuring Relic (Serverpod's web-server), or need custom setup work.\n\n...\n\n// Start the server.\n  await pod.start();\n}\nmodified root.dart\nimport 'dart:io';\n\nimport 'package:base_serverpod_uvapp_server/src/web/widgets/default_page_widget.dart';\nimport 'package:serverpod/serverpod.dart';\n\nclass RouteRoot extends WidgetRoute {\n  @override\n  Future<Widget> build(Session session, HttpRequest request) async {\n    request.response.headers.add('Access-Control-Allow-Origin', '*');\n    request.response.headers.add('Access-Control-Allow-Methods', 'GET, POST');\n    request.response.headers.add('Access-Control-Allow-Headers', 'Origin');\n    return DefaultPageWidget();\n  }\n}\nwhich at least in my case, is enough to get me where I needed to be\npawelzny commented on 2026-03-31T06:32:42Z:\n\nIf someone still struggle in 2026, this is it:\n\n# server.dart\n\n/// The starting point of the Serverpod server.\nvoid run(List<String> args) async {\n  // Initialize Serverpod and connect it with your generated code.\n  final headers = Headers.build((h) {\n    h.accessControlAllowOrigin = AccessControlAllowOriginHeader.wildcard();\n    h.accessControlAllowMethods = AccessControlAllowMethodsHeader.methods([\n      Method.get,\n      Method.post,\n      Method.options,\n      Method.head,\n    ]);\n    h.accessControlAllowHeaders = AccessControlAllowHeadersHeader.wildcard();\n  });\n\n  final pod = Serverpod(\n    args,\n    Protocol(),\n    Endpoints(),\n    httpResponseHeaders: headers,\n    httpOptionsResponseHeaders: headers,\n  );\n \n  # ... the rest of the initialization\n);\n\nSafety measures\n\nInstead of the .wildcard() which yields \"*\" , use the domain you want to allow."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/lookups/configuration-reference",
      "title": "Configuration reference | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConfiguration reference\n\nEvery configuration option Serverpod's core library reads. Options come from three sources: the config/<run-mode>.yaml files, environment variables, and the ServerpodConfig Dart object. Environment variables override the YAML files. If you pass a ServerpodConfig to the Serverpod constructor, the server ignores the YAML files and environment variables. Command-line options such as --mode still override the values in your ServerpodConfig . For how to choose between them, see Configuration .\n\nRun options ​\n\n...\n\nServer and services ​\n\nPorts, hosts, and connection settings for the API, Insights, and web servers, the database, Redis, session logs, and future calls, plus a few options that exist only on the Dart config object or as environment variables.\n* Environment variable | Config file | Default | Description\n* SERVERPOD_API_SERVER_PORT | apiServer.port | 8080 | The port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_HOST | apiServer.publicHost | localhost | The public host address of the API server\n* SERVERPOD_API_SERVER_PUBLIC_PORT | apiServer.publicPort | 8080 | The public port number for the API server\n* SERVERPOD_API_SERVER_PUBLIC_SCHEME | apiServer.publicScheme | http | The public scheme (http/https) for the API server\n\n...\n\n* SERVERPOD_WEB_SERVER_PORT | webServer.port | - | The port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_HOST | webServer.publicHost | - | The public host address of the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_PORT | webServer.publicPort | - | The public port number for the Web server\n* SERVERPOD_WEB_SERVER_PUBLIC_SCHEME | webServer.publicScheme | - | The public scheme (http/https) for the Web server\n\n...\n\n* SERVERPOD_ALLOWED_ORIGINS | allowedOrigins | - | Browser origins allowed to make credentialed cross-origin calls, as scheme://host[:port] . A YAML list, or comma-separated in the environment variable. Required when authCookie is set. When set, browser WebSocket connections for streaming from other origins are also rejected, with or without authCookie . See Web authentication .\n* SERVERPOD_AUTH_COOKIE_NAME | authCookie.name | - | Name of the auth cookie. Defaults to serverpod_auth . Setting any authCookie field enables cookie auth for web clients; an empty authCookie section is read as unset."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/web-server/overview",
      "title": "Overview | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nOverview\n\nServerpod comes with a built-in web server that runs beside the API server. It serves anything that speaks plain HTTP: REST APIs and webhooks, static files, server-rendered HTML with templates or Jaspr , and single-page apps including Flutter web. Web requests get the same Session your endpoint methods receive, with full access to your database and business logic. The web server is built on the Relic framework, and its routing engine, middleware system, and typed headers are available directly.\nThe web server and the API server answer different callers. Endpoints are the typed methods your own app calls through the generated client. Web server routes serve everyone else: browsers, webhooks, third-party services, and anything that needs a URL. If you are building a feature for your Flutter app, write an endpoint. If something outside your app needs to reach your server over HTTP, write a route.\n\nYour first route ​\n\nNew Serverpod projects set up the web server by default, with working web code in lib/src/web/ and assets in web/ . Here's how to add a simple JSON route:\nimport 'dart:convert' ; import 'package:serverpod/serverpod.dart' ; class HelloRoute extends Route { @override Future < Result > handleCall ( Session session , Request request ) async { return Response . ok ( body : Body . fromString ( jsonEncode ( { 'message' : 'Hello from Serverpod!' } ) , mimeType : MimeType . json , ) , ) ; } }\nRegister the route in your server.dart file before starting the server:\npod . webServer . addRoute ( HelloRoute ( ) , '/api/hello' ) ; await pod . start ( ) ;\nVisit localhost:8082/api/hello to see your response. Port 8082 is the web server's default development port, configured per run mode in the server configuration .\ninfo\nIf your project was created with the \"None\" web server option, the first use of pod.webServer throws Bad state: Web server is disabled . To enable it, add the webServer section to your config/<run mode>.yaml files and register at least one route before pod.start() . With a configuration but no routes, the web server simply does not start.\n\n...\n\nGoing to production ​\n\nWhen you deploy, the web server ships with the rest of your project. On Serverpod Cloud , it is served through a CDN that honors the cache headers your routes set. See Content delivery and caching for how the two interact.\n\nNext steps ​\n\n* Routing - Match requests to handlers by method and URL pattern\n* Request data - Access path parameters, query parameters, headers, and body\n* Web server middleware - Intercept and transform requests and responses\n* Static files - Serve static assets\n* Server-side HTML - Render HTML on the server with templates or Jaspr\n* Single-page apps - Serve SPAs with client-side routing\n* Flutter web - Serve Flutter web applications\nEdit this page\nPrevious Custom overrides Next Routing"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/server-fundamentals/configuration",
      "title": "Configuration | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.1.0 Copy as Markdown\nOn this page\n\nConfiguration\n\nConfiguration decides what your server listens on, which database and Redis (an in-memory store Serverpod can use for pub/sub and caching) it connects to, and how it behaves in each run mode, so the same code runs locally, in staging, and in production without edits. Serverpod reads configuration from three sources: the config/<run-mode>.yaml files, environment variables, and a ServerpodConfig Dart object passed to the Serverpod constructor. Environment variables override matching keys in the YAML files, and a Dart object replaces both.\nWith no configuration at all, Serverpod falls back to built-in defaults, so you can start with nothing and add configuration as you need it.\n\nHow configuration works ​\n\n...\n\nDefaults ​\n\nIf no YAML config files exist, no environment variables are configured, and no Dart config is supplied, the server runs with this built-in default: the API server on port 8080 at localhost .\nServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , ) ;\n\nRun modes ​\n\n...\n\nThis is the scaffolded development file for a project named myproject , with comments and optional keys removed:\nconfig/development.yaml\napiServer : port : 8080 publicHost : localhost publicPort : 8080 publicScheme : http insightsServer : port : 8081 publicHost : localhost publicPort : 8081 publicScheme : http webServer : port : 8082 publicHost : localhost publicPort : 8082 publicScheme : http database : host : localhost port : 8090 name : myproject user : postgres dataPath : .serverpod/development/pgdata redis : enabled : false host : localhost port : 8091 maxRequestSize : 524288 sessionLogs : persistentEnabled : true consoleEnabled : true consoleLogFormat : text\nThe three server blocks configure Serverpod's three servers: the API server your app talks to, the Insights server used by Serverpod's tooling, and the web server for serving web content.\n\n...\n\nRelated ​\n\n* Configuration reference : every option with its environment variable, config key, and default.\n* Running your server : how the server starts and how --mode is passed.\n* Database connection : connecting to your database in depth.\n* Redis : enabling Redis, the password, and connecting a GUI.\n* Configure HTTP calls : the API server's response headers and CORS defaults.\nEdit this page\nPrevious Running your server Next Modules"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/configuration/",
      "title": "Configuration | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nConfiguration\n\nConfiguration decides what your server listens on, which database and Redis (an in-memory store Serverpod can use for pub/sub and caching) it connects to, and how it behaves in each run mode, so the same code runs locally, in staging, and in production without edits. Serverpod reads configuration from three sources: the config/<run-mode>.yaml files, environment variables, and a ServerpodConfig Dart object passed to the Serverpod constructor. Environment variables override matching keys in the YAML files, and a Dart object replaces both.\nWith no configuration at all, Serverpod falls back to built-in defaults, so you can start with nothing and add configuration as you need it.\n\nHow configuration works ​\n\n...\n\nDefaults ​\n\nIf no YAML config files exist, no environment variables are configured, and no Dart config is supplied, the server runs with this built-in default: the API server on port 8080 at localhost .\nServerpodConfig ( apiServer : ServerConfig ( port : 8080 , publicHost : 'localhost' , publicPort : 8080 , publicScheme : 'http' , ) , ) ;\n\nRun modes ​\n\n...\n\nThis is the scaffolded development file for a project named myproject , with comments and optional keys removed:\nconfig/development.yaml\napiServer : port : 8080 publicHost : localhost publicPort : 8080 publicScheme : http insightsServer : port : 8081 publicHost : localhost publicPort : 8081 publicScheme : http webServer : port : 8082 publicHost : localhost publicPort : 8082 publicScheme : http database : host : localhost port : 8090 name : myproject user : postgres dataPath : .serverpod/development/pgdata redis : enabled : false host : localhost port : 8091 maxRequestSize : 524288 sessionLogs : persistentEnabled : true consoleEnabled : true consoleLogFormat : text\nThe three server blocks configure Serverpod's three servers: the API server your app talks to, the Insights server used by Serverpod's tooling, and the web server for serving web content.\n\n...\n\nThe experimental_features key only affects code generation. Experimental runtime APIs are on pod.experimental instead: shutdownTasks to run code on shutdown , and submitDiagnosticEvent for exception monitoring .\nwarning\nExperimental features may change or be removed in future versions.\n\nRelated ​\n\n* Configuration reference : every option with its environment variable, config key, and default.\n* Running your server : how the server starts and how --mode is passed.\n* Database connection : connecting to your database in depth.\n* Redis : enabling Redis, the password, and connecting a GUI.\n* Configure HTTP calls : the API server's response headers and CORS defaults.\nEdit this page\nPrevious Running your server Next Modules"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/authentication/web-authentication",
      "title": "Set up authentication on the web | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Configure the server ​\n\nEnable cookie auth by adding an authCookie section to your server configuration ( config/development.yaml , config/production.yaml , and so on), together with the list of origins your web app is served from:\nauthCookie : sameSite : lax allowedOrigins : - https : //app.example.com\nFor local development, use secure: false in config/development.yaml so the cookie is sent over localhost . The section must contain at least one field: an authCookie: key with no children is read as unset, and cookie auth stays off.\nallowedOrigins is required when authCookie is set: it backs the CSRF origin checks and credentialed CORS, which cannot use a wildcard origin. List every browser origin that calls your server. With cookie auth enabled, browsers on origins that are not in the list lose cross-origin access, including to public endpoints.\nEach field and its default:\n* Field | Default | Purpose\n* name | serverpod_auth | Name of the auth cookie.\n* refreshName | <name>_refresh | Name of the JWT refresh cookie.\n* domain | host-only | Set to example.com to share the cookie across subdomains.\n* path | / | Cookie path; also the base path behind a reverse proxy.\n* secure | true | Set to false only for localhost development.\n* sameSite | lax | lax , strict , or none ( none requires secure ).\nEach field can also be set through environment variables ( SERVERPOD_AUTH_COOKIE_NAME , SERVERPOD_AUTH_COOKIE_REFRESH_NAME , SERVERPOD_AUTH_COOKIE_DOMAIN , SERVERPOD_AUTH_COOKIE_PATH , SERVERPOD_AUTH_COOKIE_SECURE , SERVERPOD_AUTH_COOKIE_SAME_SITE , and SERVERPOD_ALLOWED_ORIGINS ), which override the YAML values.\n\nConfigure the client ​\n\nTurn on cookie transport when the app runs on the web. Set cookieAuth where initializeClient() creates the client in your app's lib/client.dart , before the app makes any calls:\nimport 'package:flutter/foundation.dart' ; client = Client ( await serverUrl ) . . cookieAuth = kIsWeb . . connectivityMonitor = FlutterConnectivityMonitor ( ) . . authSessionManager = FlutterAuthSessionManager ( ) ;\nEverything else is unchanged: sign-in flows, the client.auth session manager, and endpoint calls work as on other platforms. Setting cookieAuth to true on a non-web platform throws, since those transports have no browser cookie jar.\n\nVerify ​\n\n...\n\n* Switching users requires a sign-out first. Signing in as a different user from an already-authenticated session is rejected with a SignInWhileAuthenticatedException on all platforms.\n\nCross-site request protection ​\n\nCookie auth is protected against CSRF in layers: cookies default to SameSite=Lax , the server validates the request Origin against allowedOrigins , and the cookie only authenticates requests carrying a marker header set by the client, which a cross-site form cannot add without a CORS preflight. Nothing needs configuring beyond allowedOrigins . Set sameSite: none only if your app is embedded cross-site, and keep secure: true with it."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/web-server/web-server-middleware",
      "title": "Web server middleware | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Version: 4.0.0 Copy as Markdown\nOn this page\n\nWeb server middleware\n\nRoutes handle the core logic of your application, but many concerns cut across multiple routes: logging every request, validating API keys, handling CORS headers, or catching errors. Rather than duplicating this code in each route, middleware lets you apply it globally or to specific path prefixes.\nMiddleware functions are wrappers that sit between the incoming request and your route handler. They can inspect or modify requests before they reach your routes, and transform responses before they're sent back to the client.\nThe middleware on this page applies only to web server routes. For middleware around your endpoint methods, see Endpoint middleware ."
      ]
    },
    {
      "url": "https://docs.serverpod.dev/concepts/endpoints-and-apis",
      "title": "Working with endpoints | Serverpod",
      "publish_date": null,
      "excerpts": [
        "3. The default, localhost:8080/ , where localhost adapts to the platform, so an Android emulator reaches your machine through 10.0.2.2 without any changes.\nThe connectivityMonitor lets the client observe network changes. Projects created with authentication also attach an authSessionManager here.\nOn a physical device, localhost is the device itself, so the app needs your machine's network address instead:\n1. Find your machine's LAN IP, with ifconfig on Linux/macOS or ipconfig on Windows.\n2. Set it as the server URL, either as apiUrl in assets/config.json or with --dart-define=SERVER_URL=192.168.1.20:8080/ .\nAlso set publicHost in the development config to the same IP, so URLs the server hands out, such as public file links, point somewhere the device can reach; see Configuration .\nTo enable browser credentials for CORS or use platform-native HTTP clients, see Configure HTTP calls .\n\nPoint the client at each environment ​\n\nThe resolved server URL is the server the app connects to, so it changes between development, staging, and production. Keep the scaffolded client setup and choose the URL per build with --dart-define :\nflutter run --dart-define = SERVER_URL = staging.example.com/\nWithout the define, the app falls back to assets/config.json and then the local server. For a Flutter web app served by your Serverpod web server, the server provides config.json at runtime with its own API address, so the deployed web app finds the right server without a rebuild. In production, use your deployed server's public URL. If you deploy to Serverpod Cloud , that is the URL of your deployed app.\n\nRestrict access to your endpoints ​"
      ]
    },
    {
      "url": "https://docs.serverpod.dev/next/concepts/web-server/overview",
      "title": "Overview | Serverpod",
      "publish_date": null,
      "excerpts": [
        "Overview\n\nServerpod comes with a built-in web server that runs beside the API server. It serves anything that speaks plain HTTP: REST APIs and webhooks, static files, server-rendered HTML with templates or Jaspr , and single-page apps including Flutter web. Web requests get the same Session your endpoint methods receive, with full access to your database and business logic. The web server is built on the Relic framework, and its routing engine, middleware system, and typed headers are available directly.\nThe web server and the API server answer different callers. Endpoints are the typed methods your own app calls through the generated client. Web server routes serve everyone else: browsers, webhooks, third-party services, and anything that needs a URL. If you are building a feature for your Flutter app, write an endpoint. If something outside your app needs to reach your server over HTTP, write a route.\n\nYour first route ​\n\n...\n\nfromString ( jsonEncode ( { 'message' : 'Hello from Serverpod!' } ) , mimeType : MimeType . json , ) , ) ; } }\nRegister the route in your server.dart file before starting the server:\npod . webServer . addRoute ( HelloRoute ( ) , '/api/hello' ) ; await pod . start ( ) ;\nVisit localhost:8082/api/hello to see your response. Port 8082 is the web server's default development port, configured per run mode in the server configuration .\ninfo\nIf your project was created with the \"None\" web server option, the first use of pod.webServer throws Bad state: Web server is disabled . To enable it, add the webServer section to your config/<run mode>.yaml files and register at least one route before pod.start() . With a configuration but no routes, the web server simply does not start.\n\n...\n\nGoing to production ​\n\nWhen you deploy, the web server ships with the rest of your project. On Serverpod Cloud , it is served through a CDN that honors the cache headers your routes set. See Content delivery and caching for how the two interact.\n\nNext steps ​\n\n* Routing - Match requests to handlers by method and URL pattern\n* Request data - Access path parameters, query parameters, headers, and body\n* Web server middleware - Intercept and transform requests and responses\n* Static files - Serve static assets\n* Server-side HTML - Render HTML on the server with templates or Jaspr"
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

**Tool: webfetch**

**Input:**
```json
{
  "url": "https://docs.serverpod.dev/concepts/endpoints-and-apis/configure-http-calls"
}
```

**Output:**
```
  Configure HTTP calls | Serverpod       

[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Serverpod Logo](/img/logo-horizontal.svg)![Serverpod Logo](/img/logo-horizontal-dark.svg)

](https://serverpod.dev)[Framework](/)

[4.1.0](/concepts/endpoints-and-apis/configure-http-calls)

-   [Next](/next/concepts/endpoints-and-apis/configure-http-calls)
-   [4.1.0](/concepts/endpoints-and-apis/configure-http-calls)
-   [4.0.0](/4.0.0/concepts/endpoints-and-apis/configure-http-calls)
-   [3.4.0](/3.4.0)
-   [3.3.0](/3.3.0)
-   [3.2.0](/3.2.0)
-   [3.1.0](/3.1.0)
-   [3.0.0](/3.0.0)
-   [2.9.0](/2.9.0)
-   [2.8.0](/2.8.0)
-   [2.7.0](/2.7.0)
-   [2.6.0](/2.6.0)
-   [2.5.0](/2.5.0)
-   [2.4.0](/2.4.0)
-   [2.3.0](/2.3.0)
-   [2.2.0](/2.2.0)
-   [2.1.0](/2.1.0)
-   [2.0.0](/2.0.0)
-   [1.2.0](/1.2.0)
-   [1.1.1](/1.1.1)
-   [1.1.0](/1.1.0)
-   [1.0.0](/1.0.0)

[Serverpod Cloud](/cloud)

[API reference](https://pub.dev/documentation/serverpod/latest/)[Open jobs](https://careers.serverpod.dev/)[GitHub](https://github.com/serverpod/serverpod)

Search

-   [Introduction](/)
-   [Get Started](/installation)
    
    -   [Installation](/installation)
    -   [Quickstart](/quickstart)
    -   [How it works](/how-it-works)
-   [Build your first app](/get-started/creating-endpoints)
    
-   [Serverpod Academy](/serverpod-academy)
-   [Tutorials](/tutorials/fundamentals)
    
-   [Support & community](/support)
-   [Concepts](/concepts/server-fundamentals/your-serverpod-project)
    
    -   [Server fundamentals](/concepts/server-fundamentals/your-serverpod-project)
        
    -   [Endpoints & APIs](/concepts/endpoints-and-apis)
        
        -   [Working with endpoints](/concepts/endpoints-and-apis)
        -   [Sessions](/concepts/endpoints-and-apis/sessions)
        -   [Error handling and exceptions](/concepts/endpoints-and-apis/error-handling-and-exceptions)
        -   [Streaming](/concepts/endpoints-and-apis/streaming)
        -   [Server events](/concepts/endpoints-and-apis/server-events)
        -   [Caching](/concepts/endpoints-and-apis/caching)
        -   [File uploads](/concepts/endpoints-and-apis/file-uploads)
        -   [Custom cloud storage](/concepts/endpoints-and-apis/custom-cloud-storage)
        -   [Endpoint inheritance](/concepts/endpoints-and-apis/endpoint-inheritance)
        -   [Backward compatibility](/concepts/endpoints-and-apis/backward-compatibility)
        -   [Endpoint middleware](/concepts/endpoints-and-apis/endpoint-middleware)
        -   [Configure HTTP calls](/concepts/endpoints-and-apis/configure-http-calls)
    -   [Data & the database](/concepts/data-and-the-database/models)
        
    -   [Authentication](/concepts/authentication/get-started)
        
    -   [Web server](/concepts/web-server/overview)
        
    -   [Scheduling](/concepts/scheduling/overview)
        
    -   [Operations](/concepts/operations/overview)
        
    -   [Testing](/concepts/testing/get-started)
        
    -   [CLI](/concepts/cli/introduction)
        
    -   [Lookups](/concepts/lookups/configuration-reference)
        
-   [Deploy](/deployments/deploy-to-serverpod-cloud)
    
-   [Tools](/tools/insights)
    
-   [Upgrading](/upgrading)
    
-   [Roadmap & contributions](/contribute)
-   [Changelog](https://pub.dev/packages/serverpod/changelog)
-   [Serverpod Cloud](/cloud)

Version: 4.1.0Copy as Markdown

On this page

# Configure HTTP calls

Two situations call for customizing how your app sends requests: a web app that must include cookies on cross-origin calls, and apps that want the platform-native network stacks on iOS and Android. Both are handled by the `httpClientOverride` parameter on the generated `Client`, which swaps the underlying HTTP transport. The `serverUrl` in the examples below is the resolved server address from [calling endpoints](/concepts/endpoints-and-apis#call-an-endpoint-from-your-app).

## Include CORS credentials on web[​](#include-cors-credentials-on-web "Direct link to Include CORS credentials on web")

By default, browser requests do not include cookies or HTTP authentication credentials in cross-origin requests. If your app relies on cookie-based sessions or similar mechanisms, pass a `BrowserClient` with `withCredentials` enabled:

```
import 'package:http/browser_client.dart';final client = Client(  serverUrl,  httpClientOverride: BrowserClient()..withCredentials = true,);
```

### Allow credentials on the server[​](#allow-credentials-on-the-server "Direct link to Allow credentials on the server")

On the server, Serverpod adds CORS headers to API responses by default through `httpResponseHeaders` and `httpOptionsResponseHeaders` on the `Serverpod` constructor. The defaults allow cross-origin `POST` requests from any origin (`Access-Control-Allow-Origin: *`) and permit common request headers such as `Authorization` on preflight `OPTIONS` requests.

Credential-aware requests require `Access-Control-Allow-Credentials: true` and a specific origin instead of the wildcard. Override the defaults in your `lib/server.dart` (or wherever you construct `Serverpod`):

```
import 'src/generated/serverpod.dart';/// The starting point of the Serverpod server.void run(List<String> args) async {  final pod = Serverpod(    args,    httpResponseHeaders: Headers.build((mh) {      mh.accessControlAllowOrigin = AccessControlAllowOriginHeader.origin(        origin: Uri.parse('http://localhost:49660'), // Your Flutter web app origin      );      mh.accessControlAllowCredentials = true;      mh.accessControlAllowMethods = AccessControlAllowMethodsHeader.methods(        [Method.post],      );    }),    httpOptionsResponseHeaders: Headers.build((mh) {      mh.accessControlAllowHeaders = AccessControlAllowHeadersHeader.headers([        'Content-Type',        'Authorization',        'Accept',        'User-Agent',        'X-Requested-With',      ]);    }),  );  // Start the server  await pod.start();}
```

Set `origin` to the exact origin of your Flutter web app (scheme, host, and port). In production, list each allowed origin explicitly.

## Use platform-native HTTP clients[​](#use-platform-native-http-clients "Direct link to Use platform-native HTTP clients")

You can also override the default HTTP client with a platform-native HTTP client. On iOS and macOS, you can use [cupertino\_http](https://pub.dev/packages/cupertino_http) to route traffic through `NSURLSession`. On Android, you can use [cronet\_http](https://pub.dev/packages/cronet_http) to use the Cronet network stack.

Add the corresponding package to your Flutter app's `pubspec.yaml` before using these clients.

```
import 'dart:io';import 'package:cronet_http/cronet_http.dart';import 'package:cupertino_http/cupertino_http.dart';import 'package:http/http.dart' as http;import 'package:my_project_client/my_project_client.dart';void main() async {  http.Client? httpClient;  if (Platform.isAndroid) {    final engine = CronetEngine.build(        cacheMode: CacheMode.memory,        cacheMaxSize: 2 * 1024 * 1024,        userAgent: 'my-app');    httpClient = CronetClient.fromCronetEngine(engine, closeEngine: true);  } else if (Platform.isIOS || Platform.isMacOS) {    final config = URLSessionConfiguration.ephemeralSessionConfiguration()      ..cache = URLCache.withCapacity(memoryCapacity: 2 * 1024 * 1024)      ..httpAdditionalHeaders = {'User-Agent': 'my-app'};    httpClient = CupertinoClient.fromSessionConfiguration(config);  }  final client = Client(    serverUrl,    httpClientOverride: httpClient,  );}
```

### Support web with conditional imports[​](#support-web-with-conditional-imports "Direct link to Support web with conditional imports")

The above example does not work if your app also targets web, since `dart:io` is not available there. Put the platform-specific `http.Client` creation logic behind a conditional import instead:

```
import 'src/http_client_stub.dart'    if (dart.library.io) 'src/http_client_io.dart';final client = Client(  serverUrl,  httpClientOverride: createHttpClient(),);
```

The stub file provides a fallback for platforms without `dart:io` (such as web), where the default client is used:

src/http\_client\_stub.dart

```
import 'package:http/http.dart' as http;http.Client? createHttpClient() => null;
```

The `dart:io` implementation wraps the platform-native client from the example above in a top-level `createHttpClient()` function:

src/http\_client\_io.dart

```
import 'dart:io';// Same imports as the platform-native example above.http.Client? createHttpClient() {  if (Platform.isAndroid) {    // ... return the CronetClient shown above  } else if (Platform.isIOS || Platform.isMacOS) {    // ... return the CupertinoClient shown above  }  return null;}
```

[Edit this page](https://github.com/serverpod/serverpod_docs/tree/main/versioned_docs/version-4.1.0/06-concepts/02-endpoints-and-apis/12-configure-http-calls.md)

[

Previous

Endpoint middleware

](/concepts/endpoints-and-apis/endpoint-middleware)[

Next

Working with models

](/concepts/data-and-the-database/models)

-   [Include CORS credentials on web](#include-cors-credentials-on-web)
    -   [Allow credentials on the server](#allow-credentials-on-the-server)
-   [Use platform-native HTTP clients](#use-platform-native-http-clients)
    -   [Support web with conditional imports](#support-web-with-conditional-imports)

Copyright © 2026 Serverpod authors.
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 12.4s)

_Thinking:_

CORS defaults allow wildcard POST; Jaspr on web at `namma-quiz.serverpod.space` calling `namma-quiz.api.serverpod.space` works for normal endpoints. For WebSockets, CORS doesn't apply, but Serverpod 4 has `SERVERPOD_ALLOWED_ORIGINS` when authCookie is set; not needed unless cookie auth. Jaspr client uses `Client` with default auth (Bearer token) — fine. If using cookie auth in 4.x, need allowedOrigins. We can skip cookie auth for Jaspr unless needed; Bearer tokens work. But the auth module's web auth in 4.x may default to cookie? The 4.x auth has httpOnly cookie auth for web, opt-in. Keep bearer.

Now, the user chose "Jaspr only for both admin and quiz screen". So:
- Serve Jaspr SPA at root; remove Flutter web from server and remove the landing page.
- Keep Flutter app for mobile/desktop (still supported) but not served by the server. Could leave it as a separate client.
- The Jaspr app needs to cover both admin and quiz screens; it already has routes `/`, `/play`, `/host`, `/admin`. Good. Ensure the admin route is protected (currently unauthenticated server side).
- The server's web routes become: `/app/assets/assets/config.json`? No Flutter. Remove. `/static/*`? Jaspr build includes styles. Remove landing route. Add `SpaRoute(Directory('web/jaspr'), fallback: 'index.html')` at `/` or `/*`. Need to ensure `SpaRoute` serves static assets. Check Serverpod 4 `SpaRoute` API: `SpaRoute(Directory('web/app'))` likely serves files and falls back to index.html. The docs "Single-page apps" say. Good.
- Build Jaspr with `jaspr build` (output `build/jaspr`) and copy to `namma_quiz_server/web/jaspr`.
- `SERVER_URL` for Jaspr: `const String.fromEnvironment('SERVER_URL', defaultValue: 'http://localhost:8080/')`. Build command with `--dart-define=SERVER_URL=https://namma-quiz.api.serverpod.space/`. Need to confirm `jaspr build` supports dart defines. Let's check quickly. Jaspr CLI docs: `jaspr build` options include `--dart-define`? I recall Jaspr supports `--dart-define` in `jaspr serve` and `jaspr build`. Let me search.

**Tool: websearch**

**Input:**
```json
{
  "query": "jaspr build --dart-define environment variable String.fromEnvironment",
  "numResults": 5
}
```

**Output:**
```
{
  "search_id": "search_8c91381b13879a0a3f59f22c6ad3b570",
  "results": [
    {
      "url": "https://dart.dev/guides/environment-declarations",
      "title": "Configuring apps with compilation environment declarations",
      "publish_date": null,
      "excerpts": [
        "Configuring apps with compilation environment declarations\n\nLearn about using compilation environment declarations to customize application behavior.\nmore_vert\n* copy Copy link\n* docs View source\n* bug_report Report issue\nYou can specify compilation environment declarations when building or running a Dart application. Compilation environment declarations specify configuration options as key-value pairs that are accessed and evaluated at compile time.\ninfo Note\nThis page uses \"environment\" to refer to the Dart compilation environment. The common use of the term instead refers to the operating system environment.\nYour app can use the values of environment declarations to change its functionality or behavior. Dart compilers can eliminate the code made unreachable due to control flow using the environment declaration values.\nYou might define and use environment declarations to:\n* Add functionality during debugging, such as enabling logging.\n* Create separate flavors of your application.\n* Configure application behavior, such as the port of an HTTP server.\n* Enable an experimental mode of your application for testing.\n* Switch between testing and production backends.\nTo specify an environment declaration when running or compiling a Dart application, use the --define option or its abbreviation, -D . Specify the declaration key-value pair using a <NAME>=<VALUE> format:\n$  dart run --define=DEBUG=true -DFLAVOR=free\ncontent_copy\nTo learn how to set these declarations with other tools, check out the specifying environment declarations section in this guide. That section explains the declaration syntax and how to specify them on the command line and in IDEs and editors.\n\nAccessing environment declarations\n\n...\n\nTo access specified environment declaration values, use one of the fromEnvironment constructors with const or within a constant context. Use bool.fromEnvironment for true or false values, int.fromEnvironment for integer values, and String.fromEnvironment for anything else.\ninfo Note\nThe environment declaration constructors are only guaranteed to work when invoked as const . Most compilers must be able to evaluate their value at compile time.\nEach of the fromEnvironment constructors require the name or key of the environment declaration. They also accept an optional defaultValue named argument to override the default fallback value. The default fallback value is used when a declaration isn't defined or the specified value cannot be parsed as the expected type.\nFor example, if you want to print log messages only when the environment declaration DEBUG is set to true :\ndart\nvoid log ( String message ) { // Log the debug message if the environment declaration 'DEBUG' is `true`. // If there was no value specified, do not log. if ( const bool . fromEnvironment ( ' DEBUG ' , defaultValue : false ) ) { print ( ' Debug:  $message ' ) ; } }\ncontent_copy\nIn this snippet, if DEBUG is set to false during compilation, or not specified at all, production compilers can completely remove the condition and its body.\nThe fromEnvironment constructors fallback to a default value when the declaration isn't specified or the specified value cannot be parsed. Therefore, to specifically check whether an environment declaration has been specified, use the bool.hasEnvironment constructor:\ndart\nif ( const bool . hasEnvironment ( ' DEBUG ' ) ) { print ( ' Debug behavior was configured! ' ) ; }\ncontent_copy\n\n...\n\nFlutter\n\n#\nTo specify environment declarations to the Flutter tool, use the --dart-define option instead:\n$  flutter run --dart-define=DEBUG=true\ncontent_copy\nWas this page's content helpful?\nthumb_up thumb_down\nUnless stated otherwise, the documentation on this site reflects Dart 3.12.2. Page last updated on 2025-08-07. View source or report an issue .\nDart"
      ]
    },
    {
      "url": "https://777genius.github.io/dartdoc_modern/vitepress/guide/jaspr-deployment",
      "title": "Jaspr Deployment | dartdoc_modern",
      "publish_date": null,
      "excerpts": [
        "Jaspr Deployment ​\n\nStatus:\n* practical deployment guide\nPurpose:\n* explain how to deploy generated Jaspr docs as a real static site\n* give one honest path for root hosting and one for subpath hosting\n\nWhat The Jaspr Backend Produces ​\n\nAfter generation, the output is a real Jaspr app scaffold.\nTo produce static hosting output, build that app:\nbash\ncd  docs-site dart  pub  get dart  pub  global  activate  jaspr_cli jaspr  build\nStatic files are written to:\ntext\ndocs-site/build/jaspr\nThat directory is what you deploy to a static host.\n\nRoot Hosting ​\n\nIf your site will be hosted at the domain root, for example:\n* docs.example.dev/\n* my-package.dev/\nthen the default build is enough:\nbash\ncd  docs-site dart  pub  get dart  pub  global  activate  jaspr_cli jaspr  build  --dart-define  DOCS_THEME=ocean\nDeploy:\n* docs-site/build/jaspr\n\nSubpath Hosting ​\n\nIf your site will be hosted under a path prefix, for example:\n* example.github.io/my-package-docs/\n* company.dev/docs/my-package/\nbuild with DOCS_BASE_PATH :\nbash\ncd  docs-site dart  pub  get dart  pub  global  activate  jaspr_cli jaspr  build  \\   --dart-define  DOCS_THEME=graphite  \\   --dart-define  DOCS_BASE_PATH=/my-package-docs\nImportant:\n* use the full deployed path prefix\n* start it with /\n* do not end it with /\nExamples:\n* good: /my-package-docs\n* good: /docs/my-package\n* avoid: my-package-docs\n* avoid: /my-package-docs/\n\nGitHub Pages ​\n\nUser or Organization Site ​\n\nIf the site is served from the domain root, you can deploy build/jaspr directly without DOCS_BASE_PATH .\n\nProject Site ​\n\nIf the site is served under a repository path, use:\nbash\njaspr  build  --dart-define  DOCS_BASE_PATH=/your-repo-name\nThen publish:\ntext\ndocs-site/build/jaspr\n\nExample Workflow ​\n\nyaml\nname :  Deploy Jaspr Docs on :   push :     branches : [ main ] permissions :   contents :  read   pages :  write   id-token :  write jobs :   build :     runs-on :  ubuntu-latest     steps :       -  uses :  actions/checkout@v4       -  uses :  subosito/flutter-action@v2         with :           channel :  stable           cache :  true       -  run :  dart pub global activate jaspr_cli\n\n...\n\nFor any static host, the practical rule is the same:\n1. generate the Jaspr scaffold with --format jaspr\n2. run dart pub get\n3. run jaspr build\n4. deploy build/jaspr\nOnly add DOCS_BASE_PATH when your deployed URL is not at / .\n\nRecommended Team Recipe ​\n\nFor a package team that wants repeatable docs deploys:\nbash\ndartdoc_modern  --format  jaspr  --output  docs-site cd  docs-site dart  pub  get dart  pub  global  activate  jaspr_cli jaspr  build  --dart-define  DOCS_THEME=forest\nThen upload:\ntext\ndocs-site/build/jaspr"
      ]
    },
    {
      "url": "https://sandromaglione.com/articles/how-to-use-environmental-variables-in-flutter",
      "title": "How to use Environmental Variables in Flutter | Sandro Maglione",
      "publish_date": "2022-08-09",
      "excerpts": [
        "Why should I use environmental variables\n\nWhy would you need environmental variables at all?\nThe primary usecase for environment variables is to limit the need to modify and re-release an application due to changes in configuration data.\nSome examples of environmental variables are keys, URLs, domain names, email addresses.\nWhat these have in common is that their values change infrequently . The application logic treats them like constants, rather than mutable variables.\n\n Secret keys as environmental variables\n\n...\n\nEnvironmental variables in dart\n\nThe String class in dart has a static method String.fromEnvironment . This method allows to access the variables defined using the --dart-define flag.\nFor example, when you run the build command, you can add multiple --dart-define flags to assign a value to each environmental variable:\nflutter  build  appbundle  - t  lib / main_prod . dart  -- dart - define = API_BASE_URL = http : //www.sandromaglione.com\nWhen we run this command our app has access to the API_BASE_URL using String.fromEnvironment('API_BASE_URL') .\nWith this strategy is easy to define multiple variables for different environments (production, development, testing, etc), directly from the command line .\nDefining environmental variables from the command line is ideal for testing different configurations in a CI/CD pipeline.\n\n Using environmental variables in Flutter\n\nThe first step to access environmental variables in dart is to define an abstract class that stores a constant for each variable in the app.\nIn this example, we are going to see how to define environmental variables for a Supabase project. A Supabase app needs to access two variables:\n* SUPABASE_URL : The source URL of your Supabase project\n* SUPABASE_ANNON_KEY : The key used to make request to your project\nIn order to access these two variables, we create a constants.dart file with the following content:\nconstants.dart\n/// Environment variables and shared app constants. abstract  class  Constants  {   static  const  String  supabaseUrl  =  String . fromEnvironment (     'SUPABASE_URL' ,     defaultValue :  '' ,   );   static  const  String  supabaseAnnonKey  =  String . fromEnvironment (     'SUPABASE_ANNON_KEY' ,     defaultValue :  '' ,   ); }\nBy defining these variables as static const we can access them by calling Constants.supabaseUrl and Constants.supabaseAnnonKey .\nThe class is defined as abstract because it should not be possible to create an instance of this class (you cannot do Constants() ).\n\n Define environmental variables when launching the app\n\nThe second step is defining those variables when we run our app.\nAs we have seen above, we just need to add the --dart-define flag to our run (or build ) command:\nflutter  run  lib / main . dart  -- dart - define = SUPABASE_URL = url  -- dart - define = SUPABASE_ANNON_KEY = key\nMake sure to spell the name of the variables correctly: this should be the same name used when calling String.fromEnvironment .\n\n...\n\nHow to configure different environments\n\nAs stated before, our goal is to define different environments with different variables for every configuration.\nUsing --dart-define this becomes super easy. We can just add a new entry to our launch.json file:\nlaunch.json\n{   \"version\" :  \"0.2.0\" ,   \"configurations\" : [     {       \"name\" :  \"Production\" ,       \"request\" :  \"launch\" ,       \"type\" :  \"dart\" ,       \"program\" :  \"lib/main_prod.dart\" ,       \"args\" : [         \"--dart-define=SUPABASE_URL=url\" ,         \"--dart-define=SUPABASE_ANNON_KEY=key\"       ]     },     {       \"name\" :  \"Development\" ,       \"request\" :  \"launch\" ,       \"type\" :  \"dart\" ,       \"program\" :  \"lib/main_dev.dart\" ,       \"args\" : [         \"--dart-define=SUPABASE_URL=url\" ,         \"--dart-define=SUPABASE_ANNON_KEY=key\"       ]     }   ] }\nThis two commands are used for the Production and Development environments."
      ]
    },
    {
      "url": "https://pub.dev/packages/jaspr_cli/changelog",
      "title": "jaspr_cli changelog | Dart package",
      "publish_date": null,
      "excerpts": [
        "\njaspr_cli 0.23.5 copy \"jaspr_cli: ^0.23.5\" to clipboard jaspr_cli: ^0.23.5 copied to clipboard\n\nPublished 36 days ago • verified publisher schultek.dev • Latest: 0.23.5 / Prerelease: 0.24.0-beta.0\nSDK Dart Flutter\nPlatform Android iOS Linux macOS web Windows\nliked status: active liked status: inactive 4\n→\n\nMetadata\n\nA command line interface to create, serve and build jaspr applications.\nMore...\n* Readme\n* Changelog\n\n...\n\n* The old directory at '~/.jaspr/' is automatically migrated to the new locations on first run.\n* The new directory location is:\n* when DART_DATA_HOME environment variable is set: $DART_DATA_HOME/jaspr\n* on Windows : %LOCALAPPDATA%\\Dart\\jaspr\n* on Mac OS : $HOME/Library/Application Support/Dart/jaspr\n* on Linux : $XDG_STATE_HOME/Dart/jaspr if $XDG_STATE_HOME is defined, and $HOME/.local/state/Dart/jaspr otherwise.\n* The cli completion files are no longer auto-installed when the JASPR_NO_COMPLETION environment variable is set.\n\n0.23.0 #\n\n...\n\n* Fixed encoding of lastmod property in generated sitemap to be a valid W3C date string.\n* Fixed launching debug builds in Safari.\n* Added --target-os and --target-arch options to the build command to cross-compile server binaries.\n* Added --dart-define-from-file option to the serve and build commands.\n* Respect PUB_HOSTED_URL environment variable for custom pub mirrors.\n* Added an example to show on pub.dev.\n\n...\n\n* Migrated all web imports from package:web to package:universal_web .\n* Added prefersColorScheme parameter to MediaQuery .\n\n0.16.4 #\n\n* Added --dart-define , --dart-define-client and --dart-define-server to serve and build commands.\n* Fixed attribute validation to support attribute names including @ and : .\n\n0.16.3 #\n\n* Added table and related html methods.\n* Added value parameter to select() method.\n* Add 'standalone' option to renderComponent method.\n\n...\n\n* Improved flutter element embedding .\nFlutter apps can now be directly embedded from your Jaspr codebase and integrated into the existing Jaspr component tree.\nThis removes the need for any kind of interop between apps as they can directly communicate through the usual primitives of passing properties and callbacks.\nFor an example see examples/flutter_embedding .\n* jaspr build now outputs to /build/jaspr instead of /build .\n\n...\n\n* Requires Dart 3.0 or later.\n\n0.3.0 #\n\n* BREAKING The cli is now a separate package: jaspr_cli . To migrate run:\n  dart pub global deactivate jaspr\n  dart pub global activate jaspr_cli\nThe usage stays the same with jaspr create , jaspr serve and jaspr build .\n\n0.2.0 #\n\nBREAKING : This is the first major release after the initial publish and contains several breaking changes."
      ]
    },
    {
      "url": "http://appwrite.io/docs/products/sites/quick-start/jaspr.md",
      "title": "Deploy a Jaspr app to Appwrite Sites",
      "publish_date": null,
      "excerpts": [
        "1. Create Jaspr app\n\nJaspr is a web framework for Dart that renders HTML and CSS from Dart components. Appwrite Sites runs Jaspr apps in server mode, which pre-renders your components on the server for each incoming request.\nOpen your terminal, install the Jaspr CLI, and create a project in server mode.\ndart pub global activate jaspr_cli\njaspr create --mode server --routing multi-page my_site\nIn case you have an existing Jaspr app, confirm that the jaspr section of your pubspec.yaml file sets server mode:\njaspr:\n  mode: server\nAppwrite builds Jaspr sites on the Flutter 3.44 runtime, which ships with the Jaspr CLI installed, so you don't need to add jaspr_cli to your pubspec.yaml file.\n\n...\n\n2. Verify that the correct framework is selected. Jaspr and Flutter projects both use a pubspec.yaml file, so if Flutter is selected, pick Jaspr from the drop-down list.\n3. Confirm the install command, build command, and output directory in the build settings. The default build settings for Jaspr are:\n* Install command: dart pub get\n* Build command: jaspr build\n* Output directory: ./build/jaspr\n4. Add any environment variables required by the site.\nClick on the Deploy button."
      ]
    },
    {
      "url": "http://appwrite.io/docs/products/sites/quick-start/jaspr",
      "title": "Deploy a Jaspr app to Appwrite Sites - Docs - Appwrite",
      "publish_date": null,
      "excerpts": [
        "Bash\nCopy\ndart pub global activate jaspr_cli jaspr create --mode server --routing multi-page my_site\nIn case you have an existing Jaspr app, confirm that the jaspr section of your pubspec.yaml file sets server mode:\nYAML\nCopy\njaspr : mode : server\nAppwrite builds Jaspr sites on the Flutter 3.44 runtime, which ships with the Jaspr CLI installed, so you don't need to add jaspr_cli to your pubspec.yaml file.\n\n...\n\n2. Verify that the correct framework is selected. Jaspr and Flutter projects both use a pubspec.yaml file, so if Flutter is selected, pick Jaspr from the drop-down list.\n3. Confirm the install command , build command , and output directory in the build settings. The default build settings for Jaspr are:\n* Install command: dart pub get\n* Build command: jaspr build\n* Output directory: ./build/jaspr\n4. Add any environment variables required by the site.\nClick on the Deploy button."
      ]
    },
    {
      "url": "https://itnext.io/secure-your-flutter-project-the-right-way-to-set-environment-variables-with-compile-time-variables-67c3163ff9f4",
      "title": "The Right Way to Set Environment Variables with Compile ...",
      "publish_date": "2023-04-09",
      "excerpts": [
        "## ITNEXT\n·\n1. Compile time variables\n1. Dart define\n2. Dart define from file\n3. Superpowered environment variables\n2. Update(August 2023)\n1. Resources\nITNEXT\nITNEXT is a platform for IT developers & software engineers to share knowledge, connect, collaborate, learn and experience next-gen technologies.\nFlutter\nMobile App Development\nSecurity\nSoftware Development\nCi Cd Pipeline\n\nThe Right Way to Set Environment Variables with Compile-Time Variables\n\nSamuel Abada\nSamuel Abada\n7 min read\n·\nApr 9, 2023\n--\n7\nListen\nShare\nPress enter or click to view image in full size\nEnvironment variables at compile time\nWhen building an app, we often use environment variables for one thing or another. These environment variables could be API keys, base URLs, keys and passphrases and whatever data we don't want to expose directly in the app.\n\n...\n\nCompile time variables\n\nThey offer a way to provide environment variables only at compile time. This implies that the variables are defined at the point of doing flutter run or flutter build . By implication, this command can be added as part of the compile/build process for a CI environment. Compile time environment variable declarations are not new to the dart and flutter ecosystem. There are two ways of adding compile-time variables. - using the command — dart-define - using the command — dart-define-from-file\n\nDart define\n\nThe command — dart-define offers a way of passing a single environment variable at compile time.\nflutter run --dart-define=baseUrl=github.com/mastersam07\nThe above shows how to pass the environment variable baseUrl at compile time. The same command can repeatedly be used for multiple environment variables, as shown below.\nflutter run --dart-define=baseUrl=github.com/mastersam07 --dart-define=apiKey=djvghdgfhsg6utytuytyut\nHowever, the above could get messy, especially with adding numerous environment variables, as we could end up with a long command.\n\nDart define from file\n\nThe command — dart-define-from-file is relatively new and allows for adding multiple variables by passing the path of a JSON format file where flutter defines a constant global pool\nflutter run --dart-define-from-file=config.json\nWith the flutter engine landing support for .env files out of the box, — dart-define-from-file allows for adding multiple variables by passing the path of a .env file where flutter defines a constant global pool\nflutter run --dart-define-from-file=.env\nconfig.json is a JSON file with key-value pairs in the format:\n{  \n \"BASE_URL\": \"github.com/mastersam07\",  \n \"API_KEY\": \"ftfghdf6r6546r76t6t75yt67u\"  \n}\nFor envs, .env is a simple env file with key-value pairs in the format:\nBASE_URL=github.com/mastersam07  \nAPI_KEY=ftfghdf6r6546r76t6t75yt67u\nAll compile-time variables can be accessed the same way, irrespective of your approach. They are all available as constants from the String.fromEnvironment, bool.fromEnvironment and int.fromEnvironment.\nPress enter or click to view image in full size\n\nSuperpowered environment variables\n\nThe sweet part of using — dart-define-from-file is that variables defined here can be accessed by gradle. You could check this PR and its related issue for more details.\nLet's consider the following hypothetical situation:\nWe have built an app and want to set the suffix and app name from the compile time variable. We have a config.json as shown below:\n{  \n \"APP_NAME\": \"batcave\",  \n \"APP_SUFFIX\": \".dev\",  \n \"MAPS_API_KEY\": \"someKeyString\"  \n}\nFor env files, we have a .env file as shown below:\nAPP_NAME=batcave  \nAPP_SUFFIX=.dev  \nMAPS_API_KEY=someKeyString\nNo extra configuration is needed natively to make this work. Using the above is as simple as running: flutter run — dart-define-from-file=config.json or flutter run — dart-define-from-file=.env as the case may be and make the following change to our app-level build.gradle:\ndefaultConfig {  \n    applicationId \"tech.mastersam.kaunta\"  \n    applicationIdSuffix APP_SUFFIX  \n    ...."
      ]
    },
    {
      "url": "https://api.dart.dev/main/latest/dart-core/String/String.fromEnvironment.html",
      "title": "String.fromEnvironment constructor - String - dart:core library - Dart API",
      "publish_date": null,
      "excerpts": [
        "4. String.fromEnvironment const constructor\nString.fromEnvironment\ndark_mode light_mode\ndescription\n\nString.fromEnvironment constructor\n\nconst String.fromEnvironment ( 1. String name , { 2. String defaultValue = \"\" ,\n})\nValue for name in the compilation configuration environment declaration.\nThe compilation configuration environment is provided by the surrounding tools which are compiling or running the Dart program. The environment is a mapping from a set of string keys to their associated string value. The string value, or lack of a value, associated with a name must be consistent across all calls to String.fromEnvironment , int.fromEnvironment , bool.fromEnvironment and bool.hasEnvironment in a single program.\nThe result of invoking this constructor is the string associated with the key name . If no value is associated with name , the result is instead the defaultValue string, which defaults to the empty string.\nExample of looking up a value:\nconst String.fromEnvironment(\"defaultFloo\", defaultValue: \"no floo\")\nIn order to check whether a value is there at all, use bool.hasEnvironment . Example:\nconst maybeDeclared = bool.hasEnvironment(\"maybeDeclared\")\n    ? String.fromEnvironment(\"maybeDeclared\")\n    : null;\nThe string value, or lack of a value, associated with a name must be consistent across all calls to String.fromEnvironment , int.fromEnvironment , bool.fromEnvironment and bool.hasEnvironment in a single program.\nThis constructor is only guaranteed to work when invoked as const . It may work as a non-constant invocation on some platforms which have access to compiler options at run-time, but most ahead-of-time compiled platforms will not have this information.\nThe compilation configuration environment is not the same as the environment variables of a POSIX process. Those can be accessed on native platforms using Platform.environment from the dart:io library.\n\nImplementation\n\nexternal const factory String.fromEnvironment(\n  String name, {\n  String defaultValue = \"\",\n});\n1. Dart\n2. dart:core\n3. String\n4. String.fromEnvironment const constructor\n\nString class"
      ]
    },
    {
      "url": "https://pub.dev/documentation/jaspr/latest",
      "title": "jaspr - Dart API docs - Pub",
      "publish_date": null,
      "excerpts": [
        "2. documentation\njaspr package\ndark_mode light_mode\nBanner\npub github tests codecov discord contributors\nWebsite • Quickstart • Documentation • Playground • Examples • Benchmarks\nsponsor\n\nJaspr\n\nA modern web framework for building websites in Dart with support for both client-side and server-side rendering .\n* 🔮 Why? : Jaspr was made with the premise to make a web-framework that looks and feels just like Flutter, but renders normal HTML and CSS like React or Vue.\n\n...\n\nJaspr comes with a cli tool to create, serve and build your website.\n* jaspr create will create a new jaspr project. The cli will prompt you for a project name and setup options.\n* jaspr serve will serve the website in the current directory, including hot-reloading.\n* jaspr build will build the website containing the static assets (compiled js, html, images, etc.) and the optional server executable.\n\nFramework\n\n...\n\n1. Jaspr does not care about the styling of components. There are (currently) no prestyled components like in Flutters material or cupertino libraries.\nTrade-Off: Providing styled components would be a lot of extra work and is currently not feasible. Also there exist a lot of different, well established CSS frameworks for web that you can already integrate and use with jaspr (e.g. Bulma .\n2. Text receives only a String and nothing else. As usual for web, styling is done through a combination of CSS attributes, either in a Stylesheet or though the style attribute of the parent elements.\nTrade-Off: Giving Text a style option would be superficial and not native to web, and thereby not a good practice.\n\nBuilding\n\nYou can build your application using the following command:\njaspr build\nThis will build the app inside the build/jaspr directory."
      ]
    },
    {
      "url": "https://pub.dev/packages/jaspr/changelog",
      "title": "jaspr changelog | Dart package - pub.dev",
      "publish_date": null,
      "excerpts": [
        "* The old directory at '~/.jaspr/' is automatically migrated to the new locations on first run.\n* The new directory location is:\n* when DART_DATA_HOME environment variable is set: $DART_DATA_HOME/jaspr\n* on Windows : %LOCALAPPDATA%\\Dart\\jaspr\n* on Mac OS : $HOME/Library/Application Support/Dart/jaspr\n* on Linux : $XDG_STATE_HOME/Dart/jaspr if $XDG_STATE_HOME is defined, and $HOME/.local/state/Dart/jaspr otherwise.\n* The cli completion files are no longer auto-installed when the JASPR_NO_COMPLETION environment variable is set.\n\n0.23.0 #\n\n...\n\n* Fixed encoding of lastmod property in generated sitemap to be a valid W3C date string.\n* Fixed launching debug builds in Safari.\n* Added --target-os and --target-arch options to the build command to cross-compile server binaries.\n* Added --dart-define-from-file option to the serve and build commands.\n* Respect PUB_HOSTED_URL environment variable for custom pub mirrors.\n* Added an example to show on pub.dev.\n\n...\n\n* Migrated all web imports from package:web to package:universal_web .\n* Added prefersColorScheme parameter to MediaQuery .\n\n0.16.4 #\n\n* Added --dart-define , --dart-define-client and --dart-define-server to serve and build commands.\n* Fixed attribute validation to support attribute names including @ and : .\n\n0.16.3 #\n\n* Added table and related html methods.\n* Added value parameter to select() method.\n* Add 'standalone' option to renderComponent method.\n\n...\n\n* Improved flutter element embedding .\nFlutter apps can now be directly embedded from your Jaspr codebase and integrated into the existing Jaspr component tree.\nThis removes the need for any kind of interop between apps as they can directly communicate through the usual primitives of passing properties and callbacks.\nFor an example see examples/flutter_embedding .\n* jaspr build now outputs to /build/jaspr instead of /build ."
      ]
    }
  ],
  "warnings": null,
  "metadata": null,
  "session_id": "ses_e0ac8a833ffeLqg69en3Jef4c2"
}
```

---

## Assistant (Build · DeepSeek V4.1 Flash Free · 38.3s)

_Thinking:_

Jaspr supports `--dart-define`. Good.

Now, the final response should be the revised plan for the chosen path. The user answered; I shouldn't re-ask. I'll provide a concrete, ordered implementation plan tailored to:
- Serverpod 4.1 upgrade
- Jaspr-only web (serve at `/`, routes `/`, `/play`, `/host`, `/admin`)
- Growth plan min 1
- Upstash Redis
- Managed Postgres
- CORS considerations
- Remove Flutter web serving from server (keep mobile app)
- `scloud.yaml` + `.scloudignore`

Should I start implementing? The user's answer to "Decisions needed" is a signal to proceed. But the original request was "plan for it." The best response: "Here's the revised plan for those choices" and ask for go-ahead / offer to begin with Phase 0. Maybe also note the upgrade is the first chunk. I won't modify files yet.

Let me make it concise but complete. Include exact files to change and commands. Also mention the CORS/`allowedOrigins` for Jaspr (4.x). Since Jaspr is cross-origin to API, default CORS allows wildcard POST; for WebSockets, Serverpod 4's `SERVERPOD_ALLOWED_ORIGINS` is required only when authCookie is set, but 4.x's web auth may use cookie? The generated Jaspr client (serverpod_client) uses HTTP POST + WebSocket with Bearer token, no cookies. So default CORS is fine. If they enable cookie auth, set allowedOrigins. Also `SERVERPOD_ALLOWED_ORIGINS` may reject streaming connections from other origins even without authCookie ("When set, browser WebSocket connections for streaming from other origins are also rejected, with or without authCookie"). By default unset → streaming from other origins allowed. Good.

One more important Jaspr-specific thing: The Jaspr client's `Client` is a singleton created at module load with `String.fromEnvironment`. For server-side rendering (mode: client only), fine. The app uses `jaspr_riverpod`; okay.

Jaspr build output and server routes:
- Add `web/jaspr` to `.scloudignore` (negate).
- `SpaRoute(Directory('web/jaspr'))` for `/*` or `/`? Check Serverpod 4 `SpaRoute` signature. It serves the directory and falls back to index. Register at `'/'`? In Serverpod docs, `SpaRoute(Directory('web/app'))` registered at `'/*'` probably. The `FlutterRoute` is registered at `'/app/*'` in our code. For an SPA at root, `pod.webServer.addRoute(SpaRoute(Directory('web/jaspr')), '/*')`. But this catch-all would also catch API routes? Web server is separate from API server (port 8082 vs 8080), so no. It would catch `/api/hello` web routes if registered earlier? Add specific web routes first. Fine. Also the `/static/*` route is no longer needed. Remove landing route.

But there's a subtlety: Cloud's Web URL may serve the Flutter web app at root automatically? No, it serves your web server routes. `SpaRoute` is fine.

Jaspr base path: serving at root, so no base href issue. But the SPA routes are `/play`, `/host`, `/admin`; `SpaRoute` fallback to `index.html` handles deep links. The Jaspr index references `main.dart.js` and `styles/main.css` relatively. At `/host`, the browser resolves `styles/main.css` relative to `/host` → `/styles/main.css` (because `/host` has no trailing slash). At `/host/` it would be `/host/styles/main.css`. To avoid, add `<base href="/">` in `namma_quiz_jaspr/web/index.html`, or ensure Jaspr's router uses hash routing. Better: add `<base href="/">`. Does Jaspr support? It's a raw HTML file; the build copies it. Adding `<base href="/">` is fine. Or change asset paths to absolute `/styles/main.css` and `/main.dart.js`. The built Jaspr may rewrite them. I'll note it.

Also, the Jaspr `client_provider.dart` import path: `package:namma_kahoot_client/namma_kahoot_client.dart`. Its pubspec dependency path must be fixed first.

Serverpod 4 upgrade and web server:
- The 4.x `Serverpod` constructor can still take Protocol/Endpoints; routes API changed from 3.x? The current `pod.webServer.addRoute(StaticRoute.file(...))` may have changed in 4.0 (Relic rework happened in 3.0; 4.0 still has `StaticRoute`, `FlutterRoute`, `SpaRoute`). `StaticRoute.file` likely still exists. `WidgetRoute`, `JsonWidget` may still exist. We'll adapt.
- The 4.x `Serverpod` constructor may need `httpResponseHeaders`/`httpOptionsResponseHeaders` only if cookie auth; default fine.
- The 4.x auth `JwtConfigFromPasswords` / `EmailIdpConfigFromPasswords` may have changed names or send callbacks. We'll fix via analyzer.
- The 4.x `serverpod_auth_idp_server` email provider API may use `sendRegistrationVerificationCode` differently. Expect changes.
- `session.messages` in 4.x: streaming API still exists. Good.
- Models use `.spy.yaml` already. Good.
- `migrations/migration_registry.txt` and the new migration.

Version pins: serverpod 4.1.0? The latest docs 4.1.0. Use `4.1.0` exact. Flutter 3.44.4+ (use latest stable). Update `.fvmrc` to a Flutter version that includes Dart 3.12.2+; Flutter 3.44.4 or newer. The installed local Dart 3.13.5 is not enough for Flutter; need Flutter. Use FVM to install 3.44.4+.

Cloud `dartSdk: "3.12"` (Cloud supports 3.12, 3.13). If Flutter 3.44.4 ships Dart 3.12.2, pin 3.12. Or let it choose 3.13. Pin 3.12 for reproducibility.

Let me write the revised plan:

**Chosen stack:** Serverpod 4.1, Jaspr-only web UI, Cloud Growth min 1, Upstash Redis, managed Postgres.

**Phase A — Upgrade (do first)**
1. Tooling: `dart pub global deactivate serverpod_cli`; `dart install serverpod_cli`; `dart install serverpod_cloud_cli`; FVM install Flutter 3.44.4+.
2. Fix workspace paths + update `.fvmrc`.
3. Bump all `serverpod_*` to 4.1.0; update SDK constraint to `^3.12.2`.
4. `dart pub upgrade`; `serverpod generate`; fix breaking changes; `serverpod create-migration --tag upgrade-4-1 --force`.
5. Run `serverpod start` / tests; fix auth, web server, `server.dart` APIs.

**Phase B — make Jaspr the web UI**
1. Fix client_provider import & SERVER_URL.
2. Add build script (cross-platform) `tool/build_web.dart` or pubspec script: `jaspr build --dart-define=SERVER_URL=...` then copy `build/jaspr` → `server/web/jaspr`.
3. Server routes: remove landing + FlutterRoute + config route; add `SpaRoute(web/jaspr)`; add cache headers.
4. Add `<base href="/">` to Jaspr index.
5. Add `.scloudignore` to include `web/jaspr/**`; remove `web/app` from the equation; remove `flutter_build` script if Flutter web is no longer hosted (keep mobile build separately). Remove `web/app` from server .gitignore? Not necessary.
6. Verify admin + quiz routes on the SPA.

**Phase C — Cloud config**
- scloud.yaml with pre_deploy `serverpod generate` + `dart run tool/build_web.dart` (or `jaspr` build).
- `.scloudignore`.
- launch/project create; DB; Growth min 1.
- Redis Upstash env + password.
- public host env vars; `SERVERPOD_ALLOWED_ORIGINS` if cookie auth.
- custom domain.

**Phase D — deploy/verify**
- wet run, show files, deploy, status, logs; two-browser test; scale test; admin auth test.

**Phase E — hardening**
- Admin auth, answer uniqueness, email provider, seed idempotency, PIN collision, JSON encode.

**Decisions/notes**:
- Since Jaspr is the only web UI, the Flutter web build is not needed for Cloud; Flutter app remains for mobile/desktop with `--dart-define=SERVER_URL`.
- Growth needed (min 1) to avoid 5s streaming timeout on cold start.
- Serverpod 4 web auth may use cookies; if enabling, set `authCookie` + `allowedOrigins` (Jaspr origin) in `config/production.yaml` or env `SERVERPOD_ALLOWED_ORIGINS`.
- Redis required across podlets.

**What I'll do first if you say go**: fix workspace + upgrade, then Jaspr hosting. Ask for confirmation? The user gave decisions; I can say "I'll start with Phase A unless you want to review the upgrade diff first." That's good.

Should I mention the exact paths to change? Yes, concise.

Let me also include a note on Cloud CLI + Serverpod 4: `serverpod cloud launch` works after upgrade; no standalone needed. But install standalone is optional. Use `serverpod cloud` commands.

One more nuance: `scloud.yaml` `pre_deploy` runs commands in the project dir. `dart run tool/build_web.dart` in `namma_quiz_server` would need the Jaspr project path. The script can run `Process.run('jaspr', ['build', '--dart-define=SERVER_URL=...'], workingDirectory: '../namma_quiz_jaspr')` and copy. But `jaspr` CLI must be installed (`dart pub global activate jaspr_cli`). On Cloud build, pre_deploy runs locally, so fine. For CI, install it. The `SERVER_URL` should be configurable; the build script can read a `SERVER_URL` env var or a placeholder. Since the API URL is known (`https://namma-quiz.api.serverpod.space`), hardcode in the script or read `--dart-define` from an env var. Recommend `SERVER_URL` env var with a default. Note: The API URL is public, not a secret.

`jaspr build` in the workspace: `namma_quiz_jaspr` has `resolution: workspace`; running `dart pub get` at root resolves it. Running `jaspr build` in the subdir should work. If not, run `dart run jaspr_cli build` with the workspace. Fine.

Also: `web/jaspr` is generated and should be gitignored (not committed) but uploaded via `.scloudignore` negation. Add to `.gitignore` maybe. The build produces it pre-deploy.

Now, one concern: Cloud's pre-deploy hook runs `jaspr build` before upload, but the Cloud build then runs `dart pub get` on the server. The server doesn't depend on Jaspr, so the built static files are just assets. Good.

Also, the Jaspr app's `SERVER_URL` must be the API URL, which is cross-origin. CORS defaults allow it; confirm with a preflight. If using cookie auth, set `SERVERPOD_ALLOWED_ORIGINS=https://namma-quiz.serverpod.space` and `authCookie` config.

I think the response is ready. I'll present it and say I'll start with Phase A on confirmation. Since the question tool already got answers, no more questions. Use concise bullets.

I must not say "I will" too much. End with "Say go and I'll start with the workspace fix + 4.1 upgrade." That's an offer, not an action.

Let me ensure the response isn't overly long. Maybe ~70 lines. Fine.

## Revised plan: Serverpod 4.1 + Jaspr-only web UI + Cloud Growth

### Phase A — Upgrade to Serverpod 4.1 first

1. **Tooling**
   - Install Flutter 3.44.4+ (Dart 3.12.2+); update `.fvmrc` from 3.41.1.
   - `dart pub global deactivate serverpod_cli`
   - `dart install serverpod_cli`
   - `dart install serverpod_cloud_cli`
   - `dart pub global activate jaspr_cli`

2. **Fix the broken workspace before upgrading**
   - Root `pubspec.yaml:8-10`: point to `namma_quiz_client`, `namma_quiz_server`, `namma_quiz_jaspr`.
   - Fix old path deps in:
     - `namma_quiz_server/config/generator.yaml:3`
     - `namma_quiz_jaspr/pubspec.yaml:14-15`
     - `namma_quiz_flutter/pubspec.yaml:31-32`
   - `dart pub get` must pass before anything else.

3. **Bump Serverpod packages to `4.1.0`**
   - Server: `serverpod`, `serverpod_auth_idp_server`, `serverpod_test`
   - Client: `serverpod_client`, `serverpod_auth_idp_client`
   - Flutter: `serverpod_flutter`, `serverpod_auth_idp_flutter`
   - Set SDK constraints to `^3.12.2` in root and server pubspecs.

4. **Regenerate and migrate**
   ```bash
   dart pub upgrade
   cd namma_quiz_server
   serverpod generate
   serverpod create-migration --tag upgrade-4-1 --force
   ```
   Expect code changes in `server.dart` (auth config, web routes) and the auth IDP wiring. Fix via analyzer; run `serverpod start` and tests.

### Phase B — Make Jaspr the only web UI

1. **Fix the Jaspr client**
   - `namma_quiz_jaspr/lib/providers/client_provider.dart`
     - Change import to `package:namma_kahoot_client/namma_kahoot_client.dart`.
     - Replace `http://localhost:8080/` with:
       ```dart
       const serverUrl = String.fromEnvironment(
         'SERVER_URL',
         defaultValue: 'http://localhost:8080/',
       );
       ```

2. **Build Jaspr into the server**
   - `jaspr build --dart-define=SERVER_URL=https://namma-quiz.api.serverpod.space/`
   - Copy `namma_quiz_jaspr/build/jaspr` → `namma_quiz_server/web/jaspr`.
   - Add a cross-platform `namma_quiz_server/tool/build_web.dart` that runs this, so the Cloud pre-deploy hook works on Windows and Linux.

3. **Serve Jaspr at `/`**
   - In `lib/server.dart`, remove:
     - landing page route (`web/pages/index.html`)
     - Flutter route (`/app/*`) and `AppConfigRoute`
   - Add:
     ```dart
     pod.webServer.addRoute(
       SpaRoute(Directory('web/jaspr'), fallback: 'index.html'),
       '/*',
     );
     ```
   - Add `<base href="/">` to `namma_quiz_jaspr/web/index.html` so `/host` and `/play` load assets correctly.
   - Add cache headers for the SPA assets (short browser cache, longer CDN cache).
   - Keep the Flutter app for mobile/desktop only; remove `flutter_build` from the server scripts.

4. **Upload the build**
   - Add to `namma_quiz_server/.scloudignore`:
     ```gitignore
     !web/jaspr/
     !web/jaspr/**
     ```
   - Keep `web/jaspr` out of git, but verify it is in the deploy package with `serverpod cloud deploy --wet-run --show-files`.

### Phase C — Cloud project configuration

`namma_quiz_server/scloud.yaml`:

```yaml
project:
  projectId: namma-quiz
  dartSdk: "3.12"
  scripts:
    pre_deploy:
      - "serverpod generate"
      - "dart run tool/build_web.dart"
```

Create the project (Growth, DB enabled):

```bash
cd namma_quiz_server
serverpod cloud launch
```

Then set Redis and public URLs:

```bash
serverpod cloud password set redis "<upstash-password>"
serverpod cloud variable set SERVERPOD_REDIS_HOST "<upstash-host>"
serverpod cloud variable set SERVERPOD_REDIS_PORT "6380"
serverpod cloud variable set SERVERPOD_REDIS_ENABLED "true"
serverpod cloud variable set SERVERPOD_REDIS_REQUIRE_SSL "true"

serverpod cloud variable set SERVERPOD_API_SERVER_PUBLIC_HOST "namma-quiz.api.serverpod.space"
serverpod cloud variable set SERVERPOD_API_SERVER_PUBLIC_PORT "443"
serverpod cloud variable set SERVERPOD_API_SERVER_PUBLIC_SCHEME "https"

serverpod cloud variable set SERVERPOD_WEB_SERVER_PUBLIC_HOST "namma-quiz.serverpod.space"
serverpod cloud variable set SERVERPOD_WEB_SERVER_PUBLIC_PORT "443"
serverpod cloud variable set SERVERPOD_WEB_SERVER_PUBLIC_SCHEME "https"
```

In the Cloud console set **Growth** and **Min podlets = 1** (no cold starts during live quizzes).

If you enable cookie auth later, also set:
```bash
serverpod cloud variable set SERVERPOD_ALLOWED_ORIGINS "https://namma-quiz.serverpod.space"
```
Otherwise the client uses bearer tokens and the default wildcard CORS is sufficient.

### Phase D — Deploy and verify

```bash
serverpod cloud deploy --wet-run --show-files
serverpod cloud deploy
serverpod cloud status deployment show
serverpod cloud log
```

Verify:
- `/`, `/host`, `/play`, `/admin` load from Jaspr
- API URL is correct in the built Jaspr bundle
- host + player in two browsers receive live events
- scale to 2 podlets and repeat the stream test (Redis pub/sub)
- migrations applied, no `Failed to apply database migrations`
- admin route is protected once Phase E lands

### Phase E — Harden before public launch

- Authenticate `admin_endpoint.dart`; derive host identity from the session.
- Add an `answers` table with `unique(playerId, questionId)`; reject duplicate submissions.
- Replace logged email verification codes with a real email provider.
- Use `jsonEncode` for `dataJson` in `kahoot_endpoint.dart`.
- Retry PIN generation on collision and expire old sessions.
- Make `_seedDefaultQuiz` idempotent or move it to a one-time seed.
- Schedule Cloud database backups.
- Optional: GitHub Actions deploy with `SERVERPOD_CLOUD_TOKEN`.

Two notes:
- Flutter web is no longer part of the Cloud deployment, but the Flutter mobile app still works with `--dart-define=SERVER_URL=https://namma-quiz.api.serverpod.space/`.
- Serverpod 3.4.7 is EOL, so doing the 4.1 upgrade now avoids a second migration after launch.

Say go and I'll start with Phase A: fix the workspace paths, bump to Serverpod 4.1, and get `dart pub get` + `serverpod generate` passing.

---

## User

i have flutter 3.44.9 in fvm, also, the client app should be web only from jasper,no flutter web,and no flutter app too.

other than start the migration

---

## Assistant (Build · DeepSeek V4.1 Flash Free)

---

