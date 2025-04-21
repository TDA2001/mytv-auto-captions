#!/bin/bash
AWS_REGION=$(aws configure get region)

# Configure overlays
node ./cleanup-overlays.js --tableName ivs-transcribe-demo-overlays-6hy7gr --awsRegion $AWS_REGION
node ./load-overlays.js --filePath data/overlays.json --dynamoDbTable ivs-transcribe-demo-overlays-6hy7gr --awsRegion $AWS_REGION

# Restart Transcribe container
bash ./stop-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr
bash ./start-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr