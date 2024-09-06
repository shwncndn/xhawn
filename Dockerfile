# Use the official Elixir image from the Docker Hub
FROM elixir:1.17-alpine

# Install build dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git build-base && \
    mix local.hex --force && \
    mix local.rebar --force

# Set the working directory in the container
WORKDIR /app

# Install build dependencies, including ffmpeg
RUN apk add --no-cache build-base ffmpeg

# Copy the mix.exs and mix.lock files to the working directory
COPY mix.exs mix.lock ./

# Install Elixir and Erlang dependencies
RUN mix do deps.get, deps.compile

# Copy the rest of the application code to the working directory
COPY . .

# Copy the audio files to the /app/priv/audio directory in the Docker image
COPY priv/audio/greek.m4a priv/audio/japan.m4a /app/priv/audio/

# Compile the project
RUN mix compile

# Expose the port the application runs on (if your bot runs a web server, for example)
EXPOSE 4000

# Start the bot (assuming your bot’s entry point is in lib/xhawn/bot.ex)
CMD ["mix", "run", "--no-halt"]
