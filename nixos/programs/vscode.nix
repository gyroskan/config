{ config, pkgs, lib,  ... }:

{
  environment.systemPackages = with pkgs; [
    vscode-fhs
    vscode-extensions.ms-vscode.cpptools
    vscode-extensions.ms-dotnettools.csharp
    vscode-extensions.golang.go
  ];

 # 
 # programs.vscode = {
 #   enable = true;

 #   extensions = (with pkgs.vscode-extensions; [
 #     ms-vscode.cpptools
 #   ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
 #     {
 #       name = "copilot";
 #       publisher = "Github";
 #       version = "1.6.3571";
 #       sha256 = "00sw75my466mzsrqjafzxbzv397vmlfafllbljvql6crxpl45v57";
 #     }
 #     {
 #       name = "vim";
 #       publisher = "vscodevim";
 #       version = "1.21.10";
 #       sha256 = "0c9m7mc2kmfzj3hkwq3d4hj43qha8a75q5r1rdf1xfx8wi5hhb1n";
 #     }
 #   ];
 # };
}

