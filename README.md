# README: Documenting My Backend Development Journey 🚀✨

## Table of Contents 📚

- [README: Documenting My Backend Development Journey 🚀✨](#readme-documenting-my-backend-development-journey-)
  - [Table of Contents 📚](#table-of-contents-)
  - [Introduction 🌟](#introduction-)
  - [Azure Machine Learning ☁️🤖](#azure-machine-learning-️)
  - [Docker 🐳](#docker-)
  - [PostgreSQL 🗄️🐘](#postgresql-️)
  - [Qdrant 🧠📊](#qdrant-)
  - [RAG (Retrieval-Augmented Generation) 📄➕🔍](#rag-retrieval-augmented-generation-)
  - [Tools and Templates 🛠️📑](#tools-and-templates-️)
  - [VS Code Tips and Tricks 💻✨](#vs-code-tips-and-tricks-)
    - [Conclusion 🎉](#conclusion-)

## Introduction 🌟

Welcome to my backend development journey! 🎢 This project is all about documenting my growth and learning as I dive into the backend world. Like any good journey, this one has its ups and downs, peaks and valleys, but that's all part of the fun. The structure of this repository grows as I learn new things, adding new folders and files along the way. 📂💡

The organization here is fluid and constantly evolving, reflecting the areas I'm exploring in backend development. Let's grow and learn together! 🌱

## Azure Machine Learning ☁️🤖

The **Azure** folder contains my work on implementing Azure Machine Learning models. While there's an easy implementation in the [Langchain Azure documentation](https://python.langchain.com/docs/integrations/llms/azure_openai/), I wanted more of a challenge. So, I tried connecting to an Azure virtual machine, and I've documented the entire process. This pushed me to learn more about setting up custom environments and tackling complex technical issues. 🚀💪

## Docker 🐳

In the **Docker** folder, you'll find the initial setup to work with Docker from VS Code. I documented how to create the basic configuration files needed to get containers up and running effectively. It's all about making Docker setups as smooth as possible. 🛠️✨

## PostgreSQL 🗄️🐘

The **PostgreSQL** section contains the configuration for setting up a PostgreSQL database. While connecting to a database is usually straightforward, I decided to use Pydantic and SQLAlchemy, which added a layer of complexity. I documented every step—from using SQL commands to transitioning to PostgreSQL, with tools like Adminer and Alembic to manage migrations. 📊

Highlights:

- Created a `pre_start.sql` file to generate the `mydatabase.db` base.
- Managed both manual and automated migrations with Alembic. 🔄

## Qdrant 🧠📊

The **Qdrant** folder shows the process of starting a collection in Qdrant and adding data using embeddings. Everything here is done with mock data to avoid exposing sensitive information. I documented the current state of Qdrant's methods using Langchain (as of October 24th). 📅

You'll find two `.md` files in this folder that explain:

1. The current configuration of Qdrant and Langchain.
2. The steps to test the connection to our Qdrant collection. 🛠️

## RAG (Retrieval-Augmented Generation) 📄➕🔍

In the **RAG** folder, Docker Compose was used to simplify the implementation of a RAG process. The steps of this process include:

- Loading a PDF file. 📄
- Creating JSON files. 🗂️
- Creating embeddings while enriching them with metadata. 💾
- Storing everything in Qdrant. 📥

This approach is a bit different since Qdrant is generally used for processing text chunks. I documented how I adapted Qdrant to store enriched entities—something not often found in typical documentation. We're blazing a trail here! 🚀🔥

## Tools and Templates 🛠️📑

The **tools** folder contains three sub-sections:

1. **Cyber Skills**: Information on tools that are useful in cybersecurity and analysis. 🛡️
2. **Example Templates**: Templates that can be used to test the entity extraction capabilities of a model. 📋
3. **Entity Extraction**: A direct example of extracting entities using an Azure LLM, with guided inputs to make sure the model knows what to do. It's like supervised learning but for entities! 👨‍🏫✨

## VS Code Tips and Tricks 💻✨

In the **vs-code** folder, I've documented various tweaks and useful tricks for working with repositories and common tools:

- Avoiding infinite commits when forking a repository. 🔄❌
- How to add alternative models to OpenAI across most frameworks. 🤖
- How to manually tweak libraries inside the `pyproject.toml` file. ⚙️
- Setting up Qdrant for first-time use. 🚀

---

### Conclusion 🎉
This repository is a reflection of my progress and growth in the world of backend development and machine learning. Each folder tells the story of a challenge faced and a lesson learned. My goal is not just to learn, but also to inspire other developers to tackle complex problems and enjoy the journey of learning. 💪💡

If this journey can help you in your path, feel free to explore, contribute, and ask questions. Let's learn more together! 🤝🌍 Thanks for stopping by! 🙌🚀