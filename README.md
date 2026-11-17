<img src="assets/header.svg" width="100%" alt="Adrian Nguyen – Backend Engineer · Go & TypeScript · Open source"/>

<div align="center">

<a href="https://github.com/fudio101"><img src="assets/typing.svg" alt="Backend engineer · Go & TypeScript"/></a>

<br/>

<a href="https://www.linkedin.com/in/fudio101/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/></a>
<img src="https://img.shields.io/badge/Ho_Chi_Minh_City-Vietnam-0D1B2A?style=for-the-badge&logo=googlemaps&logoColor=00ADD8" alt="Ho Chi Minh City, Vietnam"/>
<a href="https://github.com/fugo101"><img src="https://img.shields.io/badge/FuGo-side_projects-0D1B2A?style=for-the-badge&logo=github&logoColor=00ADD8" alt="FuGo side projects"/></a>

</div>

---

### 👋 About me

- I'm **Adrian Nguyen** (Nguyễn Đỗ Thế Nguyên), a backend engineer in Ho Chi Minh City, shipping production software since 2023 and leaning further into full-stack every year.
- At **Qualgo** I build Go microservices for payments and CRM – gRPC + grpc-gateway, PostgreSQL, Redis, River job queues, Stripe and OpenTelemetry – and the React front-ends on top of them.
- I like boring, well-tested services: an explicit domain model, decisions written down as ADRs, and CI that catches the mistake before a reviewer has to.
- Outside work I contribute upstream: mainline Linux for an old phone, an MCP server for Garmin data, and WireGuard / Tailscale on ESP32.

---

### 🧰 Tech I work with

**Backend**

![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)
![gRPC](https://img.shields.io/badge/gRPC-244C5A?style=flat)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=nodedotjs&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat&logo=typescript&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=flat&logo=php&logoColor=white)
![Laravel](https://img.shields.io/badge/Laravel-FF2D20?style=flat&logo=laravel&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)

**Data**

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?style=flat&logo=redis&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)

**Frontend**

![React](https://img.shields.io/badge/React-20232A?style=flat&logo=react&logoColor=61DAFB)
![Next.js](https://img.shields.io/badge/Next.js-000000?style=flat&logo=nextdotjs&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-646CFF?style=flat&logo=vite&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat&logo=tailwindcss&logoColor=white)
![TanStack Query](https://img.shields.io/badge/TanStack_Query-FF4154?style=flat&logo=reactquery&logoColor=white)

**Infra & tooling**

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?style=flat&logo=helm&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=flat&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=githubactions&logoColor=white)
![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-425CC7?style=flat&logo=opentelemetry&logoColor=white)

**Side quests**

![C](https://img.shields.io/badge/C-A8B9CC?style=flat&logo=c&logoColor=black)
![ESP-IDF](https://img.shields.io/badge/ESP--IDF-E7352C?style=flat&logo=espressif&logoColor=white)
![Linux kernel](https://img.shields.io/badge/Linux_kernel-FCC624?style=flat&logo=linux&logoColor=black)
![postmarketOS](https://img.shields.io/badge/postmarketOS-009900?style=flat)

---

### 🛠️ Things I've built

**[Grimoire](https://github.com/fugo101/grimoire)** – a self-hosted expense tracker.
Next.js 16 (App Router) and React 19 with TanStack Query, Table, Form and Virtual, SQLite through Drizzle ORM, and
jose-signed sessions. Every transaction has two independent dimensions, *Purpose* and *Funding Source*, written up in a
domain glossary and ADRs. Hardened with a nonce-based CSP, login rate-limiting and a server that refuses to boot with a
weak secret; ships as a Docker image with a health check.

**[MicroLink](https://github.com/fugo101/microlink)** – a maintained fork of
[CamM2325/microlink](https://github.com/CamM2325/microlink), a Tailscale client for ESP32: the ts2021 control protocol,
WireGuard, DISCO path discovery and DERP relays in about 100 KB of SRAM. The fork moves it to ESP-IDF 6, swaps in our own
[wireguard-lwip](https://github.com/fugo101/wireguard-lwip) component (DERP/magicsock, multi-peer, upstream security
fixes) and keeps handshake timestamps across reboots.

**[active1-pmos](https://github.com/fudio101/active1-pmos)** – a postmarketOS port that turns a Vsmart Active 1
(Qualcomm SDM660) into a headless home server. The mainline kernel boots its own initramfs straight past the bootloader's
dm-verity; GPU, DSI panel, Wi-Fi, Bluetooth and charging all work. The device tree and panel driver are merged in
sdm660-mainline/linux, and the device package in postmarketOS pmaports.

**[LeagueKit](https://github.com/fugo101/LeagueKit)** – a no-build plugin suite for the League of Legends client
(Pengu Loader): auto-accept that survives flaky sockets (event observer + polling fallback + bounded retries), auto-honor
with preferred players, and leader-aware auto play-again, all configured from one English/Vietnamese dialog.

---

### 🌱 Open source

<!-- oss:start -->
- **[sdm660-mainline/linux](https://github.com/sdm660-mainline/linux/pulls?q=is%3Apr+author%3Afudio101+is%3Amerged)** – mainline Linux for Snapdragon 660 · **2 PRs merged**: Vsmart Active 1 board support, Himax HX83112A panel driver, touchscreen and SMB1351 charger
- **[postmarketOS/pmaports](https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/9720)** – **!9720 merged**: `device-vsmart-zangyapro` and its firmware package, plus a [device wiki page](https://wiki.postmarketos.org/wiki/Vsmart_Active_1_(vsmart-zangyapro))
- **[Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp/pulls?q=is%3Apr+author%3Afudio101)** – MCP server for Garmin Connect · ★ 1.5k · **1 merged**, 1 open
<!-- oss:end -->

---

### 📊 GitHub stats

<p align="center">
  <img src="profile-summary-card-output/algolia/0-profile-details.svg" width="100%" alt="Profile details"/>
</p>
<p align="center">
  <img src="profile-summary-card-output/algolia/3-stats.svg" width="49%" alt="Stats"/>
  <img src="profile-summary-card-output/algolia/2-most-commit-language.svg" width="49%" alt="Most commit language"/>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/snake/github-snake-dark.svg"/>
  <source media="(prefers-color-scheme: light)" srcset="assets/snake/github-snake.svg"/>
  <img alt="Snake eating my contribution graph" src="assets/snake/github-snake.svg" width="100%"/>
</picture>

<img src="assets/footer.svg" width="100%" alt=""/>
