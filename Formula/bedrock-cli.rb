class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/microsoft/bedrock-cli/releases/download/v0.6.6/dist.tar.gz", :using => :curl
    sha256 "84674e06244634d019e32c8f39d8f73953b9968d82a2f9cec2c8d51873716660"
  
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