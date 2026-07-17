_: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    fontconfig = {
      antialias = true;
      allowBitmaps = true;
      allowType1 = false;
      includeUserConf = true;

      subpixel = {
        # rgba = "rgb";
        lcdfilter = "default";
      };

      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };
    };
  };
}
