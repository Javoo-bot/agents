# Testing Azure API Integration in VS Code

This repository provides a quick way to test that the Azure API functions correctly within Visual Studio Code.

## Overview

- **Initial Testing with Postman**: Verified that POST requests were being sent correctly.
- **Module Creation in VS Code**: After identifying the error, a module was created in VS Code to test the implementation.

## 1. Serverless Endpoint Creation (Azure ML)

### Steps:

1. **Created a Serverless Endpoint**:
   - In Azure Machine Learning, an endpoint named `Phi-3-mini-128k-instruct` was set up.

2. **Retrieved Endpoint Details**:
   - Obtained the endpoint URL and API key for the connection.

3. **Generated `connection.yml` File**:
   - A Python script created a `connection.yml` file containing:
     - Connection name
     - Type
     - Endpoint URL
     - API key

4. **Testing with Azure SDK**:
   - Used the Azure SDK to test the chat model.

## 2. Resolving Azure Installation Error with Docker

An error occurred during the Azure installation. To fix this, Docker was used to create a consistent environment.

### Steps:

1. **Created a Dockerfile**:
   - Defined a `Dockerfile` with the necessary configuration.

2. **Built the Docker Image**:
   - Ran the command:
     ```bash
     docker build -t my_python_environment .
     ```

3. **Run the Docker Container**:
   - Executed the container with:
     ```bash
     docker run my_python_environment
     ```
   - The container outputs a response describing the height of Mount Everest.

## Next Steps: Implementing with Azure AI

- Planning to implement using Azure AI, which is more cost-effective and doesn't require running a virtual machine continuously.

- **Considerations**:
  - Verify if the model is available in your region.
  - Ensure your account has permissions to use the model.

- For simpler implementations, using `'gpt-35-turbo'` is recommended.

---

Feel free to explore and contribute to this repository.

---
