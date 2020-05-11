class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/microsoft/bedrock-cli/releases/download/v0.6.5/dist.tar.gz", :using => :curl
    sha256 "32432b2a3ab1d984c67ed2330e37a7c6da7d6d8c09e5d09c434032cebdd4b058"
  
    depends_on "terraform"
    depends_on "helm" => "2.16.3"
    depends_on "azure-cli"
    depends_on "kubectl"
    
    def install
      if OS.mac?
        mv "./bedrock-macos", "./bedrock"
      elsif OS.linux?
        mv "./bedrock-linux", "./bedrock"
      end
      bin.install "./bedrock"
    end 

    test do
      # Run the test with `brew test bedrock-cli`.
      system "#{bin}/bedrock", "project", "init"
      assert File.file?("bedrock.yaml")
    end
  end