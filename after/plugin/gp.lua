local conf = {
  openai_api_key = os.getenv("OPENAI_API_TOKEN"),
  chat_model = "gpt-3.5-turbo"
}

require("gp").setup(conf)
