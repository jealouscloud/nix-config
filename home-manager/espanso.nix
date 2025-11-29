# Text completer espanso
{ pkgs }: {
services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    waylandSupport = true;
    configs = { default = { search_shortcut = "Alt+Shift+F"; }; };
    matches = {
      base = {
        matches = [
          {
            trigger = ":now";
            replace = "It's {{currentdate}} {{currenttime}}";
          }
          {
            trigger = ":hello";
            replace = ''
              line1
              line2'';
          }
          {
            regex = ":hi\\s+(?P<person>.*)\\.";
            replace = "Hi {{person}}!";
          }
          {
            trigger = ":form";
            replace =
              "Hey {{form1.name}}, how are you? Do you like {{form1.fruit}}?";
            vars = [{
              name = "form1";
              type = "form";
              params = {
                layout = ''
                  Name: [[name]]
                  Fruit: [[fruit]]
                '';
                fields = {
                  name = { multiline = true; };
                  fruit = {
                    type = "list";
                    values = [ "Apples" "Bananas" "Oranges" "Peaches" ];
                  };
                };
              };
            }];
          }
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = { format = "%d/%m/%Y"; };
          }
          {
            name = "currenttime";
            type = "date";
            params = { format = "%R"; };
          }
        ];
      };
    };
  };
}