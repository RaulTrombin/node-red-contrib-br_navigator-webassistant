#!/bin/bash

# Iterate over folders inside "subflows"
for folder in subflows/*; do
    if [ -d "$folder" ]; then
        cd "$folder" || exit

        node-red-nodegen flows.json

        folder_name=$(basename "$folder")

        mkdir -p "../../nodes/$folder_name"

        cp node-red-contrib-navigator-webassistant/subflow.js node-red-contrib-navigator-webassistant/subflow.json "../../nodes/$folder_name"

        cd - || exit
    fi
done

# Iterate over folders inside "nodes"
for folder in nodes/*; do
    if [ -d "$folder" ]; then
        node_name=$(basename "$folder")
        subflow_path="$folder/subflow.js"

        # Check if subflow.js exists before adding to package.json
        if [ -f "$subflow_path" ]; then
            # Add entry to package.json
            jq --arg node_name "$node_name" --arg subflow_path "$subflow_path" \
                '.["node-red"]["nodes"][$node_name] = $subflow_path' \
                package.json > temp.json && mv temp.json package.json
        fi
    fi
done