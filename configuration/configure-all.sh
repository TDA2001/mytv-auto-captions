#!/bin/bash
AWS_REGION=$(aws configure get region)

# Configure overlays
node ./cleanup-overlays.js --tableName ivs-transcribe-demo-overlays-6hy7gr --awsRegion $AWS_REGION
node ./load-overlays.js --filePath data/overlays.json --dynamoDbTable ivs-transcribe-demo-overlays-6hy7gr --awsRegion $AWS_REGION

# Configure custom vocabulary
aws transcribe delete-vocabulary --vocabulary-name ivs-transcribe-demo-custom-vocabulary-6hy7gr
bash ./create-custom-vocabulary.sh data/custom-vocabulary.txt

# Configure vocabulary filter
aws transcribe delete-vocabulary-filter --vocabulary-filter-name ivs-transcribe-demo-vocabulary-filter-6hy7gr
bash ./create-vocabulary-filter.sh data/vocabulary-filter.txt

# Restart Transcribe container
bash ./stop-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr
bash ./start-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr