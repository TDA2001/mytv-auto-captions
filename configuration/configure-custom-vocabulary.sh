# Remove current
aws transcribe delete-vocabulary --vocabulary-name ivs-transcribe-demo-custom-vocabulary-6hy7gr

# Create new
bash ./create-custom-vocabulary.sh data/custom-vocabulary.txt

# Restart Transcribe container
bash ./stop-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr
bash ./start-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr