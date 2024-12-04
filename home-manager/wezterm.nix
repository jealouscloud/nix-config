{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
    -- Pull in the wezterm API
    local wezterm = require 'wezterm'

    -- This will hold the configuration.
    local config = wezterm.config_builder()
    local act = wezterm.action

    -- This is where you actually apply your config choices
    -- bugfix: Default renderer broke on nixos 24.11
    config.front_end = "WebGpu"
    -- Pretty things
    config.color_scheme = 'AdventureTime'
    config.color_scheme = "Dracula (Official)"
    config.window_decorations = "RESIZE"
    -- config.font = wezterm.font 'Berkeley Mono Variable',

    config.use_fancy_tab_bar = false
    -- Selection
    config.selection_word_boundary =  " @\t\n{}[]()\"'`,.?%&#/|"

    config.mouse_bindings = {

      -- Change the default click behavior so that it only selects
      -- text and doesn't open hyperlinks
      {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
      },

      -- and make CTRL-Click open hyperlinks
      {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
      },
      -- page scrolling
      {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'SHIFT',
        action = act.ScrollByPage(1),
      },

      {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'SHIFT',
        action = act.ScrollByPage(-1),
      },
    }


    config.keys = {
      -- This will create a new split and run your default program inside it
      {
        key = 'Enter',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
      },
      {
          key = 'Enter',
          mods = 'CTRL|ALT',
          action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
      }
    }

    config.window_background_gradient = {
      -- Can be "Vertical" or "Horizontal".  Specifies the direction
      -- in which the color gradient varies.  The default is "Horizontal",
      -- with the gradient going from left-to-right.
      -- Linear and Radial gradients are also supported; see the other
      -- examples below
      orientation = 'Vertical',

      -- Specifies the set of colors that are interpolated in the gradient.
      -- Accepts CSS style color specs, from named colors, through rgb
      -- strings and more
      colors = {
        -- '#020024',
        -- '#3c0054',
           '#252630', -- dracula
           '#020034',
      },

      -- Instead of specifying `colors`, you can use one of a number of
      -- predefined, preset gradients.
      -- A list of presets is shown in a section below.
      -- preset = "Warm",

      -- Specifies the interpolation style to be used.
      -- "Linear", "Basis" and "CatmullRom" as supported.
      -- The default is "Linear".
      interpolation = 'Linear',

      -- How the colors are blended in the gradient.
      -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
      -- The default is "Rgb".
      blend = 'Rgb',

      -- To avoid vertical color banding for horizontal gradients, the
      -- gradient position is randomly shifted by up to the `noise` value
      -- for each pixel.
      -- Smaller values, or 0, will make bands more prominent.
      -- The default value is 64 which gives decent looking results
      -- on a retina macbook pro display.
      -- noise = 64,

      -- By default, the gradient smoothly transitions between the colors.
      -- You can adjust the sharpness by specifying the segment_size and
      -- segment_smoothness parameters.
      -- segment_size configures how many segments are present.
      -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
      -- 1.0 is a soft edge.

      -- segment_size = 11,
      -- segment_smoothness = 0.0,
    }


    config.enable_scroll_bar = true

    -- Disable mailto by specifying rules myself
    config.hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
        regex = '\\((\\w+://\\S+)\\)',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
        regex = '\\[(\\w+://\\S+)\\]',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
        regex = '\\{(\\w+://\\S+)\\}',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
        regex = '<(\\w+://\\S+)>',
        format = '$1',
        highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
        regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
        format = '$0',
      }
    }
    -- and finally, return the configuration to wezterm
    return config

    '';

  };
}