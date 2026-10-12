# Castopod mirror

A mirror of [Castopod](https://castopod.org), whose upstream lives at
[code.castopod.org/adaures/castopod](https://code.castopod.org/adaures/castopod)
(licence: AGPL-3.0, see `LICENSE.md` on any upstream branch). It keeps a copy in case upstream disappears.

This `sync` branch holds only the mirroring workflow. All other branches and tags are
upstream's, unchanged.

The [sync workflow](.github/workflows/sync.yml) runs daily and keeps three copies up to date:

| What | Where | Copied from |
|---|---|---|
| Git branches and tags | this repository | `code.castopod.org/adaures/castopod.git` |
| Release packages (`castopod-X.Y.Z.zip`/`.tar.gz`) | [Releases](../../releases) | GitLab releases |
| Docker images (amd64 + arm64) | `ghcr.io/rudik99/castopod:X.Y.Z` | `docker.io/castopod/castopod:X.Y.Z` |

Only stable releases from 1.13.5 onwards are copied.

## Safety rules

- Nothing is ever deleted. If an upstream branch, tag, release or image disappears, the copy here stays.
- `main`, `develop`, `next`, `alpha`, `beta` and all tags are never force-updated. If upstream rewrites
  them, the push is rejected and the workflow fails. Feature branches follow upstream force-pushes.
- An image tag already copied is never overwritten. If upstream re-publishes a tag with a different
  digest, the new one is stored as `X.Y.Z-<digest prefix>` and the run shows a warning.
- The workflow pushes with `GITHUB_TOKEN`, which cannot add workflow files. If upstream ever adds
  `.github/workflows/`, the push fails rather than running upstream CI here.

**A failed run (GitHub emails you) means upstream changed history, moved or disappeared.
Investigate before changing anything here.**

The workflow commits `.github/keepalive` every 30 days, because GitHub pauses scheduled workflows
in repositories with no activity for 60 days.

## Using it

- Image: replace `castopod/castopod:1.13.5` with `ghcr.io/rudik99/castopod:1.13.5`.
- Building from source needs the release package, not just the git tree: the production Dockerfiles
  `COPY castopod /var/www/castopod`, a bundle built by upstream's CI. Unpack the release package as
  `castopod/` next to `docker/production/` and build `docker/production/castopod/Dockerfile`.
