#!/bin/bash
# Dynamic Sway output and workspace assignment.
# If the user's usual outputs are present, keep the exact layout.
# Otherwise, arrange all connected outputs left-to-right and split
# workspaces 1-5 / 6-10 across the first two displays.

set -euo pipefail

# Query outputs as JSON
outputs=$(swaymsg -t get_outputs)

# Helper: check if a specific output is active
output_active() {
  local name=$1
  echo "$outputs" | jq -e --arg name "$name" '.[] | select(.name == $name and .active)' >/dev/null
}

# Preferred layout when the known monitors are connected
if output_active "HDMI-A-1" && output_active "HDMI-A-2"; then
  swaymsg 'output HDMI-A-2 resolution 2560x1440 position 0 0'
  swaymsg 'output HDMI-A-1 mode 2560x1440@144Hz position 2560 0'
  swaymsg 'workspace 1 output HDMI-A-2'
  swaymsg 'workspace 2 output HDMI-A-2'
  swaymsg 'workspace 3 output HDMI-A-2'
  swaymsg 'workspace 4 output HDMI-A-2'
  swaymsg 'workspace 5 output HDMI-A-1'
  swaymsg 'workspace 6 output HDMI-A-1'
  swaymsg 'workspace 7 output HDMI-A-1'
  swaymsg 'workspace 8 output HDMI-A-1'
  swaymsg 'workspace 9 output HDMI-A-1'
  swaymsg 'workspace 10 output HDMI-A-1'
  exit 0
fi

# Fallback: collect active outputs, left-to-right
mapfile -t active < <(echo "$outputs" | jq -r '.[] | select(.active) | .name')

if [[ ${#active[@]} -eq 0 ]]; then
  exit 0
fi

# Arrange outputs side by side, 2560px wide each
x=0
for output in "${active[@]}"; do
  swaymsg "output ${output} resolution 2560x1440 position ${x} 0"
  x=$((x + 2560))
done

# Assign workspaces
left=${active[0]}
right=${active[0]}
if [[ ${#active[@]} -ge 2 ]]; then
  right=${active[1]}
fi

for ws in 1 2 3 4 5; do
  swaymsg "workspace ${ws} output ${left}"
done

for ws in 6 7 8 9 10; do
  swaymsg "workspace ${ws} output ${right}"
done
