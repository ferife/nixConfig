#!/usr/bin/env bash

      PALETTE_FILE="${theme}"
      INPUT_IMAGE="$2"
      OUTPUT_IMAGE="$3"

      # Sigmoidal contrast: <sharpen> x <midpoint>%
      # Higher sharpen = more contrast, midpoint shifts the center of the curve
      SIGMOIDAL_SHARPEN="${4:-5}"
      SIGMOIDAL_MIDPOINT="${5:-50}"

      TEMP_DIR=$(mktemp -d)
      trap 'rm -rf "$TEMP_DIR"' EXIT

      if [[ ! -f "$PALETTE_FILE" ]]; then
        echo "Error: Palette file '$PALETTE_FILE' not found."
        exit 1
      fi

      if [[ ! -f "$INPUT_IMAGE" ]]; then
        echo "Error: Input image '$INPUT_IMAGE' not found."
        exit 1
      fi

      echo "Processing: $INPUT_IMAGE -> $OUTPUT_IMAGE"
      echo "Using Palette: $PALETTE_FILE"
      echo "Sigmoidal Contrast: ${SIGMOIDAL_SHARPEN}x${SIGMOIDAL_MIDPOINT}%"
      echo ""
      echo "Generating luminance-sorted palette..."

      yq '.palette | to_entries[] | .value' "$PALETTE_FILE" | grep -v '^$' | grep -v '^#' > "$TEMP_DIR/raw_colors.txt"
      if [[ ! -s "$TEMP_DIR/raw_colors.txt" ]]; then
        echo "Error: No valid colors found in palette."
        exit 1
      fi

      while IFS= read -r color; do
        [[ -z "$color" ]] && continue
        color=$(echo "$color" | tr -d '[:space:]' | tr -d '"')
        [[ "$color" != \#* ]] && color="#$color"
        hex="${color#\#}"

      # Validate length
        if [[ ${#hex} -ne 6 ]]; then
          echo "Warning: Skipping invalid color: $color"
          continue
        fi

        r=$((16#${hex:0:2}))
        g=$((16#${hex:2:2}))
        b=$((16#${hex:4:2}))
        lum=$(awk "BEGIN {printf \"%d\", ($r * 0.2126 + $g * 0.7152 + $b * 0.0722)}")

        echo "$lum $color" >> "$TEMP_DIR/sorted_lum.txt"
        done < "$TEMP_DIR/raw_colors.txt"

        sort -n "$TEMP_DIR/sorted_lum.txt" > "$TEMP_DIR/sorted_lum_final.txt"
        cut -d ' ' -f2 "$TEMP_DIR/sorted_lum_final.txt" > "$TEMP_DIR/sorted_colors.txt"

        COLOR_COUNT=$(wc -l < "$TEMP_DIR/sorted_colors.txt")
        if [[ "$COLOR_COUNT" -eq 0 ]]; then
          echo "Error: No valid colors processed"
          exit 1
        fi

      echo "Step 2: Building color lookup gradient..."
      {
        echo "P3"
        echo "$COLOR_COUNT 1"
        echo "255"

        while IFS= read -r color; do
          hex="${color#\#}"
          r=$((16#${hex:0:2}))
          g=$((16#${hex:2:2}))
          b=$((16#${hex:4:2}))
          echo "$r $g $b"
        done < "$TEMP_DIR/sorted_colors.txt"
      } > "$TEMP_DIR/lookup.ppm"
      magick "$TEMP_DIR/lookup.ppm" "$TEMP_DIR/lookup.png"

      echo "Step 3: Enhancing contrast..."
      cp "$INPUT_IMAGE" "$TEMP_DIR/enhanced.png"

      # Apply Sigmoidal Contrast (Modern replacement for -contrast)
      # Syntax: -sigmoidal-contrast <sharpen>x<midpoint>%
      # Sharpen: Amount of contrast (higher = more contrast)
      # Midpoint: The gray level where the contrast curve is centered (0-100%)
      magick "$TEMP_DIR/enhanced.png" \
      "-sigmoidal-contrast" "${SIGMOIDAL_SHARPEN}x${SIGMOIDAL_MIDPOINT}%" \
      "$TEMP_DIR/enhanced.png"

      echo "Step 4: Applying color mapping with dithering..."

      # Use -remap with the palette image
      magick "$TEMP_DIR/enhanced.png" \
      "-remap" "$TEMP_DIR/lookup.png" \
      "-dither" "floyd-steinberg" \
      "$OUTPUT_IMAGE"

      echo "Output saved to: $OUTPUT_IMAGE"
