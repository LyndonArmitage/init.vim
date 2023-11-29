local conf = {
  openai_api_key = os.getenv("OPENAI_API_TOKEN")
}

require("gp").setup(conf)
