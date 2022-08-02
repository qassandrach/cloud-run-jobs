# Use the official Google Cloud SDK image from GCR as
# a base image
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

# Execute next commands in the directory /workspace
RUN mkdir workspace && cd workspace

# Copy over the script to the /workspace directory
COPY list.sh .

# Just in case the script doesn't have the executable bit set
RUN chmod +x ./list.sh

# Run the script when starting the container
CMD [ "./list.sh" ]
