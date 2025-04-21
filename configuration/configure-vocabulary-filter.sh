# Remove current
aws transcribe delete-vocabulary-filter --vocabulary-filter-name ivs-transcribe-demo-vocabulary-filter-6hy7gr

# Create new
bash ./create-vocabulary-filter.sh data/vocabulary-filter.txt

# Restart Transcribe container
bash ./stop-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr
bash ./start-container.sh ivs-transcribe-demo-cluster-6hy7gr ivs-transcribe-demo-transcribe-service-6hy7gr