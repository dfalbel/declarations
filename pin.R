# Register the board
pins::board_register_github(name = "declarations", repo = "dfalbel/declarations")

options("pins.github.release" = 0) # always write to release

# Pin file:
pins::pin(
  "pytorch/torch/share/ATen/Declarations.yaml", 
  Sys.getenv("VERSION"), 
  board = "declarations"
)
