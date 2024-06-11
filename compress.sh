#!/bin/bash

# Kök dizin ve çıktı dizinini tanımlayın
root_dir="."
output_dir="/Users/alperenkilic/Downloads/output"

# Çıkış dizini yoksa oluşturun
mkdir -p "$output_dir"

# Tüm JPG, JPEG ve PNG dosyalarını bulup işleyin
find "$root_dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | while read -r img; do
    # Orijinal dosyanın dizin yapısını koruyarak çıktı dosyasının yolunu oluşturun
    output_img="$output_dir/${img#$root_dir/}"
    output_img="${output_img%.*}.jpg"
    
    # Çıktı dizinini oluşturun (alt dizinler dahil)
    mkdir -p "$(dirname "$output_img")"
    
    # ffmpeg ile sıkıştır ve çıktı dizinine kaydet
    ffmpeg -i "$img" -qscale:v 2 "$output_img"
done

