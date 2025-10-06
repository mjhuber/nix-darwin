{
  pkgs,
  filesDir,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe";
      editor = {
        line-number = "relative";
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys = {
        normal = {
          "$" = "goto_line_end";
          "^" = "goto_first_nonwhitespace";
        };
        select = {
          "$" = "goto_line_end";
          "^" = "goto_first_nonwhitespace";
        };
      };
    };
  };
}
