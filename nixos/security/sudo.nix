{kmsconSession, ...}: {
  security = {
    sudo.enable = false;

    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;

      extraRules = [
        # Allow execution of specific command by all users in group wheel without password
        {
          groups = ["wheel"];
          commands = [
            {
              command = "${kmsconSession}";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}
