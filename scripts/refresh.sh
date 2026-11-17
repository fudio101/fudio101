#!/usr/bin/env bash
# Refreshes the generated parts of the profile README:
#   - assets/header.svg, assets/footer.svg  (capsule-render)
#   - assets/typing.svg                     (readme-typing-svg)
#   - the "Open source" block between <!-- oss:start --> and <!-- oss:end -->
# Needs: bash, curl, gh (authenticated via GH_TOKEN), jq-compatible `gh --jq`.
# A failed download never overwrites the committed file, so a flaky upstream
# service can only make the profile stale, never broken.
set -euo pipefail
cd "$(dirname "$0")/.."

USER_LOGIN="fudio101"
NAVY="0D1B2A"
CYAN="00ADD8"

# ---------- data ----------
stars() { gh api "repos/$1" --jq .stargazers_count; }
prs()   { gh api search/issues -X GET -f q="author:$USER_LOGIN type:pr repo:$1 $2" --jq .total_count; }
human() { awk -v n="$1" 'BEGIN { if (n >= 1000) printf "%.1fk", n/1000; else printf "%d", n }'; }

GARMIN_STARS=$(human "$(stars Taxuspt/garmin_mcp)")
GARMIN_MERGED=$(prs Taxuspt/garmin_mcp is:merged)
GARMIN_OPEN=$(prs Taxuspt/garmin_mcp is:open)
SDM_MERGED=$(prs sdm660-mainline/linux is:merged)

plural() { [ "$1" = 1 ] && echo "$1 $2" || echo "$1 ${2}s"; }

# ---------- svg downloads ----------
urlenc() { printf '%s' "$1" | jq -sRr @uri; }

fetch_svg() { # url dest
  local tmp
  tmp=$(mktemp)
  if curl -fsSL --retry 3 --max-time 30 "$1" -o "$tmp" && grep -q '<svg' "$tmp"; then
    mv "$tmp" "$2"
    chmod 644 "$2"
    echo "updated $2"
  else
    rm -f "$tmp"
    echo "kept old $2 (download failed)" >&2
  fi
}

CAPSULE="https://capsule-render.vercel.app/api?type=waving&color=0:${NAVY},100:${CYAN}"
fetch_svg "${CAPSULE}&height=190&section=header&text=$(urlenc 'Adrian Nguyen')&fontSize=50&fontColor=FFFFFF&fontAlignY=36&desc=$(urlenc 'Backend Engineer · Go & TypeScript · Open source')&descSize=18&descAlignY=58&descColor=E0F7FC" assets/header.svg
fetch_svg "${CAPSULE}&height=110&section=footer" assets/footer.svg

LINES=(
  "Backend engineer · Go & TypeScript · since 2023"
  "Payments & CRM microservices at Qualgo"
  "Mainline Linux on SDM660 · merged upstream"
  "Contributor to garmin_mcp (${GARMIN_STARS} ★)"
  "Tailscale on a tiny ESP32"
)
JOINED=$(IFS=';'; echo "${LINES[*]}")
fetch_svg "https://readme-typing-svg.demolab.com?font=Fira+Code&weight=500&size=18&pause=1800&color=${CYAN}&center=true&vCenter=true&width=640&lines=$(urlenc "$JOINED" | sed 's/%3B/;/g')" assets/typing.svg

# ---------- open source block ----------
OSS=$(cat <<EOF
- **[sdm660-mainline/linux](https://github.com/sdm660-mainline/linux/pulls?q=is%3Apr+author%3A${USER_LOGIN}+is%3Amerged)** – mainline Linux for Snapdragon 660 · **$(plural "$SDM_MERGED" "PR") merged**: Vsmart Active 1 board support, Himax HX83112A panel driver, touchscreen and SMB1351 charger
- **[postmarketOS/pmaports](https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/9720)** – **!9720 merged**: \`device-vsmart-zangyapro\` and its firmware package, plus a [device wiki page](https://wiki.postmarketos.org/wiki/Vsmart_Active_1_(vsmart-zangyapro))
- **[Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp/pulls?q=is%3Apr+author%3A${USER_LOGIN})** – MCP server for Garmin Connect · ★ ${GARMIN_STARS} · **${GARMIN_MERGED} merged**$( [ "$GARMIN_OPEN" -gt 0 ] && echo ", ${GARMIN_OPEN} open" )
EOF
)

OSS="$OSS" awk '
  /<!-- oss:start -->/ { print; print ENVIRON["OSS"]; skip = 1; next }
  /<!-- oss:end -->/   { skip = 0 }
  !skip
' README.md > README.md.tmp && mv README.md.tmp README.md
echo "updated README open-source block (sdm660=$SDM_MERGED garmin=$GARMIN_MERGED/$GARMIN_OPEN stars=$GARMIN_STARS)"
