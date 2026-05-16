#!/usr/bin/env bash
set -euo pipefail

PRESENTATION_ID="1c6bz_ZH6HcFRFs5KGOR-DAdnKMnqpP36b51K6kR-wtg"
PDF_URL="https://docs.google.com/presentation/d/${PRESENTATION_ID}/export/pdf?id=${PRESENTATION_ID}"

mkdir -p screenshots presentation

download_file() {
  local url="$1"
  local output="$2"
  local temp_output="${output}.download"

  rm -f "$temp_output"
  curl --ssl-no-revoke --http1.1 -fL --retry 5 --retry-delay 3 --retry-all-errors "$url" -o "$temp_output"
  mv "$temp_output" "$output"
}

validate_png() {
  local file="$1"
  local signature

  signature="$(od -An -tx1 -N8 "$file" | tr -d ' \n')"
  if [ "$signature" != "89504e470d0a1a0a" ]; then
    echo "Invalid PNG downloaded: $file"
    echo "This usually means Google returned an access/HTML page instead of the image."
    echo "Make the Google Slides file viewable by anyone with the link, then run this again."
    exit 1
  fi
}

validate_pdf() {
  local file="$1"
  local signature

  signature="$(head -c 4 "$file")"
  if [ "$signature" != "%PDF" ]; then
    echo "Invalid PDF downloaded: $file"
    echo "Make the Google Slides file viewable by anyone with the link, then run this again."
    exit 1
  fi
}

download_png() {
  local url="$1"
  local output="$2"

  download_file "$url" "$output"
  validate_png "$output"
}

download_file "$PDF_URL" "presentation/Indian-TV-Brand-Marketplace-Visibility-Analysis.pdf"
validate_pdf "presentation/Indian-TV-Brand-Marketplace-Visibility-Analysis.pdf"

# These are LARGE Google slide thumbnails at 1600x900, not the lower-quality export/png files.
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d7NdnVTZB88hVN9aApa-JQ4amNl8wpqdXQrUal6hk0lbwaqs8DasNjr57D8uR7riq8PN_n_BKx83hdGCK1pXyPF_klEMdzE9X4AwT3BCaF5-axib3-NDsEYqwisnUJkJd0NLoxtcO3UamjEKEP-CeJSf8aimRRcsGhpGnuTU2odDRs9=s1600" "screenshots/01_project_cover.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d5qsyOWWfqSRsmKgf-ZtCGCD2nQrcZ-ctE7vmrRNgpNplUAjCO50TtPpFRj4cPeYCHpMsHeWhWLt6-z0OuNR_MOoeme18egV7YKwfnhygQtsyR7U4893LzgHh7aD9vI6TpgfO0i1sXIfhaM58ajVLRXBu8d9gRn4sRpVfhMgOM7A0Rk=s1600" "screenshots/02_monthly_sales_trends.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d4FKqJrqaaWJaU62i8F1n1RWc384IEKuWQ_ST3gVrYhhKH8Pt6Xp0wpOpAa29mCt6YPJNzrlEKzG5JQ98bsL5h3LIiacda0HwdiPsAS6j3YojxPJdF6GYUHngiLN_EEqgCLYQCYjtH6gxydVVU8qBfEOWcNiXqwr1u5IsRWYaGJnd3J=s1600" "screenshots/03_yoy_performance.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d5mCxN4n5a_KEM_kSbZCwpdIfkiVJO6u_HfWsZCAef1xLLpYDU2HIAYPENCvYHAv6BDTmCgqKXOUABUJMgWZylY6XEdwv9KqRlyEBfMt7W3SFfmAyntZEOjHfZe8aeNXHFl08RoXLHXjJh-PEbgY45z7std70Sk20tp6Xtqhx67mOTz=s1600" "screenshots/04_correlation_analysis.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d4SEPucle622cbdl2wvSW_pEM5nwtfzjiKXMdgloJE-CBQX15Y9RRpbkHoh9FYFgL6JBKEdlnLh3z3AA8_zXJkjuktMlaHfZp_ArxGURR9xnGNkSHLj_pAHxFlZCqtBtoAzUwqbiElrVW19Y20hrKg-eMKwVlvLx0eZl4DhBoujoJSM=s1600" "screenshots/05_offer_impact_analysis.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d5nfnFhcNe7AdYFnGUCoJ9SefTMjR4zdSCNAajBQ73WsHiq6o5ifG9UlQiqI8wNi3VBg1pZ4H3PDN2CourPKpNrPOM2Kv0H81sL3LmcgwlzkXH-Meg7rG6WSsJcW39c0yW3dpIvmaDhooxzi465vzo7a7xlts79eHtOJGVATFmV01zx=s1600" "screenshots/06_stable_traffic_analysis.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d4mDhwIbCK_QzxU5XpFmM3LeDc-4vGMtHYT-LHBeS9zVLLRFPTlMxMgS_MnpSHnSxI9we5ir2kwkzxieR-1FszxMRl1Bs6cgbtn5XNLo1bdmQVoI1aT7BfK0IuJpHYt52gc2XS4lkSXVNQR004Tc1nsqnU8kEioXMF08OLZA9YPy6GQ=s1600" "screenshots/07_return_rate_analysis.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d7YXK-r1SnrsKsVJN6OUa1INqRB-dHvng8nCGA90XwNnVmezSRqSllZrZLV7wZuQCDSu3W-x60ZFSVQrMuN8oCNm08tcxsveLYdSMAUNqsv4c6eukkm2VOoqS-TZPitlx1lkcHnFV3c5qX9j6X1S5Wds46rsLDQlN-Bb9wnp0RcHG7F=s1600" "screenshots/08_corrective_actions.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d5WKIZwFoYqgLOyasozB6mmqB8ep-o5FQ9m3puQDulKoIaFEwOphgxCHj5BJHkXdDRk3aKjN8abT6pvShqh83Di7AeUTF0-sz7FL13T2tPG1KvPjBkTj_qSUKvIO_JIm-XA-YhiTrhcdt5cGMk1vQ37NGYV1_Yr72bSLJ2gFiLuegri=s1600" "screenshots/09_marketplace_visibility_pitch.png"
download_png "https://lh7-us.googleusercontent.com/docsdf/AFQj2d71IRsJX9LHh9n_PR9gJlP2Qu8aKR6toW2z4DuMIOt0jZfTUo4gX5JK36njFzTUo-OiCE_EEdxd1hIPqCC1SnaUMXN-DY0ZUFM6kFoVyBJ7cX68dhe0KNhuduKgay0wRw7Tg8INB6b50ljK9DG7R4BvIiehCWg7LL2zNtZmGvtmBLEk=s1600" "screenshots/10_business_case.png"

echo "Downloaded and validated high-resolution PDF and PNG assets."
