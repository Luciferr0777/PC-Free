# PC-Free setup — Windows 10 in browser

## Real unicode seedha raasta (Codespaces)

1. GitHub pe is repo ko **Fork** karo.
2. Apne fork me **Code → Codespaces → Create codespace on main**.
3. Codespace khulne do (~2 min).
4. Terminal me ye files banao (ya clone karke paste karo):
   - `windows10.yml`
   - `.env.example`
   - `.gitignore`
   - `setup-windows.sh`
5. `.env` banao:
   ```bash
   cp .env.example .env
   nano .env
   ```
   `WINDOWS_USERNAME` aur `WINDOWS_PASSWORD` badlo.
6. Chalao:
   ```bash
   bash setup-windows.sh
   ```
7. Codespace ke **Ports** tab me `8006` ko **Public** karo, globe icon dabao.
8. Pehli boot 5–10 min leti hai (~4GB download). Download ke baad desktop dikhega.

## Local machine par nahi chal sakta

Is sandbox me `/proc`, cgroups, mount aur KVM nahi hai — Docker yahan nahi chal sakta.
Isliye Windows cloud desktop sirf GitHub Codespaces me banega.

## Resource settings (free tier ke liye tuned)

| Setting | Value | Note |
|---|---|---|
| `RAM_SIZE` | `6G` | Windows 10 ka minimum |
| `CPU_CORES` | `2` | Free Codespace 2-core |
| `DISK_SIZE` | `64G` | Codespace storage 64G+ chahiye |
| `/dev/kvm` | enabled | Is Codespace me `/dev/kvm` maujood hai — hardware acceleration chalega |

Agar slow ho to `RAM_SIZE: "4G"` try karo, par Windows 10 stable nahi chalega.

## Useful commands

```bash
docker-compose -f windows10.yml up -d    # start
docker stop windows                       # shutdown
docker restart windows                    # freeze fix
docker logs -f windows                    # logs
docker-compose -f windows10.yml down -v   # delete everything
```

## GitHub access

Is machine par `gh` nahi hai aur koi GitHub login nahi hai.
Fork/Codespace tumhe browser me apne GitHub account se karna padega.
Agar tum device-code login chahte ho to bat — `gh` install karke setup kar dunga.
