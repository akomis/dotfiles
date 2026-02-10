# dotfiles

Arch Linux dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── wayland/          # Active setup (Sway, Waybar, Wofi, etc.)
│   ├── deploy.sh
│   └── <package>/    # Stow packages (alacritty, sway, waybar, ...)
└── x11/              # Archived setup (i3, Polybar, Picom, etc.)
    ├── deploy.sh
    └── <package>/    # Stow packages (alacritty, i3, polybar, ...)
```

Each directory under `wayland/` or `x11/` is a stow package — its contents mirror the home directory structure.

## Usage

### Wayland (active)

```bash
bash wayland/deploy.sh
```

### X11 (archived)

```bash
bash x11/deploy.sh
```

### Laptop packages

Append `LAPTOP=true` to install laptop-specific packages (tlp, acpi):

```bash
LAPTOP=true bash wayland/deploy.sh
```

## Adding packages

Any new packages should be added to the `packages` array in `wayland/deploy.sh`. The x11 setup is archived and no longer maintained.
