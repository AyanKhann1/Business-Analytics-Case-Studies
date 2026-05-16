#!/usr/bin/env bash
set -e

PRESENTATION_ID="1c6bz_ZH6HcFRFs5KGOR-DAdnKMnqpP36b51K6kR-wtg"
BASE="https://docs.google.com/presentation/d/${PRESENTATION_ID}/export"

mkdir -p screenshots presentation

curl -L "${BASE}/pdf?id=${PRESENTATION_ID}" \
  -o "presentation/Indian-TV-Brand-Marketplace-Visibility-Analysis.pdf"

curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=p" \
  -o "screenshots/01_project_cover.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_46" \
  -o "screenshots/02_monthly_sales_trends.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_60" \
  -o "screenshots/03_yoy_performance.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_74" \
  -o "screenshots/04_correlation_analysis.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_88" \
  -o "screenshots/05_offer_impact_analysis.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_95" \
  -o "screenshots/06_stable_traffic_analysis.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_57" \
  -o "screenshots/07_return_rate_analysis.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37bfbeece16_0_123" \
  -o "screenshots/08_corrective_actions.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37c42cdf724_0_4" \
  -o "screenshots/09_marketplace_visibility_pitch.png"
curl -L "${BASE}/png?id=${PRESENTATION_ID}&pageid=g37c42cdf724_0_11" \
  -o "screenshots/10_business_case.png"

echo "Downloaded PDF and screenshot assets."
