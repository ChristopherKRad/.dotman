:lua << EOF " Enable lua till end of file
require("toggleterm").setup{
    direction = "float",
    open_mapping = [[<c-o>]],
    hide_numbers = true,
    close_on_exit = true,
    float_opts = {
	border = "curved"
    },
}

