#!/bin/bash

# Script to update Pentrace
# This script assumes you are in the Pentrace project directory
# and that the project is managed with Git.

echo "Updating Pentrace..."

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "Error: git is not installed. Please install git to update."
    exit 1
fi

# Check if the current directory is a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null
then
    echo "Error: Not a git repository. Make sure you are in the Pentrace project directory."
    exit 1
fi

# Fetch the latest changes from the remote repository
echo "Fetching latest changes from remote..."
git fetch --all

# Get the current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Pull the latest changes for the current branch
echo "Pulling latest changes for branch '$current_branch'..."
if git pull origin "$current_branch"; then
    echo "Pentrace updated successfully."

    # Optional: Add any post-update commands here
    # For example, if you need to re-run an installation or configuration script:
    # if [ -f "./install.sh" ]; then
    #   echo "Running post-update installation/configuration..."
    #   bash ./install.sh --update # or similar
    # fi
    # if [ -f "./config.sh" ]; then
    #   echo "Running post-update configuration..."
    #   bash ./config.sh
    # fi

    echo "Update complete."
else
    echo "Error: Failed to pull latest changes. Please check for conflicts or network issues."
    exit 1
fi

exit 0
