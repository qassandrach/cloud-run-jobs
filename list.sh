#!/usr/bin/env bash

set -euo pipefail

CLOUD_RUN_TASK_INDEX=${CLOUD_RUN_TASK_INDEX:=0}
CLOUD_RUN_TASK_ATTEMPT=${CLOUD_RUN_TASK_ATTEMPT:=0}

echo "Starting Task #${CLOUD_RUN_TASK_INDEX}, Attempt #${CLOUD_RUN_TASK_ATTEMPT}..."

prjs=( $(gcloud projects list | tail -n +2 | awk {'print $1'}) )


project=${prjs[$CLOUD_RUN_TASK_INDEX]}
echo "Setting Project: $project"
echo $(gcloud config set project $project)
gcloud compute disks list --filter="-users:*" | awk '{print $1,",",$2,",",$3,",",$4,",",$5,",",$6}' >> disks-$project.csv
gsutil cp disks-$project.csv gs://orphaned-disks/