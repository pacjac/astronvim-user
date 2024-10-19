local gen = require "gen"

gen.prompts["Pytest"] = {
  prompt = "Using the pytest framework, write a python test for the given function: $text. Assume that all imports are available, code only.",
  replace = false,
}

gen.prompts["Docstring"] = {
  prompt = "Create a python doctstring in google's docstring format for the function: $text",
  replace = false,
}

gen.prompts["FastAPI document endpoint"] = {
  prompt = 'Create a python docstring function in the following format """A summary sentence. \n -***Item1***: Explanation of Item1 \n -***Item2***: Explanation of Item2""" for the following function: $text',
  replace = false,
}

gen.prompts["Proofread"] = {
  prompt = "Proofread the following text: $text. Only output the result in markdown format.",
  --. Only output the result in format $filetype.
  replace = true,
}

gen.prompts["MarkdownFormat"] = {
  prompt = "Format the following text: $text. Only output the result in markdown format.",
  --. Only output the result in format $filetype.
  replace = true,
}
